import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';
import { createAdminClient } from '@/lib/supabase/admin';

export async function POST(request: Request) {
  const cookieStore = cookies();
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() { return cookieStore.getAll(); },
        setAll(cookiesToSet: { name: string; value: string; options: CookieOptions }[]) {
          try { cookiesToSet.forEach(({ name, value, options }) => cookieStore.set(name, value, options)); } catch {}
        },
      },
    }
  );

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { nickname, birth_date, mother_tongue, learning_language, daily_goal_type_id, referrer_nickname } = body;

  // Validate required fields
  if (!nickname || nickname.length < 2 || nickname.length > 16) {
    return NextResponse.json({ error: '닉네임은 2~16자여야 합니다.' }, { status: 400 });
  }

  // Look up referrer by nickname if provided
  let referrer_id: string | null = null;
  if (referrer_nickname) {
    const { data: referrer } = await supabase
      .from('user_profiles')
      .select('user_id')
      .eq('nickname', referrer_nickname)
      .single();

    if (referrer) {
      // Check referral count limit (max 5)
      const { count: referralCount } = await supabase
        .from('user_profiles')
        .select('*', { count: 'exact', head: true })
        .eq('referrer_id', referrer.user_id);

      if ((referralCount || 0) < 5) {
        referrer_id = referrer.user_id;
      }
      // If limit exceeded, silently skip referral (don't block registration)
    }
  }

  // Insert into users table
  const { error: userError } = await supabase
    .from('users')
    .insert({
      id: user.id,
      auth_email: user.email,
      role: 'user',
      is_active: true,
    });

  if (userError) {
    console.error('[Register] users insert error:', userError.message);
    return NextResponse.json({ error: '가입 처리 중 오류가 발생했습니다.' }, { status: 500 });
  }

  // Insert into user_profiles
  const { error: profileError } = await supabase
    .from('user_profiles')
    .insert({
      user_id: user.id,
      nickname,
      email: user.email,
      birth_date: birth_date || null,
      mother_tongue: mother_tongue || null,
      learning_language: learning_language || null,
      daily_goal_type_id: daily_goal_type_id || null,
      referrer_id,
      current_level: 1,
    });

  if (profileError) {
    console.error('[Register] user_profiles insert error:', profileError.message);
    return NextResponse.json({ error: '프로필 생성 중 오류가 발생했습니다.' }, { status: 500 });
  }

  // Create trial subscription (30 days)
  const now = new Date();
  const trialEnd = new Date(now);
  trialEnd.setDate(trialEnd.getDate() + 30);

  await supabase.from('subscriptions').insert({
    user_id: user.id,
    plan_type: 'trial',
    status: 'trial',
    trial_start_at: now.toISOString(),
    trial_end_at: trialEnd.toISOString(),
    auto_renew: false,
  });

  // Process referral coupons if a valid referrer was set
  if (referrer_id) {
    try {
      const admin = createAdminClient();
      const couponExpiresAt = new Date(now);
      couponExpiresAt.setDate(couponExpiresAt.getDate() + 90);

      const couponBase = {
        coupon_type: 'referral',
        benefit_type: 'subscription',
        benefit_days: 7,
        issued_at: now.toISOString(),
        expires_at: couponExpiresAt.toISOString(),
        is_used: false,
        created_at: now.toISOString(),
        updated_at: now.toISOString(),
      };

      // Issue coupon to referrer
      await admin.from('coupons').insert({ ...couponBase, user_id: referrer_id });

      // Issue coupon to new user
      await admin.from('coupons').insert({ ...couponBase, user_id: user.id });
    } catch (err) {
      // Log but don't fail registration if coupon issuance fails
      console.error('[Register] Referral coupon issuance error:', err);
    }
  }

  return NextResponse.json({ success: true });
}
