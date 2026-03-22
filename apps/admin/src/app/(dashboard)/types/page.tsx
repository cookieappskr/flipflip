'use client';

import React, { useState, useEffect, useRef, useCallback } from 'react';
import TypeTree from '@/components/types/TypeTree';
import TypeFormModal from '@/components/types/TypeFormModal';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';
import Toggle from '@/components/core/Toggle';
import { useTypes } from '@/lib/hooks/useTypes';
import type { Type, TypeInsert } from '@/types/database';

function formatDateTime(dateStr: string | null | undefined): string {
  if (!dateStr) return '-';
  const d = new Date(dateStr);
  if (isNaN(d.getTime())) return dateStr;
  const yyyy = d.getFullYear();
  const MM = String(d.getMonth() + 1).padStart(2, '0');
  const dd = String(d.getDate()).padStart(2, '0');
  const hh = String(d.getHours()).padStart(2, '0');
  const mm = String(d.getMinutes()).padStart(2, '0');
  return `${yyyy}-${MM}-${dd} ${hh}:${mm}`;
}

export default function TypesPage() {
  const [selectedType, setSelectedType] = useState<Type | null>(null);
  // Key to force TypeTree remount/refetch after save
  const [treeRefreshKey, setTreeRefreshKey] = useState(0);

  // Inline edit form state
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
  const [saveMessage, setSaveMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const { updateType, deleteType, checkDuplicate } = useTypes(undefined);

  // Populate form when selectedType changes
  useEffect(() => {
    if (selectedType) {
      setTypeName(selectedType.type_name);
      setTypeCode(selectedType.type_code);
      setSortOrder(selectedType.display_order);
      setValue(selectedType.value ?? '');
      setDescription(selectedType.description ?? '');
      setColor(selectedType.color ?? '');
      setIcon(selectedType.icon ?? '');
      setExtraAttr1(selectedType.extra_attr_1 ?? '');
      setExtraAttr2(selectedType.extra_attr_2 ?? '');
      setExtraAttr3(selectedType.extra_attr_3 ?? '');
      setExtraAttr4(selectedType.extra_attr_4 ?? '');
      setExtraAttr5(selectedType.extra_attr_5 ?? '');
      setIsActive(selectedType.is_active);
    }
    setDuplicateError(false);
    setShowDeleteConfirm(false);
    setSaveMessage(null);
  }, [selectedType]);

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
          selectedType?.parent_id ?? null,
          newCode.trim(),
          selectedType?.id,
        );
        setDuplicateError(isDuplicate);
      }, 400);
    },
    [checkDuplicate, selectedType],
  );

  useEffect(() => {
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, []);

  const handleSelectType = (type: Type | null) => {
    setSelectedType(type);
  };

  const handleSave = async () => {
    if (!selectedType) return;
    if (duplicateError || !typeName.trim() || !typeCode.trim()) return;

    setSubmitting(true);
    setSaveMessage(null);
    try {
      const data: Partial<TypeInsert> = {
        parent_id: selectedType.parent_id,
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

      const updated = await updateType(selectedType.id, data);
      setSaveMessage({ type: 'success', text: '저장되었습니다.' });
      setTimeout(() => setSaveMessage(null), 3000);
      // Refresh the tree to reflect changes, keep selection
      setTreeRefreshKey((k) => k + 1);
      setSelectedType(updated);
    } catch (err) {
      const message = err instanceof Error ? err.message : '저장에 실패했습니다. 권한을 확인해주세요.';
      setSaveMessage({ type: 'error', text: message });
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async () => {
    if (!selectedType) return;
    setSubmitting(true);
    try {
      await deleteType(selectedType.id);
      setTreeRefreshKey((k) => k + 1);
      setSelectedType(null);
    } catch {
      setSaveMessage({ type: 'error', text: '삭제에 실패했습니다.' });
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="h-full flex flex-col">
      <div className="px-6 py-4 border-b border-border">
        <h1 className="text-xl font-bold text-text-primary">유형관리</h1>
      </div>

      <div className="flex-1 flex min-h-0">
        {/* Left Panel - Tree (1/3) */}
        <div className="w-1/3 border-r border-border overflow-hidden flex flex-col">
          <TypeTree
            selectedTypeId={selectedType?.id ?? null}
            onSelectType={handleSelectType}
            refreshTrigger={treeRefreshKey}
          />
        </div>

        {/* Right Panel - Inline Edit (2/3) */}
        <div className="w-2/3 overflow-y-auto">
          {selectedType ? (
            <div className="p-6">
              <h2 className="text-lg font-semibold text-text-primary mb-6">
                {selectedType.type_name}
              </h2>

              <div className="space-y-4">
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

                <DetailRow
                  label="상위 유형 ID"
                  value={selectedType.parent_id ?? '(최상위)'}
                />

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
                  <label className="block text-sm font-medium text-text-primary mb-1">색상</label>
                  <div className="flex items-center gap-3">
                    <input
                      type="color"
                      value={color.trim() || '#000000'}
                      onChange={(e) => setColor(e.target.value)}
                      className="w-10 h-10 rounded-md border border-border cursor-pointer shrink-0 p-0.5"
                    />
                    <Input
                      value={color}
                      onChange={(e) => setColor(e.target.value)}
                      placeholder="#FF5733"
                    />
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

                <DetailRow label="생성일" value={formatDateTime(selectedType.created_at)} />
                <DetailRow label="수정일" value={formatDateTime(selectedType.updated_at)} />
              </div>

              {/* Save message */}
              {saveMessage && (
                <div className={`mt-4 px-4 py-2 rounded-lg text-sm font-medium ${
                  saveMessage.type === 'success'
                    ? 'bg-green-100 text-green-700'
                    : 'bg-red-100 text-red-700'
                }`}>
                  {saveMessage.text}
                </div>
              )}

              {/* Action buttons */}
              <div className="flex items-center justify-between pt-6 mt-6 border-t border-border">
                <div>
                  {!showDeleteConfirm && (
                    <Button
                      variant="danger"
                      size="sm"
                      onClick={() => setShowDeleteConfirm(true)}
                    >
                      삭제
                    </Button>
                  )}
                  {showDeleteConfirm && (
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

                <Button
                  onClick={handleSave}
                  loading={submitting}
                  disabled={duplicateError || !typeName.trim() || !typeCode.trim()}
                >
                  저장
                </Button>
              </div>
            </div>
          ) : (
            <div className="flex items-center justify-center h-full text-text-secondary">
              <p className="text-sm">왼쪽 목록에서 유형을 선택하세요.</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

function DetailRow({
  label,
  value,
}: {
  label: string;
  value: string | null | undefined;
}) {
  return (
    <div>
      <span className="text-sm font-medium text-text-secondary">{label}</span>
      <p className="mt-1 text-sm text-text-primary">{value || '-'}</p>
    </div>
  );
}
