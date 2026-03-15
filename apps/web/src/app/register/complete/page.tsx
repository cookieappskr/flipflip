'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';

export default function CompletePage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleRegister = async () => {
    setLoading(true);
    setError('');

    try {
      const res = await fetch('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          phone: sessionStorage.getItem('reg_phone') || '',
          nickname: sessionStorage.getItem('reg_nickname') || '',
          email: sessionStorage.getItem('reg_email') || '',
          birth_date: sessionStorage.getItem('reg_birth_date') || '',
          referrer_nickname: sessionStorage.getItem('reg_referrer') || null,
        }),
      });

      const data = await res.json();

      if (!res.ok) {
        setError(data.error || '가입에 실패했습니다.');
        setLoading(false);
        return;
      }

      // Clear registration data from session
      ['reg_phone', 'reg_nickname', 'reg_email', 'reg_birth_date', 'reg_referrer', 'reg_profile_image'].forEach(
        (key) => sessionStorage.removeItem(key)
      );

      router.push('/diagnosis');
    } catch {
      setError('네트워크 오류가 발생했습니다.');
      setLoading(false);
    }
  };

  return (
    <WizardLayout step={8} totalSteps={8} title="가입 완료" subtitle="모든 정보가 입력되었습니다!">
      <div className="text-center space-y-6">
        <div className="w-20 h-20 mx-auto bg-primary-100 rounded-full flex items-center justify-center">
          <svg className="w-10 h-10 text-primary-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
          </svg>
        </div>

        <p className="text-text-secondary text-sm">
          가입 완료 후 모국어와 학습언어를 선택하고,<br />
          레벨테스트를 진행합니다.
        </p>

        {error && (
          <p className="text-sm text-error">{error}</p>
        )}

        <Button
          className="w-full"
          size="lg"
          loading={loading}
          onClick={handleRegister}
        >
          가입 완료
        </Button>
      </div>
    </WizardLayout>
  );
}
