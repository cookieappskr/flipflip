import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';
import { issueBillingKey, executeBillingPayment } from '@/lib/payments/toss';
import { PLANS } from '@/lib/payments/constants';
import type { PlanType } from '@/types/database';

export async function POST(request: NextRequest) {
  try {
    // Auth check
    const supabase = createServerSupabaseClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

    const { authKey, customerKey, planType } = await request.json() as {
      authKey: string; customerKey: string; planType: PlanType;
    };

    if (!authKey || !customerKey || !planType || !PLANS[planType]) {
      return NextResponse.json({ error: 'Invalid parameters' }, { status: 400 });
    }

    const plan = PLANS[planType];

    // 1. Issue billing key
    const billingResult = await issueBillingKey(authKey, customerKey);
    const billingKey = billingResult.billingKey;

    // 2. Execute first payment
    const orderId = `FLIP_${user.id.slice(0, 8)}_${Date.now()}`;
    const paymentResult = await executeBillingPayment({
      billingKey,
      customerKey,
      orderId,
      amount: plan.amount,
      orderName: `FlipFlip ${plan.name}`,
    });

    // 3. Store in DB using admin client (bypasses RLS)
    const admin = createAdminClient();

    // Calculate period
    const now = new Date();
    const periodEnd = new Date(now);
    periodEnd.setDate(periodEnd.getDate() + plan.intervalDays);
    const nextBilling = new Date(periodEnd);

    // Create payment history
    const { data: payment } = await admin.from('payment_history').insert({
      user_id: user.id,
      payment_key: paymentResult.paymentKey,
      order_id: orderId,
      amount: plan.amount,
      status: 'paid',
      billing_key: billingKey,
      receipt_url: paymentResult.receipt?.url || null,
      paid_at: new Date().toISOString(),
    }).select().single();

    // Create or update subscription
    const { data: existingSub } = await admin.from('subscriptions')
      .select('id')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })
      .limit(1)
      .single();

    let subscription;
    if (existingSub) {
      const { data } = await admin.from('subscriptions')
        .update({
          plan_type: planType,
          status: 'active',
          payment_provider: 'toss',
          billing_key: billingKey,
          current_period_start: now.toISOString(),
          current_period_end: periodEnd.toISOString(),
          next_billing_date: nextBilling.toISOString(),
          auto_renew: true,
          cancelled_at: null,
          last_payment_id: payment?.id,
        })
        .eq('id', existingSub.id)
        .select()
        .single();
      subscription = data;
    } else {
      const { data } = await admin.from('subscriptions')
        .insert({
          user_id: user.id,
          plan_type: planType,
          status: 'active',
          payment_provider: 'toss',
          billing_key: billingKey,
          current_period_start: now.toISOString(),
          current_period_end: periodEnd.toISOString(),
          next_billing_date: nextBilling.toISOString(),
          auto_renew: true,
          last_payment_id: payment?.id,
        })
        .select()
        .single();
      subscription = data;
    }

    // Update payment with subscription_id
    if (payment && subscription) {
      await admin.from('payment_history')
        .update({ subscription_id: subscription.id })
        .eq('id', payment.id);
    }

    return NextResponse.json({ success: true, subscription });
  } catch (error: unknown) {
    const message = error instanceof Error ? error.message : 'Payment failed';
    console.error('Payment error:', error);
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
