'use client';

import { useState } from 'react';
import Modal from '@/components/core/Modal';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';

interface DeleteAccountDialogProps {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => Promise<void>;
  hasActiveSubscription: boolean;
}

export default function DeleteAccountDialog({
  isOpen,
  onClose,
  onConfirm,
  hasActiveSubscription,
}: DeleteAccountDialogProps) {
  const [confirmText, setConfirmText] = useState('');
  const [loading, setLoading] = useState(false);

  const canConfirm = confirmText === '삭제';

  const handleConfirm = async () => {
    if (!canConfirm) return;
    setLoading(true);
    try {
      await onConfirm();
    } finally {
      setLoading(false);
      setConfirmText('');
    }
  };

  const handleClose = () => {
    setConfirmText('');
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={handleClose} title="계정 삭제" size="sm">
      <div className="space-y-4">
        <div className="rounded-lg bg-error/10 p-3">
          <p className="text-sm font-medium text-error">
            계정을 삭제하면 30일 후 모든 데이터가 영구 삭제됩니다.
          </p>
        </div>

        {hasActiveSubscription && (
          <div className="rounded-lg bg-warning/10 border border-warning/30 p-3">
            <p className="text-sm text-text-secondary">
              현재 구독은 기간 만료 후 자동 해지됩니다.
            </p>
          </div>
        )}

        <p className="text-sm text-text-secondary">
          30일 이내에 다시 로그인하시면 삭제가 취소됩니다.
        </p>

        <div>
          <p className="text-sm text-text-secondary mb-2">
            계속하려면 아래에 <strong className="text-text-primary">삭제</strong>를 입력하세요.
          </p>
          <Input
            value={confirmText}
            onChange={(e) => setConfirmText(e.target.value)}
            placeholder="삭제"
          />
        </div>

        <div className="flex gap-2 pt-2">
          <Button
            variant="secondary"
            className="flex-1"
            onClick={handleClose}
            disabled={loading}
          >
            취소
          </Button>
          <Button
            variant="danger"
            className="flex-1"
            disabled={!canConfirm}
            loading={loading}
            onClick={handleConfirm}
          >
            계정 삭제
          </Button>
        </div>
      </div>
    </Modal>
  );
}
