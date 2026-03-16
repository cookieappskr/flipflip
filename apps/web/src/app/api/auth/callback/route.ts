import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get('code');

  console.log('[Auth Callback] ===== START =====');
  console.log('[Auth Callback] origin:', origin);
  console.log('[Auth Callback] code present:', !!code);

  if (!code) {
    console.log('[Auth Callback] No code in URL, redirecting to login');
    return NextResponse.redirect(`${origin}/login?error=auth_failed`);
  }

  const cookieStore = cookies();
  const allCookies = cookieStore.getAll();
  console.log('[Auth Callback] Cookie count:', allCookies.length);
  console.log('[Auth Callback] Cookie names:', allCookies.map(c => c.name).join(', '));

  // Check for PKCE verifier cookie
  const verifierCookie = allCookies.find(c => c.name.includes('code-verifier') || c.name.includes('code_verifier'));
  console.log('[Auth Callback] PKCE verifier cookie found:', !!verifierCookie);
  if (verifierCookie) {
    console.log('[Auth Callback] Verifier cookie name:', verifierCookie.name);
    console.log('[Auth Callback] Verifier cookie value length:', verifierCookie.value.length);
  }

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookiesToSet: { name: string; value: string; options: CookieOptions }[]) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            );
          } catch {}
        },
      },
    }
  );

  console.log('[Auth Callback] Calling exchangeCodeForSession...');
  const { data, error } = await supabase.auth.exchangeCodeForSession(code);

  if (error) {
    console.error('[Auth Callback] exchangeCodeForSession FAILED:', error.message);
    console.error('[Auth Callback] Error status:', error.status);
    return NextResponse.redirect(`${origin}/login?error=auth_failed`);
  }

  console.log('[Auth Callback] exchangeCodeForSession SUCCESS');
  console.log('[Auth Callback] User ID:', data.user?.id);
  console.log('[Auth Callback] User email:', data.user?.email);

  const userId = data.user?.id;
  if (!userId) {
    console.error('[Auth Callback] No user ID in session data');
    return NextResponse.redirect(`${origin}/login?error=auth_failed`);
  }

  // Check if user exists in users table
  const { data: existingUser, error: dbError } = await supabase
    .from('users')
    .select('id, is_active')
    .eq('id', userId)
    .single();

  console.log('[Auth Callback] DB lookup - existingUser:', !!existingUser, 'dbError:', dbError?.message);

  if (!existingUser) {
    console.log('[Auth Callback] New user, redirecting to register');
    return NextResponse.redirect(`${origin}/register/terms`);
  }

  if (!existingUser.is_active) {
    console.log('[Auth Callback] Inactive user, signing out');
    await supabase.auth.signOut();
    return NextResponse.redirect(`${origin}/login?error=auth_failed`);
  }

  console.log('[Auth Callback] Success, redirecting to /learn');
  console.log('[Auth Callback] ===== END =====');
  return NextResponse.redirect(`${origin}/learn`);
}
