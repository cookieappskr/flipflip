import type { SupabaseClient } from '@supabase/supabase-js';

export type EffectiveSubscriptionStatus = 'trial' | 'active' | 'expired' | 'no_subscription';

export interface SubscriptionCheckResult {
  status: EffectiveSubscriptionStatus;
  isLimited: boolean;
  dailySentenceLimit: number | null; // null = unlimited
  trialDaysRemaining: number | null;
  trialTotalDays: number | null;
}

const DAILY_SENTENCE_LIMIT_FREE = 10;

export async function checkSubscriptionStatus(
  supabase: SupabaseClient,
  userId: string
): Promise<SubscriptionCheckResult> {
  const { data: sub } = await supabase
    .from('subscriptions')
    .select('status, trial_start_at, trial_end_at, current_period_start, current_period_end, auto_renew, cancelled_at')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  if (!sub) {
    return { status: 'no_subscription', isLimited: true, dailySentenceLimit: DAILY_SENTENCE_LIMIT_FREE, trialDaysRemaining: null, trialTotalDays: null };
  }

  const now = new Date();

  // Active paid subscription
  if (sub.status === 'active' && sub.current_period_end && new Date(sub.current_period_end) > now) {
    return { status: 'active', isLimited: false, dailySentenceLimit: null, trialDaysRemaining: null, trialTotalDays: null };
  }

  // Trial period
  if (sub.status === 'trial' && sub.trial_end_at) {
    const trialEnd = new Date(sub.trial_end_at);
    if (trialEnd > now) {
      const daysRemaining = Math.ceil((trialEnd.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
      const trialStart = sub.trial_start_at ? new Date(sub.trial_start_at) : now;
      const trialTotalDays = Math.round((trialEnd.getTime() - trialStart.getTime()) / (1000 * 60 * 60 * 24));
      return { status: 'trial', isLimited: false, dailySentenceLimit: null, trialDaysRemaining: daysRemaining, trialTotalDays };
    }
  }

  // Expired
  return { status: 'expired', isLimited: true, dailySentenceLimit: DAILY_SENTENCE_LIMIT_FREE, trialDaysRemaining: null, trialTotalDays: null };
}

/**
 * Get today's check count for a user (used for daily sentence limit)
 */
export async function getTodayCheckCount(
  supabase: SupabaseClient,
  userId: string
): Promise<number> {
  const todayStart = new Date();
  todayStart.setHours(0, 0, 0, 0);

  const { count } = await supabase
    .from('user_sentence_scores')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)
    .gte('last_checked_at', todayStart.toISOString());

  return count || 0;
}
