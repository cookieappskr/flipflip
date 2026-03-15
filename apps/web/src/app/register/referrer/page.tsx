'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

export default function ReferrerPage() {
  const router = useRouter();
  const [referrerId, setReferrerId] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleComplete = async () => {
    setLoading(true);
    setError('');

    try {
      const res = await fetch('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          nickname: sessionStorage.getItem('reg_nickname') || '',
          birth_date: sessionStorage.getItem('reg_birth_date') || '',
          mother_tongue: sessionStorage.getItem('reg_mother_tongue') || '',
          learning_language: sessionStorage.getItem('reg_learning_language') || '',
          referrer_nickname: referrerId || null,
        }),
      });

      const data = await res.json();

      if (!res.ok) {
        setError(data.error || '가입에 실패했습니다.');
        setLoading(false);
        return;
      }

      // Clear session
      ['reg_nickname', 'reg_birth_date', 'reg_mother_tongue', 'reg_learning_language'].forEach(
        (key) => sessionStorage.removeItem(key)
      );

      router.push('/learn');
    } catch {
      setError('네트워크 오류가 발생했습니다.');
      setLoading(false);
    }
  };

  return (
    <WizardLayout step={4} totalSteps={4} title="추천인 입력" subtitle="추천인의 닉네임을 입력해주세요. (선택)">
      <div className="space-y-4">
        <Input
          placeholder="추천인 닉네임"
          value={referrerId}
          onChange={(e) => setReferrerId(e.target.value)}
        />

        {error && <p className="text-sm text-error">{error}</p>}

        <div className="space-y-2">
          <Button
            className="w-full"
            size="lg"
            loading={loading}
            onClick={handleComplete}
          >
            {referrerId ? '가입 완료' : '건너뛰고 시작하기'}
          </Button>
        </div>
      </div>
    </WizardLayout>
  );
}
