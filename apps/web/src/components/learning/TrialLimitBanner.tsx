'use client';

import { useRouter } from 'next/navigation';
import Modal from '@/components/core/Modal';
import Button from '@/components/core/Button';

interface TrialLimitModalProps {
  isOpen: boolean;
  onClose: () => void;
  status: 'trial' | 'expired' | 'no_subscription';
  trialDaysRemaining?: number | null;
  trialTotalDays?: number | null;
  todayRemaining?: number;
  dailyLimit?: number;
}

export default function TrialLimitModal({
  isOpen,
  onClose,
  status,
  trialDaysRemaining,
  trialTotalDays,
  todayRemaining = 0,
  dailyLimit = 10,
}: TrialLimitModalProps) {
  const router = useRouter();

  if (status === 'trial' && trialDaysRemaining != null) {
    const totalDays = trialTotalDays || 30;
    const daysPassed = totalDays - trialDaysRemaining;
    return (
      <Modal isOpen={isOpen} onClose={onClose} size="sm">
        <div className="text-center py-2">
          <p className="text-lg font-bold text-text-primary mb-2">
            가입 후 {daysPassed}일차/{totalDays}일
          </p>
          <p className="text-sm text-text-secondary mb-4">
            무료이용기간 기간동안 마음껏 공부하세요.
          </p>
          <Button onClick={onClose} variant="secondary" className="w-full">
            닫기
          </Button>
        </div>
      </Modal>
    );
  }

  // expired or no_subscription
  return (
    <Modal isOpen={isOpen} onClose={onClose} size="sm">
      <div className="text-center py-2">
        <p className="text-lg font-bold text-text-primary mb-2">
          오늘남은 학습 {todayRemaining}/{dailyLimit}문장
        </p>
        <p className="text-sm text-text-secondary mb-4">
          구독하면 무제한으로 학습할 수 있어요.
        </p>
        <Button onClick={() => router.push('/pricing')} className="w-full">
          구독하기
        </Button>
      </div>
    </Modal>
  );
}
