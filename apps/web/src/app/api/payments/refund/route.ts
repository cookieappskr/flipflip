import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';
import { cancelPayment } from '@/lib/payments/toss';
import { REFUND_PERIOD_DAYS } from '@/lib/payments/constants';

export async function POST(request: NextRequest) {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { subscriptionId } = await request.json();

  const { data: sub } = await supabase.from('subscriptions')
    .select('*').eq('id', subscriptionId).eq('user_id', user.id).single();

  if (!sub) return NextResponse.json({ error: 'Not found' }, { status: 404 });

  // Check refund period
  const subscribedAt = new Date(sub.current_period_start!);
  const refundDeadline = new Date(subscribedAt);
  refundDeadline.setDate(refundDeadline.getDate() + REFUND_PERIOD_DAYS);

  if (new Date() > refundDeadline) {
    return NextResponse.json({ error: '환불 가능 기간(7일)이 지났습니다.' }, { status: 400 });
  }

  // Get latest payment to refund
  const admin = createAdminClient();
  const { data: payment } = await admin.from('payment_history')
    .select('*')
    .eq('subscription_id', sub.id)
    .eq('status', 'paid')
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  if (!payment || !payment.payment_key) {
    return NextResponse.json({ error: 'No refundable payment found' }, { status: 400 });
  }

  // Call TossPayments cancel API
  await cancelPayment(payment.payment_key, '청약 철회 (7일 이내)');

  // Update DB
  await admin.from('payment_history').update({
    status: 'refunded',
    refunded_amount: payment.amount,
    refunded_at: new Date().toISOString(),
  }).eq('id', payment.id);

  await admin.from('subscriptions').update({
    status: 'expired',
    auto_renew: false,
    cancelled_at: new Date().toISOString(),
  }).eq('id', sub.id);

  return NextResponse.json({ success: true, refundAmount: payment.amount });
}
