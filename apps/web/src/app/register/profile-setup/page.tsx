'use client';

import { useState, useEffect, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

function isAdult(birthDate: string, countryCode: string = 'KR'): boolean {
  const adultAge = countryCode === 'KR' ? 19 : 18;
  const birth = new Date(birthDate);
  const today = new Date();
  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
    age--;
  }
  return age >= adultAge;
}

export default function ProfileSetupPage() {
  const router = useRouter();
  const [nickname, setNickname] = useState('');
  const [birthDate, setBirthDate] = useState('');
  const [nicknameError, setNicknameError] = useState('');
  const [birthError, setBirthError] = useState('');
  const [nicknameValid, setNicknameValid] = useState(false);
  const [checking, setChecking] = useState(false);

  // Pre-fill nickname from Google profile
  useEffect(() => {
    const loadName = async () => {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (user?.user_metadata?.full_name) {
        setNickname(user.user_metadata.full_name.replace(/[^가-힣a-zA-Z0-9]/g, '').slice(0, 16));
      }
    };
    loadName();
  }, []);

  const validateNickname = useCallback(async (value: string) => {
    if (value.length < 2) {
      setNicknameError('닉네임은 2자 이상이어야 합니다.');
      setNicknameValid(false);
      return;
    }
    if (value.length > 16) {
      setNicknameError('닉네임은 16자 이하여야 합니다.');
      setNicknameValid(false);
      return;
    }
    if (!/^[가-힣a-zA-Z0-9]+$/.test(value)) {
      setNicknameError('한글, 영문, 숫자만 사용할 수 있습니다.');
      setNicknameValid(false);
      return;
    }

    setChecking(true);
    try {
      const res = await fetch(`/api/register/nickname-check?nickname=${encodeURIComponent(value)}`);
      const data = await res.json();
      if (data.available) {
        setNicknameError('');
        setNicknameValid(true);
      } else {
        setNicknameError(data.reason || '사용할 수 없는 닉네임입니다.');
        setNicknameValid(false);
      }
    } catch {
      setNicknameError('확인 중 오류가 발생했습니다.');
      setNicknameValid(false);
    }
    setChecking(false);
  }, []);

  useEffect(() => {
    if (nickname.length >= 2) {
      const timer = setTimeout(() => validateNickname(nickname), 300);
      return () => clearTimeout(timer);
    } else {
      setNicknameValid(false);
      setNicknameError('');
    }
  }, [nickname, validateNickname]);

  const handleNext = () => {
    if (!birthDate) {
      setBirthError('생년월일을 입력해주세요.');
      return;
    }
    if (!isAdult(birthDate)) {
      setBirthError('성인만 이용할 수 있는 서비스입니다.');
      return;
    }
    setBirthError('');
    sessionStorage.setItem('reg_nickname', nickname);
    sessionStorage.setItem('reg_birth_date', birthDate);
    router.push('/register/language');
  };

  const canProceed = nicknameValid && birthDate && !birthError;

  return (
    <WizardLayout step={2} totalSteps={4} title="프로필 설정" subtitle="닉네임과 생년월일을 입력해주세요.">
      <div className="space-y-5">
        {/* Nickname */}
        <div>
          <Input
            label="닉네임"
            placeholder="닉네임 (2~16자)"
            value={nickname}
            onChange={(e) => setNickname(e.target.value)}
            error={nicknameError}
            maxLength={16}
          />
          {nicknameValid && !checking && (
            <p className="mt-1 text-sm text-success">사용 가능한 닉네임입니다.</p>
          )}
          {checking && (
            <p className="mt-1 text-sm text-text-secondary">확인 중...</p>
          )}
        </div>

        {/* Birth date */}
        <Input
          label="생년월일"
          type="date"
          value={birthDate}
          onChange={(e) => {
            setBirthDate(e.target.value);
            setBirthError('');
          }}
          error={birthError}
        />

        <Button
          className="w-full mt-2"
          size="lg"
          disabled={!canProceed}
          onClick={handleNext}
        >
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
