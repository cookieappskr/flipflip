'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';

export default function AuthCallbackPage() {
  const router = useRouter();
  const [error, setError] = useState(false);

  useEffect(() => {
    const supabase = createClient();

    // Exchange the auth code for session (PKCE verifier is in browser storage)
    supabase.auth.onAuthStateChange(async (event, session) => {
      if (event === 'SIGNED_IN' && session) {
        const userId = session.user.id;

        // Check if user exists in users table
        const { data: existingUser } = await supabase
          .from('users')
          .select('id, is_active')
          .eq('id', userId)
          .single();

        if (!existingUser) {
          router.replace('/register/terms');
          return;
        }

        if (!existingUser.is_active) {
          await supabase.auth.signOut();
          router.replace('/login?error=auth_failed');
          return;
        }

        router.replace('/learn');
      }
    });

    // Timeout fallback
    const timeout = setTimeout(() => {
      setError(true);
    }, 10000);

    return () => clearTimeout(timeout);
  }, [router]);

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center">
        <p className="text-error mb-4">인증 처리 중 오류가 발생했습니다.</p>
        <button
          onClick={() => router.replace('/login')}
          className="text-primary-600 underline"
        >
          로그인으로 돌아가기
        </button>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="animate-spin h-8 w-8 border-2 border-primary-600 border-t-transparent rounded-full" />
    </div>
  );
}
