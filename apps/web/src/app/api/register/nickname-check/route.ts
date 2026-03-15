import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';

const BANNED_WORDS = ['admin', 'flipflip', '관리자', '운영자', '섹스', '시발', '씨발'];

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const nickname = searchParams.get('nickname');

  if (!nickname || nickname.length < 2 || nickname.length > 16) {
    return NextResponse.json({ available: false, reason: '닉네임은 2~16자여야 합니다.' });
  }

  if (!/^[가-힣a-zA-Z0-9]+$/.test(nickname)) {
    return NextResponse.json({ available: false, reason: '한글, 영문, 숫자만 사용할 수 있습니다.' });
  }

  const lowerNickname = nickname.toLowerCase();
  if (BANNED_WORDS.some((word) => lowerNickname.includes(word))) {
    return NextResponse.json({ available: false, reason: '사용할 수 없는 닉네임입니다.' });
  }

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

  const { data: existing } = await supabase
    .from('user_profiles')
    .select('user_id')
    .eq('nickname', nickname)
    .single();

  if (existing) {
    return NextResponse.json({ available: false, reason: '이미 사용 중인 닉네임입니다.' });
  }

  return NextResponse.json({ available: true });
}
