import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';

export async function POST() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const admin = createAdminClient();

  // Verify the account is actually pending deletion
  const { data: userData } = await admin
    .from('users')
    .select('deleted_at')
    .eq('id', user.id)
    .single();

  if (!userData?.deleted_at) {
    return NextResponse.json({ error: 'Account is not pending deletion' }, { status: 400 });
  }

  // Cancel deletion: clear deleted_at and reactivate
  const { error: updateError } = await admin
    .from('users')
    .update({ deleted_at: null, is_active: true })
    .eq('id', user.id);

  if (updateError) {
    return NextResponse.json({ error: 'Failed to cancel deletion' }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
