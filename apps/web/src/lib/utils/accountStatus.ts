import { SupabaseClient } from '@supabase/supabase-js';

export type AccountStatus = 'active' | 'reactivated' | 'pending_deletion' | 'deleted' | null;

/**
 * Check user account status and auto-reactivate dormant accounts on login.
 * Called during auth flow / page load.
 */
export async function checkAndReactivateAccount(
  supabase: SupabaseClient,
  userId: string,
): Promise<AccountStatus> {
  const { data: user } = await supabase
    .from('users')
    .select('dormant_at, deleted_at, is_active')
    .eq('id', userId)
    .single();

  if (!user) return null;

  // Auto-reactivate dormant user on login
  if (user.dormant_at && !user.deleted_at) {
    await supabase
      .from('users')
      .update({ dormant_at: null, is_active: true })
      .eq('id', userId);
    return 'reactivated';
  }

  // Check if account is pending deletion
  if (user.deleted_at) {
    const deleteDate = new Date(user.deleted_at);
    deleteDate.setDate(deleteDate.getDate() + 30);
    if (new Date() < deleteDate) {
      return 'pending_deletion';
    }
    return 'deleted';
  }

  return 'active';
}
