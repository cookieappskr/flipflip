'use client';

import { createClient } from '@/lib/supabase/client';
import { useSearchParams } from 'next/navigation';
import { Suspense } from 'react';

function LoginContent() {
  const searchParams = useSearchParams();
  const error = searchParams.get('error');

  const handleGoogleLogin = async () => {
    const supabase = createClient();

    // Debug: check cookies before OAuth
    console.log('[Login] Cookies before signInWithOAuth:', document.cookie);
    console.log('[Login] Origin:', window.location.origin);

    const { data, error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/api/auth/callback`,
      },
    });

    // Debug: check result
    console.log('[Login] signInWithOAuth result - data:', JSON.stringify(data));
    console.log('[Login] signInWithOAuth result - error:', error?.message);
    console.log('[Login] Cookies after signInWithOAuth:', document.cookie);
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-neutral-50 px-4">
      <div className="bg-surface rounded-2xl shadow-lg p-8 w-full max-w-sm">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-primary-600 mb-2">FlipFlip</h1>
          <p className="text-text-secondary text-sm">세상에서 가장 쉬운 언어학습앱</p>
        </div>

        {error === 'not_registered' && (
          <div className="mb-4 p-3 bg-info/10 border border-info/20 rounded-lg text-info text-sm">
            회원가입이 필요합니다. 약관에 동의해주세요.
          </div>
        )}
        {error === 'auth_failed' && (
          <div className="mb-4 p-3 bg-error/10 border border-error/20 rounded-lg text-error text-sm">
            인증에 실패했습니다. 다시 시도해주세요.
          </div>
        )}

        <button
          onClick={handleGoogleLogin}
          className="w-full flex items-center justify-center gap-3 px-4 py-3 border border-border rounded-xl hover:bg-neutral-50 transition-colors"
        >
          <svg className="w-5 h-5" viewBox="0 0 24 24">
            <path
              d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z"
              fill="#4285F4"
            />
            <path
              d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
              fill="#34A853"
            />
            <path
              d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
              fill="#FBBC05"
            />
            <path
              d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
              fill="#EA4335"
            />
          </svg>
          <span className="text-text-primary font-medium">Google로 시작하기</span>
        </button>

        <p className="mt-6 text-center text-xs text-text-secondary">
          로그인 시 서비스 이용약관 및 개인정보 처리방침에 동의합니다.
        </p>
      </div>
    </div>
  );
}

export default function LoginPage() {
  return (
    <Suspense>
      <LoginContent />
    </Suspense>
  );
}
