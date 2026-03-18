import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { createAdminClient } from '@/lib/supabase/admin';

export async function POST(request: NextRequest) {
  const supabase = createServerSupabaseClient();

  // Verify the caller is authenticated
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { userId } = await request.json();
  const targetUserId = userId || user.id;

  // Use admin client to bypass RLS for coupon issuance
  const admin = createAdminClient();

  // Get the new user's profile to find referrer_id
  const { data: profile } = await admin
    .from('user_profiles')
    .select('user_id, nickname, referrer_id')
    .eq('user_id', targetUserId)
    .single();

  if (!profile || !profile.referrer_id) {
    return NextResponse.json({ processed: false, reason: 'No referrer' });
  }

  // referrer_id stores the referrer's user_id
  const referrerId = profile.referrer_id;

  // Get referrer profile to verify they exist
  const { data: referrer } = await admin
    .from('user_profiles')
    .select('user_id, nickname')
    .eq('user_id', referrerId)
    .single();

  if (!referrer) {
    return NextResponse.json({ processed: false, reason: 'Referrer not found' });
  }

  // Check referral count hasn't exceeded 5
  const { count } = await admin
    .from('user_profiles')
    .select('*', { count: 'exact', head: true })
    .eq('referrer_id', referrerId);

  if ((count || 0) > 5) {
    return NextResponse.json({ processed: false, reason: 'Referral limit exceeded' });
  }

  // Issue 7-day coupons to both users
  const now = new Date();
  const expiresAt = new Date(now);
  expiresAt.setDate(expiresAt.getDate() + 90); // Coupon expires in 90 days

  const couponBase = {
    coupon_type: 'referral',
    benefit_type: 'subscription',
    benefit_days: 7,
    issued_at: now.toISOString(),
    expires_at: expiresAt.toISOString(),
    is_used: false,
    created_at: now.toISOString(),
    updated_at: now.toISOString(),
  };

  // Insert coupon for referrer
  const { error: referrerCouponError } = await admin
    .from('coupons')
    .insert({ ...couponBase, user_id: referrer.user_id });

  if (referrerCouponError) {
    console.error('[Referral] Failed to issue referrer coupon:', referrerCouponError.message);
    return NextResponse.json({ error: '쿠폰 발급 중 오류가 발생했습니다.' }, { status: 500 });
  }

  // Insert coupon for referred user
  const { error: referredCouponError } = await admin
    .from('coupons')
    .insert({ ...couponBase, user_id: profile.user_id });

  if (referredCouponError) {
    console.error('[Referral] Failed to issue referred coupon:', referredCouponError.message);
    return NextResponse.json({ error: '쿠폰 발급 중 오류가 발생했습니다.' }, { status: 500 });
  }

  return NextResponse.json({
    processed: true,
    referrerNickname: referrer.nickname,
    referredNickname: profile.nickname,
  });
}
