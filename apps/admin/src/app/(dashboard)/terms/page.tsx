'use client';

import React, { useState, useEffect, useMemo } from 'react';
import { useTerms } from '@/lib/hooks/useTerms';
import { useTypes } from '@/lib/hooks/useTypes';
import { TermsList } from '@/components/terms/TermsList';
import { TermsFormModal } from '@/components/terms/TermsFormModal';
import Badge from '@/components/core/Badge';
import Button from '@/components/core/Button';
import type { Terms } from '@/types/database';

interface Filters {
  countryCode: string;
  termsTypeId: string;
}

// Find the TERMS_TYPE root type, then use its id to fetch children
function useTermsTypes() {
  const { types: rootTypes } = useTypes(null);

  const termsTypeRoot = useMemo(
    () => rootTypes.find((t) => t.type_code === 'TERMS_TYPE'),
    [rootTypes]
  );

  const { types: termsTypes, loading } = useTypes(termsTypeRoot?.id ?? undefined);

  return { termsTypes, loading };
}

function formatDate(dateStr: string | null): string {
  if (!dateStr) return '-';
  return new Date(dateStr).toLocaleDateString('ko-KR', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  });
}

type ModalMode = 'create' | 'edit' | 'copy';

export default function TermsPage() {
  const [filters, setFilters] = useState<Filters>({
    countryCode: '',
    termsTypeId: '',
  });
  const [selectedTermsId, setSelectedTermsId] = useState<string | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [modalMode, setModalMode] = useState<ModalMode>('create');

  const { termsTypes, loading: typesLoading } = useTermsTypes();

  const { terms, loading: termsLoading, refetch } = useTerms({
    countryCode: filters.countryCode || undefined,
    termsTypeId: filters.termsTypeId || undefined,
  });

  // Auto-select first item when terms change
  useEffect(() => {
    if (terms.length > 0 && !terms.find((t) => t.id === selectedTermsId)) {
      setSelectedTermsId(terms[0].id);
    }
  }, [terms, selectedTermsId]);

  const selectedTerms: Terms | null = useMemo(
    () => terms.find((t) => t.id === selectedTermsId) ?? null,
    [terms, selectedTermsId]
  );

  const getTypeName = (typeId: string): string => {
    return termsTypes.find((t) => t.id === typeId)?.type_name ?? typeId;
  };

  const openModal = (mode: ModalMode) => {
    setModalMode(mode);
    setModalOpen(true);
  };

  const handleSaved = () => {
    refetch();
  };

  const loading = termsLoading || typesLoading;

  return (
    <div>
      {/* Page Header */}
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-text-primary">약관관리</h1>
        <Button onClick={() => openModal('create')}>새 약관</Button>
      </div>

      {/* Main Layout */}
      <div className="flex gap-6" style={{ minHeight: 'calc(100vh - 200px)' }}>
        {/* Left Panel - List */}
        <div className="w-1/3 flex-shrink-0">
          <TermsList
            terms={terms}
            selectedTermsId={selectedTermsId}
            onSelectTerms={setSelectedTermsId}
            termsTypes={termsTypes}
            loading={loading}
            filters={filters}
            onFilterChange={setFilters}
          />
        </div>

        {/* Right Panel - Detail */}
        <div className="flex-1 border border-border rounded-lg bg-surface">
          {loading ? (
            <div className="flex items-center justify-center h-full text-text-secondary text-sm">
              불러오는 중...
            </div>
          ) : !selectedTerms ? (
            <div className="flex items-center justify-center h-full text-text-secondary text-sm">
              약관을 선택하세요.
            </div>
          ) : (
            <div className="p-6 overflow-y-auto" style={{ maxHeight: 'calc(100vh - 200px)' }}>
              {/* Detail Header */}
              <div className="flex items-center justify-between mb-6">
                <div className="flex items-center gap-3">
                  <h2 className="text-lg font-semibold text-text-primary">
                    v{selectedTerms.version}
                  </h2>
                  <Badge variant={selectedTerms.is_active ? 'success' : 'default'}>
                    {selectedTerms.is_active ? '활성' : '비활성'}
                  </Badge>
                  <Badge variant={selectedTerms.is_required ? 'info' : 'default'}>
                    {selectedTerms.is_required ? '필수' : '선택'}
                  </Badge>
                </div>
                <div className="flex gap-2">
                  <Button
                    variant="secondary"
                    size="sm"
                    onClick={() => openModal('copy')}
                  >
                    새 버전
                  </Button>
                  <Button size="sm" onClick={() => openModal('edit')}>
                    수정
                  </Button>
                </div>
              </div>

              {/* Detail Fields */}
              <div className="grid grid-cols-2 gap-4 mb-6">
                <DetailField label="국가 코드" value={selectedTerms.country_code} />
                <DetailField
                  label="약관 유형"
                  value={getTypeName(selectedTerms.terms_type_id)}
                />
                <DetailField label="버전" value={selectedTerms.version} />
                <DetailField
                  label="공개일"
                  value={formatDate(selectedTerms.published_at)}
                />
                <DetailField
                  label="생성일"
                  value={formatDate(selectedTerms.created_at)}
                />
                <DetailField
                  label="수정일"
                  value={formatDate(selectedTerms.updated_at)}
                />
              </div>

              {selectedTerms.revision_summary && (
                <DetailField
                  label="개정 요약"
                  value={selectedTerms.revision_summary}
                  className="mb-4"
                />
              )}

              {selectedTerms.summary && (
                <DetailField
                  label="요약"
                  value={selectedTerms.summary}
                  className="mb-4"
                />
              )}

              {selectedTerms.non_consent_notice && (
                <DetailField
                  label="비동의 시 안내"
                  value={selectedTerms.non_consent_notice}
                  className="mb-4"
                />
              )}

              {/* Content */}
              <div className="mt-6">
                <h3 className="text-sm font-medium text-text-secondary mb-2">
                  내용
                </h3>
                <div
                  className="prose prose-sm max-w-none border border-border rounded-lg p-4 bg-neutral-50"
                  dangerouslySetInnerHTML={{
                    __html: selectedTerms.content ?? '<p>내용이 없습니다.</p>',
                  }}
                />
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Modal */}
      <TermsFormModal
        isOpen={modalOpen}
        onClose={() => setModalOpen(false)}
        editTerms={modalMode === 'edit' ? selectedTerms : null}
        termsTypes={termsTypes}
        copyFromTerms={modalMode === 'copy' ? selectedTerms : null}
        onSaved={handleSaved}
      />
    </div>
  );
}

function DetailField({
  label,
  value,
  className = '',
}: {
  label: string;
  value: string;
  className?: string;
}) {
  return (
    <div className={className}>
      <dt className="text-xs font-medium text-text-secondary mb-0.5">
        {label}
      </dt>
      <dd className="text-sm text-text-primary">{value}</dd>
    </div>
  );
}
