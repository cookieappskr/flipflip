'use client';

import React, { useState } from 'react';
import TypeTree from '@/components/types/TypeTree';
import TypeFormModal from '@/components/types/TypeFormModal';
import Button from '@/components/core/Button';
import Badge from '@/components/core/Badge';
import type { Type } from '@/types/database';

export default function TypesPage() {
  const [selectedType, setSelectedType] = useState<Type | null>(null);
  const [editModalOpen, setEditModalOpen] = useState(false);

  const handleSelectType = (type: Type | null) => {
    setSelectedType(type);
  };

  const handleSaved = () => {
    setEditModalOpen(false);
    // Clear selection so the tree can refetch and user re-selects
    setSelectedType(null);
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
          />
        </div>

        {/* Right Panel - Detail (2/3) */}
        <div className="w-2/3 overflow-y-auto">
          {selectedType ? (
            <div className="p-6">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-lg font-semibold text-text-primary">
                  {selectedType.type_name}
                </h2>
                <Button size="sm" onClick={() => setEditModalOpen(true)}>
                  수정
                </Button>
              </div>

              <div className="space-y-4">
                <DetailRow label="유형코드" value={selectedType.type_code} />
                <DetailRow
                  label="상위 유형 ID"
                  value={selectedType.parent_id ?? '(최상위)'}
                />
                <DetailRow label="정렬 순서" value={String(selectedType.sort_order)} />
                <DetailRow label="값 (Value)" value={selectedType.value} />
                <DetailRow label="설명" value={selectedType.description} />
                <div>
                  <span className="text-sm font-medium text-text-secondary">색상</span>
                  <div className="mt-1 flex items-center gap-2">
                    {selectedType.color ? (
                      <>
                        <div
                          className="w-6 h-6 rounded border border-border"
                          style={{ backgroundColor: selectedType.color }}
                        />
                        <span className="text-sm text-text-primary">
                          {selectedType.color}
                        </span>
                      </>
                    ) : (
                      <span className="text-sm text-text-secondary">-</span>
                    )}
                  </div>
                </div>
                <DetailRow label="아이콘" value={selectedType.icon} />
                <DetailRow label="추가 속성 1" value={selectedType.extra_attr_1} />
                <DetailRow label="추가 속성 2" value={selectedType.extra_attr_2} />
                <DetailRow label="추가 속성 3" value={selectedType.extra_attr_3} />
                <DetailRow label="추가 속성 4" value={selectedType.extra_attr_4} />
                <DetailRow label="추가 속성 5" value={selectedType.extra_attr_5} />
                <div>
                  <span className="text-sm font-medium text-text-secondary">상태</span>
                  <div className="mt-1">
                    <Badge variant={selectedType.is_active ? 'success' : 'default'}>
                      {selectedType.is_active ? '활성' : '비활성'}
                    </Badge>
                  </div>
                </div>
                <DetailRow label="생성일" value={selectedType.created_at} />
                <DetailRow label="수정일" value={selectedType.updated_at} />
              </div>

              <TypeFormModal
                isOpen={editModalOpen}
                onClose={() => setEditModalOpen(false)}
                parentId={selectedType.parent_id}
                editType={selectedType}
                onSaved={handleSaved}
              />
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
