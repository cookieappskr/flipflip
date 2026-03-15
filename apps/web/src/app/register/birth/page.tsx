'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
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

export default function BirthPage() {
  const router = useRouter();
  const [birthDate, setBirthDate] = useState('');
  const [error, setError] = useState('');

  const handleNext = () => {
    if (!birthDate) {
      setError('생년월일을 입력해주세요.');
      return;
    }
    if (!isAdult(birthDate)) {
      setError('성인만 이용할 수 있는 서비스입니다.');
      return;
    }
    setError('');
    sessionStorage.setItem('reg_birth_date', birthDate);
    router.push('/register/profile');
  };

  return (
    <WizardLayout step={5} totalSteps={8} title="생년월일" subtitle="성인 확인을 위해 필요합니다.">
      <div className="space-y-4">
        <Input
          type="date"
          value={birthDate}
          onChange={(e) => {
            setBirthDate(e.target.value);
            setError('');
          }}
          error={error}
        />

        <Button className="w-full mt-4" size="lg" onClick={handleNext}>
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
