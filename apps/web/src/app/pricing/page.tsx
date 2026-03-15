'use client';

import { useRouter } from 'next/navigation';
import Button from '@/components/core/Button';

const plans = [
  {
    name: '무료 체험',
    price: '₩0',
    period: '30일',
    features: ['전체 기능 이용', '30일 무료 체험'],
    current: true,
  },
  {
    name: '월간 구독',
    price: '₩990',
    period: '/월',
    features: ['전체 기능 이용', '무제한 학습', '자동 갱신'],
    highlighted: true,
  },
  {
    name: '연간 구독',
    price: '₩9,900',
    period: '/년',
    features: ['전체 기능 이용', '무제한 학습', '자동 갱신', '2개월 무료'],
  },
];

export default function PricingPage() {
  const router = useRouter();

  return (
    <div className="min-h-screen bg-neutral-50 px-4 py-8">
      <div className="max-w-lg mx-auto">
        <button
          onClick={() => router.back()}
          className="mb-4 text-sm text-text-secondary hover:text-text-primary"
        >
          ← 돌아가기
        </button>

        <h1 className="text-2xl font-bold text-text-primary mb-2">구독 플랜</h1>
        <p className="text-sm text-text-secondary mb-6">
          세상에서 가장 쉬운 언어학습, 합리적인 가격으로 시작하세요.
        </p>

        <div className="space-y-4">
          {plans.map((plan) => (
            <div
              key={plan.name}
              className={[
                'bg-surface rounded-2xl shadow-sm p-6 border-2 transition-colors',
                plan.highlighted
                  ? 'border-primary-600'
                  : 'border-transparent',
              ].join(' ')}
            >
              {plan.highlighted && (
                <span className="inline-block bg-primary-600 text-white text-xs px-2 py-0.5 rounded-full mb-2">
                  추천
                </span>
              )}
              <div className="flex items-baseline gap-1 mb-2">
                <span className="text-2xl font-bold text-text-primary">{plan.price}</span>
                <span className="text-sm text-text-secondary">{plan.period}</span>
              </div>
              <h3 className="font-semibold text-text-primary mb-3">{plan.name}</h3>
              <ul className="space-y-1.5 mb-4">
                {plan.features.map((f) => (
                  <li key={f} className="flex items-center gap-2 text-sm text-text-secondary">
                    <svg className="w-4 h-4 text-success flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                    </svg>
                    {f}
                  </li>
                ))}
              </ul>
              {plan.current ? (
                <Button variant="secondary" className="w-full" disabled>
                  현재 플랜
                </Button>
              ) : (
                <Button className="w-full" variant={plan.highlighted ? 'primary' : 'secondary'}>
                  구독하기
                </Button>
              )}
            </div>
          ))}
        </div>

        <p className="text-xs text-text-secondary text-center mt-6">
          결제 기능은 추후 업데이트 예정입니다.
        </p>
      </div>
    </div>
  );
}
