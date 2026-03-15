'use client';

import React, { useState, useEffect, useRef, useCallback } from 'react';
import { useTypes } from '@/lib/hooks/useTypes';
import Modal from '@/components/core/Modal';
import Input from '@/components/core/Input';
import Button from '@/components/core/Button';
import Toggle from '@/components/core/Toggle';
import type { Type, TypeInsert } from '@/types/database';

interface TypeFormModalProps {
  isOpen: boolean;
  onClose: () => void;
  parentId: string | null;
  editType: Type | null;
  onSaved: () => void;
}

export default function TypeFormModal({
  isOpen,
  onClose,
  parentId,
  editType,
  onSaved,
}: TypeFormModalProps) {
  const isEditMode = editType !== null;
  const effectiveParentId = isEditMode ? (editType.parent_id ?? null) : parentId;

  const { createType, updateType, deleteType, checkDuplicate } = useTypes(undefined);

  const [typeName, setTypeName] = useState('');
  const [typeCode, setTypeCode] = useState('');
  const [sortOrder, setSortOrder] = useState(0);
  const [value, setValue] = useState('');
  const [description, setDescription] = useState('');
  const [color, setColor] = useState('');
  const [icon, setIcon] = useState('');
  const [extraAttr1, setExtraAttr1] = useState('');
  const [extraAttr2, setExtraAttr2] = useState('');
  const [extraAttr3, setExtraAttr3] = useState('');
  const [extraAttr4, setExtraAttr4] = useState('');
  const [extraAttr5, setExtraAttr5] = useState('');
  const [isActive, setIsActive] = useState(true);

  const [duplicateError, setDuplicateError] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false);

  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Populate form when editing
  useEffect(() => {
    if (editType) {
      setTypeName(editType.type_name);
      setTypeCode(editType.type_code);
      setSortOrder(editType.display_order);
      setValue(editType.value ?? '');
      setDescription(editType.description ?? '');
      setColor(editType.color ?? '');
      setIcon(editType.icon ?? '');
      setExtraAttr1(editType.extra_attr_1 ?? '');
      setExtraAttr2(editType.extra_attr_2 ?? '');
      setExtraAttr3(editType.extra_attr_3 ?? '');
      setExtraAttr4(editType.extra_attr_4 ?? '');
      setExtraAttr5(editType.extra_attr_5 ?? '');
      setIsActive(editType.is_active);
    } else {
      setTypeName('');
      setTypeCode('');
      setSortOrder(0);
      setValue('');
      setDescription('');
      setColor('');
      setIcon('');
      setExtraAttr1('');
      setExtraAttr2('');
      setExtraAttr3('');
      setExtraAttr4('');
      setExtraAttr5('');
      setIsActive(true);
    }
    setDuplicateError(false);
    setShowDeleteConfirm(false);
  }, [editType, isOpen]);

  // Debounced duplicate check
  const handleTypeCodeChange = useCallback(
    (newCode: string) => {
      setTypeCode(newCode);
      setDuplicateError(false);

      if (debounceRef.current) {
        clearTimeout(debounceRef.current);
      }

      if (!newCode.trim()) return;

      debounceRef.current = setTimeout(async () => {
        const isDuplicate = await checkDuplicate(
          effectiveParentId,
          newCode.trim(),
          editType?.id,
        );
        setDuplicateError(isDuplicate);
      }, 400);
    },
    [checkDuplicate, effectiveParentId, editType],
  );

  // Cleanup debounce on unmount
  useEffect(() => {
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (duplicateError || !typeName.trim() || !typeCode.trim()) return;

    setSubmitting(true);
    try {
      const data: TypeInsert = {
        parent_id: effectiveParentId,
        type_name: typeName.trim(),
        type_code: typeCode.trim(),
        display_order: sortOrder,
        value: value.trim() || null,
        description: description.trim() || null,
        color: color.trim() || null,
        icon: icon.trim() || null,
        extra_attr_1: extraAttr1.trim() || null,
        extra_attr_2: extraAttr2.trim() || null,
        extra_attr_3: extraAttr3.trim() || null,
        extra_attr_4: extraAttr4.trim() || null,
        extra_attr_5: extraAttr5.trim() || null,
        is_active: isActive,
      };

      if (isEditMode && editType) {
        await updateType(editType.id, data);
      } else {
        await createType(data);
      }

      onSaved();
      onClose();
    } catch {
      // Error is handled inside the hook
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async () => {
    if (!editType) return;
    setSubmitting(true);
    try {
      await deleteType(editType.id);
      onSaved();
      onClose();
    } catch {
      // Error is handled inside the hook
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Modal
      isOpen={isOpen}
      onClose={onClose}
      title={isEditMode ? '유형 수정' : '유형 추가'}
      size="lg"
    >
      <form onSubmit={handleSubmit} className="space-y-4">
        <Input
          label="유형명 *"
          value={typeName}
          onChange={(e) => setTypeName(e.target.value)}
          placeholder="유형명을 입력하세요"
          required
        />

        <div>
          <Input
            label="유형코드 *"
            value={typeCode}
            onChange={(e) => handleTypeCodeChange(e.target.value)}
            placeholder="유형코드를 입력하세요"
            error={duplicateError ? '이미 사용 중인 코드입니다.' : undefined}
            required
          />
        </div>

        <Input
          label="정렬 순서"
          type="number"
          value={String(sortOrder)}
          onChange={(e) => setSortOrder(Number(e.target.value) || 0)}
        />

        <Input
          label="값 (Value)"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          placeholder="값을 입력하세요"
        />

        <div className="w-full">
          <label className="block text-sm font-medium text-text-primary mb-1">
            설명
          </label>
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            placeholder="설명을 입력하세요"
            rows={3}
            className="block w-full rounded-lg border border-border bg-surface px-3 py-2 text-sm text-text-primary placeholder:text-text-secondary focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
          />
        </div>

        <div>
          <div className="flex items-end gap-3">
            <div className="flex-1">
              <Input
                label="색상"
                value={color}
                onChange={(e) => setColor(e.target.value)}
                placeholder="#FF5733"
              />
            </div>
            {color.trim() && (
              <div
                className="w-10 h-10 rounded-md border border-border shrink-0"
                style={{ backgroundColor: color.trim() }}
              />
            )}
          </div>
        </div>

        <Input
          label="아이콘 (lucide icon name)"
          value={icon}
          onChange={(e) => setIcon(e.target.value)}
          placeholder="예: star, heart, bookmark"
        />

        <div className="grid grid-cols-2 gap-3">
          <Input
            label="추가 속성 1"
            value={extraAttr1}
            onChange={(e) => setExtraAttr1(e.target.value)}
          />
          <Input
            label="추가 속성 2"
            value={extraAttr2}
            onChange={(e) => setExtraAttr2(e.target.value)}
          />
          <Input
            label="추가 속성 3"
            value={extraAttr3}
            onChange={(e) => setExtraAttr3(e.target.value)}
          />
          <Input
            label="추가 속성 4"
            value={extraAttr4}
            onChange={(e) => setExtraAttr4(e.target.value)}
          />
          <Input
            label="추가 속성 5"
            value={extraAttr5}
            onChange={(e) => setExtraAttr5(e.target.value)}
          />
        </div>

        <Toggle
          checked={isActive}
          onChange={setIsActive}
          label="활성 상태"
        />

        <div className="flex items-center justify-between pt-4 border-t border-border">
          <div>
            {isEditMode && !showDeleteConfirm && (
              <Button
                variant="danger"
                size="sm"
                onClick={() => setShowDeleteConfirm(true)}
              >
                삭제
              </Button>
            )}
            {isEditMode && showDeleteConfirm && (
              <div className="flex items-center gap-2">
                <span className="text-sm text-error">정말 삭제하시겠습니까?</span>
                <Button
                  variant="danger"
                  size="sm"
                  onClick={handleDelete}
                  loading={submitting}
                >
                  확인
                </Button>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => setShowDeleteConfirm(false)}
                >
                  취소
                </Button>
              </div>
            )}
          </div>

          <div className="flex items-center gap-2">
            <Button variant="secondary" onClick={onClose}>
              취소
            </Button>
            <Button
              type="submit"
              loading={submitting}
              disabled={duplicateError || !typeName.trim() || !typeCode.trim()}
            >
              {isEditMode ? '수정' : '추가'}
            </Button>
          </div>
        </div>
      </form>
    </Modal>
  );
}
