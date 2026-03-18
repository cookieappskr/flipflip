import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

/**
 * POST /api/learning/complete
 * Called when user reaches daily check goal. Awards mileage and checks streak bonuses.
 */
export async function POST() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  // Get mileage policy from policy_settings
  const { data: policies } = await supabase
    .from('policy_settings')
    .select('key, value')
    .in('key', [
      'daily_complete_mileage',
      'streak_3_mileage',
      'streak_10_mileage',
      'streak_30_mileage',
    ]);

  const policyMap = new Map((policies || []).map((p) => [p.key, parseInt(p.value, 10)]));
  const dailyMileage = policyMap.get('daily_complete_mileage') || 10;
  const streak3Mileage = policyMap.get('streak_3_mileage') || 30;
  const streak10Mileage = policyMap.get('streak_10_mileage') || 200;
  const streak30Mileage = policyMap.get('streak_30_mileage') || 500;

  // Check if already awarded today
  const todayStart = new Date();
  todayStart.setHours(0, 0, 0, 0);

  const { data: existingAward } = await supabase
    .from('mileage_transactions')
    .select('id')
    .eq('user_id', user.id)
    .eq('transaction_type', 'daily_complete')
    .gte('created_at', todayStart.toISOString())
    .limit(1)
    .single();

  if (existingAward) {
    return NextResponse.json({ alreadyAwarded: true, message: '오늘은 이미 일학습 보상을 받았습니다.' });
  }

  // Get current balance
  const { data: lastTx } = await supabase
    .from('mileage_transactions')
    .select('balance_after')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  let balance = lastTx?.balance_after || 0;
  const awards: Array<{ type: string; amount: number; description: string }> = [];

  // Daily completion award
  balance += dailyMileage;
  awards.push({ type: 'daily_complete', amount: dailyMileage, description: '일학습 완료' });

  // Calculate streak (count consecutive days backward from today)
  const { data: profile } = await supabase
    .from('user_profiles')
    .select('daily_goal_type_id')
    .eq('user_id', user.id)
    .single();

  let minCheckCount = 10;
  if (profile?.daily_goal_type_id) {
    const { data: goalType } = await supabase
      .from('types')
      .select('extra_attr_1')
      .eq('id', profile.daily_goal_type_id)
      .single();
    if (goalType?.extra_attr_1) {
      minCheckCount = parseInt(goalType.extra_attr_1, 10);
    }
  }

  // Count streak by checking daily_complete mileage transactions
  const { data: completions } = await supabase
    .from('mileage_transactions')
    .select('created_at')
    .eq('user_id', user.id)
    .eq('transaction_type', 'daily_complete')
    .order('created_at', { ascending: false })
    .limit(31);

  // Count consecutive days (including today which we're about to add)
  let streak = 1; // Today counts
  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);

  for (const comp of completions || []) {
    const compDate = new Date(comp.created_at).toISOString().split('T')[0];
    const expectedDate = new Date(yesterday);
    expectedDate.setDate(expectedDate.getDate() - (streak - 1));
    const expectedKey = expectedDate.toISOString().split('T')[0];

    if (compDate === expectedKey) {
      streak++;
    } else {
      break;
    }
  }

  // Check streak bonuses (only award if hitting the exact milestone)
  // Also check if bonus was already given for this streak
  const checkStreakBonus = async (days: number, amount: number, txType: string) => {
    if (streak !== days) return;

    const { data: existing } = await supabase
      .from('mileage_transactions')
      .select('id')
      .eq('user_id', user.id)
      .eq('transaction_type', txType)
      .gte('created_at', new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString())
      .limit(1)
      .single();

    if (!existing) {
      balance += amount;
      awards.push({ type: txType, amount, description: `${days}일 연속 학습 보너스` });
    }
  };

  await checkStreakBonus(3, streak3Mileage, 'streak_3');
  await checkStreakBonus(10, streak10Mileage, 'streak_10');
  await checkStreakBonus(30, streak30Mileage, 'streak_30');

  // Insert all mileage transactions
  let runningBalance = (lastTx?.balance_after || 0);
  for (const award of awards) {
    runningBalance += award.amount;
    await supabase.from('mileage_transactions').insert({
      user_id: user.id,
      amount: award.amount,
      balance_after: runningBalance,
      transaction_type: award.type,
      description: award.description,
    });
  }

  return NextResponse.json({
    success: true,
    awards,
    totalAwarded: awards.reduce((sum, a) => sum + a.amount, 0),
    newBalance: runningBalance,
    streak,
  });
}
