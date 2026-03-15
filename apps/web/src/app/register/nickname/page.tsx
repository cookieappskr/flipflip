'use client';

import { useState, useEffect, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

export default function NicknamePage() {
  const router = useRouter();
  const [nickname, setNickname] = useState('');
  const [error, setError] = useState('');
  const [checking, setChecking] = useState(false);
  const [valid, setValid] = useState(false);

  const validate = useCallback(async (value: string) => {
    if (value.length < 2) {
      setError('닉네임은 2자 이상이어야 합니다.');
      setValid(false);
      return;
    }
    if (value.length > 16) {
      setError('닉네임은 16자 이하여야 합니다.');
      setValid(false);
      return;
    }
    if (!/^[가-힣a-zA-Z0-9]+$/.test(value)) {
      setError('한글, 영문, 숫자만 사용할 수 있습니다.');
      setValid(false);
      return;
    }

    setChecking(true);
    try {
      const res = await fetch(`/api/register/nickname-check?nickname=${encodeURIComponent(value)}`);
      const data = await res.json();
      if (data.available) {
        setError('');
        setValid(true);
      } else {
        setError(data.reason || '사용할 수 없는 닉네임입니다.');
        setValid(false);
      }
    } catch {
      setError('확인 중 오류가 발생했습니다.');
      setValid(false);
    }
    setChecking(false);
  }, []);

  useEffect(() => {
    if (nickname.length >= 2) {
      const timer = setTimeout(() => validate(nickname), 300);
      return () => clearTimeout(timer);
    } else {
      setValid(false);
      setError('');
    }
  }, [nickname, validate]);

  return (
    <WizardLayout step={3} totalSteps={8} title="닉네임 설정" subtitle="다른 사용자에게 표시될 이름입니다.">
      <div className="space-y-4">
        <Input
          placeholder="닉네임 (2~16자)"
          value={nickname}
          onChange={(e) => setNickname(e.target.value)}
          error={error}
          maxLength={16}
        />
        {valid && !checking && (
          <p className="text-sm text-success">사용 가능한 닉네임입니다.</p>
        )}
        {checking && (
          <p className="text-sm text-text-secondary">확인 중...</p>
        )}

        <Button
          className="w-full mt-4"
          size="lg"
          disabled={!valid}
          onClick={() => {
            sessionStorage.setItem('reg_nickname', nickname);
            router.push('/register/email');
          }}
        >
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
