'use client';

import React, { useState } from 'react';
import { ChevronDown, ChevronRight, Plus } from 'lucide-react';
import { useTypes } from '@/lib/hooks/useTypes';
import Button from '@/components/core/Button';
import Badge from '@/components/core/Badge';
import type { Type } from '@/types/database';

interface TypeTreeProps {
  selectedTypeId: string | null;
  onSelectType: (type: Type | null) => void;
}

function TypeChildren({
  parentId,
  selectedTypeId,
  onSelectType,
}: {
  parentId: string;
  selectedTypeId: string | null;
  onSelectType: (type: Type | null) => void;
}) {
  const { types, loading } = useTypes(parentId);

  if (loading) return <p className="pl-12 py-1 text-sm text-text-secondary">로딩 중...</p>;

  if (types.length === 0) {
    return <p className="pl-12 py-1 text-sm text-text-secondary">하위 유형 없음</p>;
  }

  return (
    <ul className="pl-6 border-l-2 border-neutral-200 ml-4">
      {types.map((child) => (
        <li key={child.id}>
          <button
            type="button"
            onClick={() => onSelectType(child)}
            className={[
              'w-full text-left px-4 py-2 text-sm rounded-md transition-colors',
              selectedTypeId === child.id
                ? 'bg-primary-50 text-primary-700'
                : 'hover:bg-neutral-50 text-text-primary',
            ].join(' ')}
          >
            <div className="flex items-center justify-between">
              <span>
                {child.type_name}{' '}
                <span className="text-text-secondary text-xs">({child.type_code})</span>
              </span>
              <Badge variant={child.is_active ? 'success' : 'default'}>
                {child.is_active ? '활성' : '비활성'}
              </Badge>
            </div>
          </button>
        </li>
      ))}
    </ul>
  );
}

export default function TypeTree({ selectedTypeId, onSelectType }: TypeTreeProps) {
  const { types: rootTypes, loading, error } = useTypes(null);
  const [expandedIds, setExpandedIds] = useState<Set<string>>(new Set());
  const [showModal, setShowModal] = useState(false);
  const [addChildParentId, setAddChildParentId] = useState<string | null>(null);

  const toggleExpand = (id: string) => {
    setExpandedIds((prev) => {
      const next = new Set(prev);
      if (next.has(id)) {
        next.delete(id);
      } else {
        next.add(id);
      }
      return next;
    });
  };

  // Expose modal state for parent to use
  const handleAddRoot = () => {
    setAddChildParentId(null);
    setShowModal(true);
  };

  const handleAddChild = (parentId: string, e: React.MouseEvent) => {
    e.stopPropagation();
    setAddChildParentId(parentId);
    setShowModal(true);
  };

  const handleRowClick = (root: Type) => {
    onSelectType(root);
    toggleExpand(root.id);
  };

  // Lazy import to avoid circular deps
  const TypeFormModal = React.lazy(
    () => import('@/components/types/TypeFormModal')
  );

  return (
    <div className="h-full flex flex-col">
      <div className="flex items-center justify-between px-4 py-3 border-b border-border">
        <h3 className="text-sm font-semibold text-text-primary">유형 목록</h3>
        <Button size="sm" onClick={handleAddRoot}>
          유형 추가
        </Button>
      </div>

      <div className="flex-1 overflow-y-auto py-2">
        {loading ? (
          <p className="px-4 py-2 text-sm text-text-secondary">로딩 중...</p>
        ) : error ? (
          <p className="px-4 py-2 text-sm text-error">{error}</p>
        ) : rootTypes.length === 0 ? (
          <p className="px-4 py-2 text-sm text-text-secondary">등록된 유형이 없습니다.</p>
        ) : (
          <ul className="space-y-1">
            {rootTypes.map((root) => {
              const isExpanded = expandedIds.has(root.id);
              return (
                <li key={root.id}>
                  <div
                    onClick={() => handleRowClick(root)}
                    className={[
                      'flex items-center gap-1 px-2 py-2 cursor-pointer rounded-md transition-colors',
                      selectedTypeId === root.id
                        ? 'bg-primary-50'
                        : 'hover:bg-neutral-50',
                    ].join(' ')}
                  >
                    <span
                      className="p-0.5 rounded hover:bg-neutral-200 text-text-secondary"
                    >
                      {isExpanded ? (
                        <ChevronDown className="w-4 h-4" />
                      ) : (
                        <ChevronRight className="w-4 h-4" />
                      )}
                    </span>

                    <span className="flex-1 text-left text-sm font-medium text-text-primary">
                      <span>
                        {root.type_name}{' '}
                        <span className="text-text-secondary text-xs font-normal">
                          ({root.type_code})
                        </span>
                      </span>
                    </span>

                    <Badge variant={root.is_active ? 'success' : 'default'} className="mr-1">
                      {root.is_active ? '활성' : '비활성'}
                    </Badge>

                    <button
                      type="button"
                      onClick={(e) => handleAddChild(root.id, e)}
                      className="p-0.5 rounded hover:bg-neutral-200 text-text-secondary"
                      title="하위 유형 추가"
                    >
                      <Plus className="w-4 h-4" />
                    </button>
                  </div>

                  {isExpanded && (
                    <TypeChildren
                      parentId={root.id}
                      selectedTypeId={selectedTypeId}
                      onSelectType={onSelectType}
                    />
                  )}
                </li>
              );
            })}
          </ul>
        )}
      </div>

      {showModal && (
        <React.Suspense fallback={null}>
          <TypeFormModal
            isOpen={showModal}
            onClose={() => setShowModal(false)}
            parentId={addChildParentId}
            editType={null}
            onSaved={() => {
              setShowModal(false);
            }}
          />
        </React.Suspense>
      )}
    </div>
  );
}
