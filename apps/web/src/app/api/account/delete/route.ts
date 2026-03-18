import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';

export async function POST() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const admin = createAdminClient();
  const now = new Date().toISOString();

  // Soft-delete: set deleted_at and deactivate
  const { error: updateError } = await admin
    .from('users')
    .update({ deleted_at: now, is_active: false })
    .eq('id', user.id);

  if (updateError) {
    return NextResponse.json({ error: 'Failed to delete account' }, { status: 500 });
  }

  // If active subscription with auto_renew, disable auto-renewal
  const { data: activeSub } = await admin
    .from('subscriptions')
    .select('id, auto_renew')
    .eq('user_id', user.id)
    .eq('status', 'active')
    .eq('auto_renew', true)
    .limit(1)
    .single();

  if (activeSub) {
    await admin
      .from('subscriptions')
      .update({ auto_renew: false })
      .eq('id', activeSub.id);
  }

  const deleteScheduledAt = new Date();
  deleteScheduledAt.setDate(deleteScheduledAt.getDate() + 30);

  return NextResponse.json({
    success: true,
    deleteScheduledAt: deleteScheduledAt.toISOString(),
  });
}
