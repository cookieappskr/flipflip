'use client';

import React, { useState, useEffect } from 'react';
import type { Level } from '@/types/database';
import { useLevels } from '@/lib/hooks/useLevels';
import Modal from '@/components/core/Modal';
import Input from '@/components/core/Input';
import Button from '@/components/core/Button';

interface LevelEditModalProps {
  isOpen: boolean;
  onClose: () => void;
  level: Level | null;
  onSaved: () => void;
}

export default function LevelEditModal({
  isOpen,
  onClose,
  level,
  onSaved,
}: LevelEditModalProps) {
  const [levelSummary, setLevelSummary] = useState('');
  const [description, setDescription] = useState('');
  const [nativeLevelTypeId, setNativeLevelTypeId] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const { updateLevel } = useLevels();

  useEffect(() => {
    if (!isOpen || !level) return;
    setLevelSummary(level.level_summary ?? '');
    setDescription(level.description ?? '');
    setNativeLevelTypeId(level.native_level_type_id ?? '');
    setError(null);
  }, [isOpen, level]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!level) return;

    setSubmitting(true);
    setError(null);

    try {
      await updateLevel(level.id, {
        level_summary: levelSummary.trim() || null,
        description: description.trim() || null,
        native_level_type_id: nativeLevelTypeId.trim() || null,
      });
      onSaved();
      onClose();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : '저장에 실패했습니다';
      setError(message);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} title={level ? `Lv${level.level_number} 레벨 수정` : '레벨 수정'} size="lg">
      <form onSubmit={handleSubmit} className="space-y-4">
        <Input
          label="레벨 요약"
          value={levelSummary}
          onChange={(e) => setLevelSummary(e.target.value)}
          placeholder="레벨 요약을 입력하세요"
        />
        <Input
          label="설명"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          placeholder="설명을 입력하세요"
        />
        <Input
          label="네이티브 레벨 타입 ID"
          value={nativeLevelTypeId}
          onChange={(e) => setNativeLevelTypeId(e.target.value)}
          placeholder="네이티브 레벨 타입 ID (선택사항)"
        />

        {error && <p className="text-sm text-error">{error}</p>}

        <div className="flex items-center justify-end pt-4 border-t border-border gap-2">
          <Button variant="secondary" onClick={onClose} disabled={submitting}>
            취소
          </Button>
          <Button type="submit" loading={submitting}>
            수정
          </Button>
        </div>
      </form>
    </Modal>
  );
}
