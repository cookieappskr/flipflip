'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

export default function EmailPage() {
  const router = useRouter();
  const [email, setEmail] = useState('');

  useEffect(() => {
    const loadAuthEmail = async () => {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (user?.email) setEmail(user.email);
    };
    loadAuthEmail();
  }, []);

  const isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

  return (
    <WizardLayout step={4} totalSteps={8} title="이메일 입력" subtitle="공유 및 알림에 사용될 이메일입니다.">
      <div className="space-y-4">
        <Input
          type="email"
          placeholder="email@example.com"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />

        <Button
          className="w-full mt-4"
          size="lg"
          disabled={!isValidEmail}
          onClick={() => {
            sessionStorage.setItem('reg_email', email);
            router.push('/register/birth');
          }}
        >
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
