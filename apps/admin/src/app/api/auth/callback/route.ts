import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get('code');
  const next = searchParams.get('next') ?? '/types';

  if (code) {
    const cookieStore = cookies();
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

    const { data, error } = await supabase.auth.exchangeCodeForSession(code);

    if (error) {
      console.error('[Auth Callback] exchangeCodeForSession error:', error.message);
      return NextResponse.redirect(`${origin}/login?error=auth_failed`);
    }

    // Check if user is in admin_users table
    const userEmail = data.user?.email;
    if (userEmail) {
      const { data: adminUser, error: adminError } = await supabase
        .from('admin_users')
        .select('id, role, is_active')
        .eq('email', userEmail)
        .single();

      if (adminError) {
        console.error('[Auth Callback] admin_users query error:', adminError.message);
      }

      if (!adminUser || !adminUser.is_active) {
        console.error('[Auth Callback] User not in admin_users or inactive:', userEmail);
        await supabase.auth.signOut();
        return NextResponse.redirect(`${origin}/login?error=unauthorized`);
      }
    }

    return NextResponse.redirect(`${origin}${next}`);
  }

  return NextResponse.redirect(`${origin}/login?error=auth_failed`);
}
