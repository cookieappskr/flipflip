'use client';

import { useRouter } from 'next/navigation';
import Button from '@/components/core/Button';

interface TrialLimitBannerProps {
  todayCount: number;
  dailyLimit: number;
  trialDaysRemaining?: number | null;
  status: 'trial' | 'expired' | 'no_subscription';
}

export default function TrialLimitBanner({ todayCount, dailyLimit, trialDaysRemaining, status }: TrialLimitBannerProps) {
  const router = useRouter();
  const remaining = Math.max(0, dailyLimit - todayCount);

  if (status === 'trial' && trialDaysRemaining != null) {
    return (
      <div className="bg-info/10 border border-info/30 rounded-xl p-3 mb-4">
        <p className="text-sm text-info font-medium">
          무료체험 중 · {trialDaysRemaining}일 남음
        </p>
        <p className="text-xs text-text-secondary mt-0.5">
          체험 기간 종료 후 하루 {dailyLimit}문장으로 제한됩니다.
        </p>
      </div>
    );
  }

  if (status === 'expired' || status === 'no_subscription') {
    return (
      <div className="bg-warning/10 border border-warning/30 rounded-xl p-3 mb-4">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm text-warning font-medium">
              오늘 남은 학습: {remaining}/{dailyLimit}문장
            </p>
            <p className="text-xs text-text-secondary mt-0.5">
              구독하면 무제한으로 학습할 수 있어요.
            </p>
          </div>
          <Button size="sm" onClick={() => router.push('/pricing')}>
            구독하기
          </Button>
        </div>
      </div>
    );
  }

  return null;
}
