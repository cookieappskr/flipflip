import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

export async function GET(request: NextRequest) {
  const code = request.nextUrl.searchParams.get('code');
  if (!code) {
    return NextResponse.json({ valid: false, error: '추천 코드를 입력해주세요.' });
  }

  const supabase = createServerSupabaseClient();

  // Check if nickname exists
  const { data: referrer } = await supabase
    .from('user_profiles')
    .select('user_id, nickname')
    .eq('nickname', code)
    .single();

  if (!referrer) {
    return NextResponse.json({ valid: false, error: '존재하지 않는 추천 코드입니다.' });
  }

  // Check referral count (max 5)
  const { count } = await supabase
    .from('user_profiles')
    .select('*', { count: 'exact', head: true })
    .eq('referrer_id', referrer.user_id);

  if ((count || 0) >= 5) {
    return NextResponse.json({ valid: false, error: '추천 횟수가 초과되었습니다.' });
  }

  return NextResponse.json({ valid: true, referrerNickname: referrer.nickname });
}
