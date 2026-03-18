import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

const EXCHANGE_POINTS = 5000;
const EXCHANGE_DAYS = 7;

export async function POST(request: NextRequest) {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  // Get current balance
  const { data: lastTx } = await supabase
    .from('mileage_transactions')
    .select('balance_after')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  const currentBalance = lastTx?.balance_after || 0;

  if (currentBalance < EXCHANGE_POINTS) {
    return NextResponse.json(
      { error: `마일리지가 부족합니다. (현재: ${currentBalance}pt / 필요: ${EXCHANGE_POINTS}pt)` },
      { status: 400 }
    );
  }

  const newBalance = currentBalance - EXCHANGE_POINTS;

  // Create mileage deduction transaction
  const { error: txError } = await supabase
    .from('mileage_transactions')
    .insert({
      user_id: user.id,
      amount: -EXCHANGE_POINTS,
      balance_after: newBalance,
      transaction_type: 'exchange',
      description: `${EXCHANGE_DAYS}일 학습권으로 교환`,
    });

  if (txError) {
    return NextResponse.json({ error: 'Transaction failed' }, { status: 500 });
  }

  // Create coupon
  const expiresAt = new Date();
  expiresAt.setMonth(expiresAt.getMonth() + 3); // 3 months to use

  const { error: couponError } = await supabase
    .from('coupons')
    .insert({
      user_id: user.id,
      coupon_type: 'mileage_exchange',
      benefit_type: 'subscription',
      benefit_days: EXCHANGE_DAYS,
      expires_at: expiresAt.toISOString(),
    });

  if (couponError) {
    // Rollback mileage
    await supabase.from('mileage_transactions').insert({
      user_id: user.id,
      amount: EXCHANGE_POINTS,
      balance_after: currentBalance,
      transaction_type: 'exchange_rollback',
      description: '쿠폰 발급 실패로 마일리지 환원',
    });
    return NextResponse.json({ error: 'Coupon creation failed' }, { status: 500 });
  }

  return NextResponse.json({
    success: true,
    newBalance,
    couponDays: EXCHANGE_DAYS,
    message: `${EXCHANGE_DAYS}일 학습권 쿠폰이 발급되었습니다.`,
  });
}
