'use client';

import { useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

export default function ReferrerPage() {
  const router = useRouter();
  const [referrerId, setReferrerId] = useState('');
  const [loading, setLoading] = useState(false);
  const [validating, setValidating] = useState(false);
  const [error, setError] = useState('');
  const [validated, setValidated] = useState(false);
  const [validatedCode, setValidatedCode] = useState('');

  const validateReferralCode = useCallback(async (code: string) => {
    if (!code.trim()) return;

    setValidating(true);
    setError('');
    setValidated(false);

    try {
      const res = await fetch(`/api/referral/validate?code=${encodeURIComponent(code.trim())}`);
      const data = await res.json();

      if (data.valid) {
        setValidated(true);
        setValidatedCode(code.trim());
      } else {
        setError(data.error || '유효하지 않은 추천 코드입니다.');
      }
    } catch {
      setError('추천 코드 확인 중 오류가 발생했습니다.');
    } finally {
      setValidating(false);
    }
  }, []);

  const handleReferrerChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setReferrerId(value);
    // Reset validation when input changes
    if (validated && value.trim() !== validatedCode) {
      setValidated(false);
      setValidatedCode('');
      setError('');
    }
  };

  const handleComplete = async () => {
    setLoading(true);
    setError('');

    // Validate referral code before registration if provided and not yet validated
    if (referrerId.trim() && !validated) {
      setValidating(true);
      try {
        const res = await fetch(`/api/referral/validate?code=${encodeURIComponent(referrerId.trim())}`);
        const data = await res.json();
        if (!data.valid) {
          setError(data.error || '유효하지 않은 추천 코드입니다.');
          setLoading(false);
          setValidating(false);
          return;
        }
      } catch {
        setError('추천 코드 확인 중 오류가 발생했습니다.');
        setLoading(false);
        setValidating(false);
        return;
      }
      setValidating(false);
    }

    try {
      const res = await fetch('/api/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          nickname: sessionStorage.getItem('reg_nickname') || '',
          birth_date: sessionStorage.getItem('reg_birth_date') || '',
          mother_tongue: sessionStorage.getItem('reg_mother_tongue') || '',
          learning_language: sessionStorage.getItem('reg_learning_language') || '',
          daily_goal_type_id: sessionStorage.getItem('reg_daily_goal_type_id') || null,
          referrer_nickname: referrerId.trim() || null,
        }),
      });

      const data = await res.json();

      if (!res.ok) {
        setError(data.error || '가입에 실패했습니다.');
        setLoading(false);
        return;
      }

      // Clear session
      ['reg_nickname', 'reg_birth_date', 'reg_mother_tongue', 'reg_learning_language', 'reg_daily_goal_type_id'].forEach(
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
        <div className="flex gap-2">
          <div className="flex-1">
            <Input
              placeholder="추천인 닉네임"
              value={referrerId}
              onChange={handleReferrerChange}
            />
          </div>
          {referrerId.trim() && !validated && (
            <Button
              variant="secondary"
              size="md"
              loading={validating}
              onClick={() => validateReferralCode(referrerId)}
            >
              확인
            </Button>
          )}
        </div>

        {validated && (
          <p className="text-sm text-primary-600">유효한 추천 코드입니다! 가입 시 서로 1주일 무료 이용권을 받아요.</p>
        )}

        {error && <p className="text-sm text-error">{error}</p>}

        <div className="space-y-2">
          <Button
            className="w-full"
            size="lg"
            loading={loading}
            onClick={handleComplete}
          >
            {referrerId.trim() ? '가입 완료' : '건너뛰고 시작하기'}
          </Button>
        </div>
      </div>
    </WizardLayout>
  );
}
