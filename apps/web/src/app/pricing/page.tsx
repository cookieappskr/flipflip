'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useSubscription } from '@/lib/hooks/useSubscription';
import Button from '@/components/core/Button';
import type { PlanType } from '@/types/database';

const plans = [
  {
    key: 'trial' as const,
    name: '무료 체험',
    price: '₩0',
    period: '30일',
    features: ['전체 기능 이용', '30일 무료 체험'],
  },
  {
    key: 'monthly' as const,
    name: '월간 구독',
    price: '₩1,900',
    period: '/월',
    features: ['전체 기능 이용', '무제한 학습', '자동 갱신'],
    highlighted: true,
  },
  {
    key: 'yearly' as const,
    name: '연간 구독',
    price: '₩11,400',
    period: '/년',
    features: ['전체 기능 이용', '무제한 학습', '자동 갱신', '50% 할인'],
  },
];

export default function PricingPage() {
  const router = useRouter();
  const { subscription, loading } = useSubscription();
  const [subscribing, setSubscribing] = useState(false);

  const handleSubscribe = async (planType: PlanType) => {
    setSubscribing(true);
    try {
      const { loadTossPayments } = await import(
        '@tosspayments/tosspayments-sdk'
      );
      const tossPayments = await loadTossPayments(
        process.env.NEXT_PUBLIC_TOSS_CLIENT_KEY!,
      );

      const { createClient } = await import('@/lib/supabase/client');
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) throw new Error('Not logged in');

      const payment = tossPayments.payment({ customerKey: user.id });
      await payment.requestBillingAuth({
        method: 'CARD',
        successUrl: `${window.location.origin}/pricing/success?planType=${planType}`,
        failUrl: `${window.location.origin}/pricing/fail`,
        customerEmail: user.email || undefined,
      });
    } catch (e) {
      console.error('Subscribe error:', e);
      setSubscribing(false);
    }
  };

  // Determine current plan key
  const currentPlanKey = !subscription
    ? null
    : subscription.effective_status === 'trial'
      ? 'trial'
      : subscription.effective_status === 'active'
        ? subscription.plan_type
        : null;

  return (
    <div className="min-h-screen bg-neutral-50 px-4 py-8">
      <div className="max-w-lg mx-auto">
        <button
          onClick={() => router.back()}
          className="mb-4 text-sm text-text-secondary hover:text-text-primary"
        >
          &larr; 돌아가기
        </button>

        <h1 className="text-2xl font-bold text-text-primary mb-2">
          구독 플랜
        </h1>
        <p className="text-sm text-text-secondary mb-6">
          세상에서 가장 쉬운 언어학습, 합리적인 가격으로 시작하세요.
        </p>

        {loading ? (
          <div className="flex justify-center py-12">
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
        ) : (
          <div className="space-y-4">
            {plans.map((plan) => {
              const isCurrent = currentPlanKey === plan.key;
              const isPaid = plan.key === 'monthly' || plan.key === 'yearly';

              return (
                <div
                  key={plan.key}
                  className={[
                    'bg-surface rounded-2xl shadow-sm p-6 border-2 transition-colors',
                    isCurrent
                      ? 'border-primary-600 bg-primary-50/30'
                      : plan.highlighted
                        ? 'border-primary-600'
                        : 'border-transparent',
                  ].join(' ')}
                >
                  <div className="flex items-center gap-2 mb-2">
                    {plan.highlighted && !isCurrent && (
                      <span className="inline-block bg-primary-600 text-white text-xs px-2 py-0.5 rounded-full">
                        추천
                      </span>
                    )}
                    {isCurrent && (
                      <span className="inline-block bg-success text-white text-xs px-2 py-0.5 rounded-full">
                        현재 플랜
                      </span>
                    )}
                  </div>

                  <div className="flex items-baseline gap-1 mb-2">
                    <span className="text-2xl font-bold text-text-primary">
                      {plan.price}
                    </span>
                    <span className="text-sm text-text-secondary">
                      {plan.period}
                    </span>
                  </div>

                  <h3 className="font-semibold text-text-primary mb-3">
                    {plan.name}
                  </h3>

                  <ul className="space-y-1.5 mb-4">
                    {plan.features.map((f) => (
                      <li
                        key={f}
                        className="flex items-center gap-2 text-sm text-text-secondary"
                      >
                        <svg
                          className="w-4 h-4 text-success flex-shrink-0"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke="currentColor"
                          strokeWidth={2}
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            d="M5 13l4 4L19 7"
                          />
                        </svg>
                        {f}
                      </li>
                    ))}
                  </ul>

                  {isCurrent ? (
                    <Button variant="secondary" className="w-full" disabled>
                      현재 플랜
                    </Button>
                  ) : isPaid ? (
                    <Button
                      className="w-full"
                      variant={plan.highlighted ? 'primary' : 'secondary'}
                      loading={subscribing}
                      onClick={() =>
                        handleSubscribe(plan.key as PlanType)
                      }
                    >
                      구독하기
                    </Button>
                  ) : (
                    <Button variant="secondary" className="w-full" disabled>
                      무료 체험 중
                    </Button>
                  )}
                </div>
              );
            })}
          </div>
        )}

        <p className="text-xs text-text-secondary text-center mt-6">
          구독은 언제든지 마이페이지에서 취소할 수 있습니다.
        </p>
      </div>
    </div>
  );
}
