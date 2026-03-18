import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { data: subscription } = await supabase.from('subscriptions')
    .select('*')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  // Check if trial expired or subscription expired
  let effectiveStatus = subscription?.status || null;
  if (subscription) {
    const now = new Date();
    if (subscription.status === 'trial' && subscription.trial_end_at && new Date(subscription.trial_end_at) < now) {
      effectiveStatus = 'expired';
    }
    if (subscription.status === 'active' && subscription.current_period_end && new Date(subscription.current_period_end) < now) {
      effectiveStatus = 'expired';
    }
  }

  // Get payment history
  const { data: payments } = await supabase.from('payment_history')
    .select('id, amount, status, paid_at, receipt_url')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(10);

  return NextResponse.json({
    subscription: subscription ? { ...subscription, effective_status: effectiveStatus } : null,
    payments: payments || [],
  });
}
