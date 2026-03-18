import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = createServerSupabaseClient();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  // Get current user's profile
  const { data: profile } = await supabase
    .from('user_profiles')
    .select('user_id, nickname')
    .eq('user_id', user.id)
    .single();

  if (!profile) {
    return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
  }

  // Count users who were referred by this user
  const { data: referredUsers, count } = await supabase
    .from('user_profiles')
    .select('nickname', { count: 'exact' })
    .eq('referrer_id', user.id);

  return NextResponse.json({
    referralCode: profile.nickname,
    referralCount: count || 0,
    maxReferrals: 5,
    referredUsers: (referredUsers || []).map((u) => u.nickname),
  });
}
