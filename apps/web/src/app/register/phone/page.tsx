'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

function formatPhone(value: string): string {
  const digits = value.replace(/\D/g, '').slice(0, 11);
  if (digits.length <= 3) return digits;
  if (digits.length <= 7) return `${digits.slice(0, 3)}-${digits.slice(3)}`;
  return `${digits.slice(0, 3)}-${digits.slice(3, 7)}-${digits.slice(7)}`;
}

function isValidPhone(phone: string): boolean {
  const digits = phone.replace(/\D/g, '');
  return digits.length >= 10 && digits.length <= 11;
}

export default function PhonePage() {
  const router = useRouter();
  const [phone, setPhone] = useState('');

  const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPhone(formatPhone(e.target.value));
  };

  const valid = isValidPhone(phone);

  return (
    <WizardLayout step={2} totalSteps={8} title="전화번호 입력" subtitle="연락 가능한 전화번호를 입력해주세요.">
      <div className="space-y-4">
        <Input
          placeholder="010-1234-5678"
          value={phone}
          onChange={handlePhoneChange}
          type="tel"
          inputMode="numeric"
        />

        <Button
          className="w-full mt-4"
          size="lg"
          disabled={!valid}
          onClick={() => {
            sessionStorage.setItem('reg_phone', phone);
            router.push('/register/nickname');
          }}
        >
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
