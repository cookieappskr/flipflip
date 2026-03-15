'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';

export default function ProfilePage() {
  const router = useRouter();
  const [imageUrl, setImageUrl] = useState<string | null>(null);

  return (
    <WizardLayout step={6} totalSteps={8} title="프로필 이미지" subtitle="나를 표현할 이미지를 선택해주세요. (선택)">
      <div className="flex flex-col items-center space-y-4">
        <div className="w-24 h-24 rounded-full bg-neutral-200 flex items-center justify-center overflow-hidden">
          {imageUrl ? (
            <img src={imageUrl} alt="Profile" className="w-full h-full object-cover" />
          ) : (
            <svg className="w-12 h-12 text-neutral-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
            </svg>
          )}
        </div>

        <label className="cursor-pointer text-sm text-primary-600 font-medium hover:text-primary-700">
          이미지 업로드
          <input
            type="file"
            accept="image/*"
            className="hidden"
            onChange={(e) => {
              const file = e.target.files?.[0];
              if (file) {
                setImageUrl(URL.createObjectURL(file));
                sessionStorage.setItem('reg_profile_image', 'pending');
              }
            }}
          />
        </label>

        <div className="w-full space-y-2 mt-4">
          <Button
            className="w-full"
            size="lg"
            onClick={() => router.push('/register/referrer')}
          >
            다음
          </Button>
          <Button
            className="w-full"
            variant="ghost"
            onClick={() => router.push('/register/referrer')}
          >
            건너뛰기
          </Button>
        </div>
      </div>
    </WizardLayout>
  );
}
