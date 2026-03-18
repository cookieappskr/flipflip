import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';

export async function POST(request: NextRequest) {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { subscriptionId } = await request.json();

  // Verify ownership
  const { data: sub } = await supabase.from('subscriptions')
    .select('*').eq('id', subscriptionId).eq('user_id', user.id).single();

  if (!sub) return NextResponse.json({ error: 'Subscription not found' }, { status: 404 });
  if (sub.status !== 'active') return NextResponse.json({ error: 'Not active' }, { status: 400 });

  // Cancel - keep service until period end
  const admin = createAdminClient();
  await admin.from('subscriptions')
    .update({ auto_renew: false, cancelled_at: new Date().toISOString() })
    .eq('id', subscriptionId);

  return NextResponse.json({ success: true, message: 'Cancelled. Service continues until period end.' });
}
