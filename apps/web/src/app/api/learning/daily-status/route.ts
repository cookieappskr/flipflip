import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { checkSubscriptionStatus, getTodayCheckCount } from '@/lib/utils/subscriptionCheck';

export async function GET() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  // Get subscription status
  const subStatus = await checkSubscriptionStatus(supabase, user.id);

  // Get today's check count
  const todayCheckCount = await getTodayCheckCount(supabase, user.id);

  // Get daily goal info
  const { data: profile } = await supabase
    .from('user_profiles')
    .select('daily_goal_type_id, learning_language')
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

  const isDailyComplete = todayCheckCount >= minCheckCount;

  // Get this week's completed days (for WeekStreak)
  const weekStart = new Date();
  weekStart.setDate(weekStart.getDate() - weekStart.getDay());
  weekStart.setHours(0, 0, 0, 0);

  // Query daily_learning_completions or derive from user_sentence_scores
  // We'll use a simple approach: group check counts by date this week
  const { data: weekScores } = await supabase
    .from('user_sentence_scores')
    .select('last_checked_at')
    .eq('user_id', user.id)
    .gte('last_checked_at', weekStart.toISOString())
    .order('last_checked_at');

  // Count checks per day
  const dayCounts = new Map<string, number>();
  for (const score of weekScores || []) {
    if (!score.last_checked_at) continue;
    const dayKey = new Date(score.last_checked_at).toISOString().split('T')[0];
    dayCounts.set(dayKey, (dayCounts.get(dayKey) || 0) + 1);
  }

  // Days where check count >= minCheckCount
  const completedDays = [...dayCounts.entries()]
    .filter(([, count]) => count >= minCheckCount)
    .map(([day]) => day);

  // Calculate current streak
  let streak = 0;
  const today = new Date().toISOString().split('T')[0];
  const checkDate = new Date();

  // Check backward from today/yesterday
  if (!completedDays.includes(today)) {
    checkDate.setDate(checkDate.getDate() - 1);
  }

  while (true) {
    const key = checkDate.toISOString().split('T')[0];
    if (completedDays.includes(key) || dayCounts.has(key) && (dayCounts.get(key) || 0) >= minCheckCount) {
      streak++;
      checkDate.setDate(checkDate.getDate() - 1);
    } else {
      break;
    }
  }

  // Get mileage balance
  const { data: lastMileage } = await supabase
    .from('mileage_transactions')
    .select('balance_after')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  return NextResponse.json({
    subscription: subStatus,
    todayCheckCount,
    minCheckCount,
    isDailyComplete,
    completedDays,
    streak,
    mileageBalance: lastMileage?.balance_after || 0,
    learningLanguage: profile?.learning_language || 'en',
  });
}
