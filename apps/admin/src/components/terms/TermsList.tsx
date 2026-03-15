'use client';

import React from 'react';
import type { Terms, Type } from '@/types/database';
import Select from '@/components/core/Select';
import Badge from '@/components/core/Badge';

interface TermsFilters {
  countryCode: string;
  termsTypeId: string;
}

interface TermsListProps {
  terms: Terms[];
  selectedTermsId: string | null;
  onSelectTerms: (id: string) => void;
  termsTypes: Type[];
  loading: boolean;
  filters: TermsFilters;
  onFilterChange: (filters: TermsFilters) => void;
}

const COUNTRY_OPTIONS = [
  { value: '', label: '전체 국가' },
  { value: 'KR', label: 'KR (대한민국)' },
  { value: 'US', label: 'US (미국)' },
  { value: 'JP', label: 'JP (일본)' },
  { value: 'CN', label: 'CN (중국)' },
  { value: 'EU', label: 'EU (유럽)' },
];

function formatDate(dateStr: string | null): string {
  if (!dateStr) return '-';
  return new Date(dateStr).toLocaleDateString('ko-KR', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  });
}

function truncate(text: string | null, maxLen: number): string {
  if (!text) return '-';
  return text.length > maxLen ? text.slice(0, maxLen) + '...' : text;
}

export function TermsList({
  terms,
  selectedTermsId,
  onSelectTerms,
  termsTypes,
  loading,
  filters,
  onFilterChange,
}: TermsListProps) {
  const typeOptions = [
    { value: '', label: '전체 유형' },
    ...termsTypes.map((t) => ({ value: t.id, label: t.type_name })),
  ];

  return (
    <div className="flex flex-col h-full">
      {/* Filter Section */}
      <div className="flex gap-2 mb-4">
        <Select
          options={COUNTRY_OPTIONS}
          value={filters.countryCode}
          onChange={(e) =>
            onFilterChange({ ...filters, countryCode: e.target.value })
          }
        />
        <Select
          options={typeOptions}
          value={filters.termsTypeId}
          onChange={(e) =>
            onFilterChange({ ...filters, termsTypeId: e.target.value })
          }
        />
      </div>

      {/* List */}
      <div className="flex-1 overflow-y-auto border border-border rounded-lg">
        {loading ? (
          <div className="flex items-center justify-center h-40 text-text-secondary text-sm">
            불러오는 중...
          </div>
        ) : terms.length === 0 ? (
          <div className="flex items-center justify-center h-40 text-text-secondary text-sm">
            약관이 없습니다.
          </div>
        ) : (
          <ul className="divide-y divide-border">
            {terms.map((item) => (
              <li
                key={item.id}
                onClick={() => onSelectTerms(item.id)}
                className={[
                  'px-4 py-3 cursor-pointer transition-colors duration-100',
                  selectedTermsId === item.id
                    ? 'bg-primary-50 border-l-4 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm font-semibold text-text-primary">
                    v{item.version}
                  </span>
                  <Badge variant={item.is_active ? 'success' : 'default'}>
                    {item.is_active ? '활성' : '비활성'}
                  </Badge>
                </div>
                <p className="text-xs text-text-secondary mb-1">
                  {truncate(item.revision_summary, 40)}
                </p>
                <p className="text-xs text-text-secondary">
                  {formatDate(item.published_at)}
                </p>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
