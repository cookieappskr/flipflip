'use client';

import { useSearchParams, useRouter } from 'next/navigation';
import { Suspense } from 'react';
import Button from '@/components/core/Button';

function PaymentFailContent() {
  const searchParams = useSearchParams();
  const router = useRouter();

  const code = searchParams.get('code') || 'UNKNOWN';
  const message =
    searchParams.get('message') || '결제 처리 중 오류가 발생했습니다.';

  return (
    <div className="min-h-screen bg-neutral-50 flex items-center justify-center px-4">
      <div className="max-w-sm w-full bg-surface rounded-2xl shadow-sm p-8 text-center">
        <div className="flex justify-center mb-4">
          <div className="w-16 h-16 rounded-full bg-error/10 flex items-center justify-center">
            <svg
              className="w-8 h-8 text-error"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </div>
        </div>

        <h2 className="text-lg font-bold text-text-primary mb-2">
          결제 실패
        </h2>
        <p className="text-sm text-text-secondary mb-1">{message}</p>
        <p className="text-xs text-text-secondary mb-6">
          오류 코드: {code}
        </p>

        <div className="space-y-2">
          <Button className="w-full" onClick={() => router.push('/pricing')}>
            다시 시도
          </Button>
          <Button
            variant="secondary"
            className="w-full"
            onClick={() => router.push('/')}
          >
            홈으로
          </Button>
        </div>
      </div>
    </div>
  );
}

export default function PaymentFailPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-neutral-50 flex items-center justify-center">
          <svg
            className="animate-spin h-8 w-8 text-primary-600"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
          >
            <circle
              className="opacity-25"
              cx="12"
              cy="12"
              r="10"
              stroke="currentColor"
              strokeWidth="4"
            />
            <path
              className="opacity-75"
              fill="currentColor"
              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"
            />
          </svg>
        </div>
      }
    >
      <PaymentFailContent />
    </Suspense>
  );
}
