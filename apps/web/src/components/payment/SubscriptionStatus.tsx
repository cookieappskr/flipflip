'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Button from '@/components/core/Button';
import type { Subscription } from '@/types/database';
import { REFUND_PERIOD_DAYS } from '@/lib/payments/constants';

interface Props {
  subscription: Subscription & { effective_status: string };
  onCancel: () => Promise<void>;
  onRefund: () => Promise<void>;
}

const STATUS_LABELS: Record<string, { text: string; color: string }> = {
  trial: { text: '무료 체험', color: 'bg-blue-100 text-blue-700' },
  active: { text: '구독 중', color: 'bg-success/10 text-success' },
  cancelled: { text: '해지 예정', color: 'bg-warning/10 text-warning' },
  expired: { text: '만료', color: 'bg-neutral-100 text-text-secondary' },
  past_due: { text: '결제 실패', color: 'bg-error/10 text-error' },
};

const PLAN_LABELS: Record<string, string> = {
  monthly: '월간 구독',
  yearly: '연간 구독',
};

function getDaysRemaining(endDate: string | null): number | null {
  if (!endDate) return null;
  const end = new Date(endDate);
  const now = new Date();
  const diff = Math.ceil(
    (end.getTime() - now.getTime()) / (1000 * 60 * 60 * 24),
  );
  return Math.max(0, diff);
}

function isWithinRefundPeriod(subscription: Subscription): boolean {
  if (!subscription.current_period_start) return false;
  const start = new Date(subscription.current_period_start);
  const now = new Date();
  const daysSinceStart = Math.floor(
    (now.getTime() - start.getTime()) / (1000 * 60 * 60 * 24),
  );
  return daysSinceStart <= REFUND_PERIOD_DAYS;
}

export default function SubscriptionStatus({
  subscription,
  onCancel,
  onRefund,
}: Props) {
  const router = useRouter();
  const [cancelling, setCancelling] = useState(false);
  const [refunding, setRefunding] = useState(false);
  const [showConfirm, setShowConfirm] = useState<'cancel' | 'refund' | null>(
    null,
  );
  const [error, setError] = useState('');

  const status = subscription.effective_status;
  const statusInfo = STATUS_LABELS[status] || STATUS_LABELS.expired;
  const planLabel =
    PLAN_LABELS[subscription.plan_type || ''] || '무료 체험';

  const endDate =
    status === 'trial'
      ? subscription.trial_end_at
      : subscription.current_period_end;
  const daysRemaining = getDaysRemaining(endDate);

  const canCancel = status === 'active' && subscription.auto_renew;
  const canRefund =
    status === 'active' && isWithinRefundPeriod(subscription);

  const handleCancel = async () => {
    setCancelling(true);
    setError('');
    try {
      await onCancel();
      setShowConfirm(null);
    } catch (e: unknown) {
      const message =
        e instanceof Error ? e.message : '취소 처리 중 오류가 발생했습니다.';
      setError(message);
    } finally {
      setCancelling(false);
    }
  };

  const handleRefund = async () => {
    setRefunding(true);
    setError('');
    try {
      await onRefund();
      setShowConfirm(null);
    } catch (e: unknown) {
      const message =
        e instanceof Error ? e.message : '환불 처리 중 오류가 발생했습니다.';
      setError(message);
    } finally {
      setRefunding(false);
    }
  };

  return (
    <div className="bg-surface rounded-2xl shadow-sm p-4">
      <div className="flex items-center justify-between mb-3">
        <div>
          <p className="text-sm font-medium text-text-primary">구독 상태</p>
          <div className="flex items-center gap-2 mt-1">
            <span className="text-sm font-semibold text-text-primary">
              {planLabel}
            </span>
            <span
              className={`inline-block text-xs px-2 py-0.5 rounded-full font-medium ${statusInfo.color}`}
            >
              {statusInfo.text}
            </span>
          </div>
        </div>
        <Button
          variant="secondary"
          size="sm"
          onClick={() => router.push('/pricing')}
        >
          플랜 변경
        </Button>
      </div>

      {/* Period info */}
      {daysRemaining !== null && (
        <div className="text-sm text-text-secondary mb-2">
          {daysRemaining > 0
            ? `${daysRemaining}일 남음`
            : '오늘 만료'}
          {endDate && (
            <span className="ml-1">
              ({new Date(endDate).toLocaleDateString('ko-KR')} 까지)
            </span>
          )}
        </div>
      )}

      {/* Next billing date */}
      {status === 'active' &&
        subscription.auto_renew &&
        subscription.current_period_end && (
          <div className="text-sm text-text-secondary mb-2">
            다음 결제일:{' '}
            {new Date(subscription.current_period_end).toLocaleDateString(
              'ko-KR',
            )}
          </div>
        )}

      {/* Actions */}
      {(canCancel || canRefund) && !showConfirm && (
        <div className="flex gap-2 mt-3 pt-3 border-t border-border">
          {canCancel && (
            <button
              className="text-sm text-text-secondary hover:text-text-primary transition-colors"
              onClick={() => setShowConfirm('cancel')}
            >
              구독 해지
            </button>
          )}
          {canRefund && (
            <button
              className="text-sm text-error hover:text-red-700 transition-colors"
              onClick={() => setShowConfirm('refund')}
            >
              환불 신청
            </button>
          )}
        </div>
      )}

      {/* Confirmation dialogs */}
      {showConfirm === 'cancel' && (
        <div className="mt-3 pt-3 border-t border-border">
          <p className="text-sm text-text-primary mb-2">
            구독을 해지하시겠습니까? 현재 구독 기간이 끝날 때까지 서비스를
            이용할 수 있습니다.
          </p>
          {error && (
            <p className="text-sm text-error mb-2">{error}</p>
          )}
          <div className="flex gap-2">
            <Button
              variant="danger"
              size="sm"
              loading={cancelling}
              onClick={handleCancel}
            >
              해지 확인
            </Button>
            <Button
              variant="secondary"
              size="sm"
              onClick={() => {
                setShowConfirm(null);
                setError('');
              }}
            >
              취소
            </Button>
          </div>
        </div>
      )}

      {showConfirm === 'refund' && (
        <div className="mt-3 pt-3 border-t border-border">
          <p className="text-sm text-text-primary mb-2">
            환불을 신청하시겠습니까? 결제일로부터 {REFUND_PERIOD_DAYS}일
            이내에만 환불이 가능합니다.
          </p>
          {error && (
            <p className="text-sm text-error mb-2">{error}</p>
          )}
          <div className="flex gap-2">
            <Button
              variant="danger"
              size="sm"
              loading={refunding}
              onClick={handleRefund}
            >
              환불 확인
            </Button>
            <Button
              variant="secondary"
              size="sm"
              onClick={() => {
                setShowConfirm(null);
                setError('');
              }}
            >
              취소
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
