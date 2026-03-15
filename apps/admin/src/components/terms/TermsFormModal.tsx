'use client';

import React, { useState, useEffect } from 'react';
import dynamic from 'next/dynamic';
import type { Terms, Type } from '@/types/database';
import { useTerms } from '@/lib/hooks/useTerms';
import Modal from '@/components/core/Modal';
import Input from '@/components/core/Input';
import Select from '@/components/core/Select';
import Toggle from '@/components/core/Toggle';
import Button from '@/components/core/Button';

const TermsEditor = dynamic(
  () =>
    import('@/components/terms/TermsEditor').then((mod) => ({
      default: mod.TermsEditor,
    })),
  {
    ssr: false,
    loading: () => (
      <div className="h-64 border border-border rounded-md animate-pulse bg-neutral-50" />
    ),
  }
);

const COUNTRY_OPTIONS = [
  { value: 'KR', label: 'KR (대한민국)' },
  { value: 'US', label: 'US (미국)' },
  { value: 'JP', label: 'JP (일본)' },
  { value: 'CN', label: 'CN (중국)' },
  { value: 'EU', label: 'EU (유럽)' },
];

interface TermsFormModalProps {
  isOpen: boolean;
  onClose: () => void;
  editTerms: Terms | null;
  termsTypes: Type[];
  copyFromTerms?: Terms | null;
  onSaved: () => void;
}

interface FormData {
  country_code: string;
  terms_type_id: string;
  version: string;
  revision_summary: string;
  summary: string;
  non_consent_notice: string;
  is_required: boolean;
  is_active: boolean;
  published_at: string;
  content: string;
}

function toDatetimeLocal(dateStr: string | null): string {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  const offset = d.getTimezoneOffset();
  const local = new Date(d.getTime() - offset * 60 * 1000);
  return local.toISOString().slice(0, 16);
}

export function TermsFormModal({
  isOpen,
  onClose,
  editTerms,
  termsTypes,
  copyFromTerms,
  onSaved,
}: TermsFormModalProps) {
  const { createTerms, updateTerms } = useTerms();
  const [saving, setSaving] = useState(false);

  const isEdit = !!editTerms;

  const initialData: FormData = {
    country_code: 'KR',
    terms_type_id: termsTypes[0]?.id ?? '',
    version: '',
    revision_summary: '',
    summary: '',
    non_consent_notice: '',
    is_required: true,
    is_active: false,
    published_at: '',
    content: '',
  };

  const [form, setForm] = useState<FormData>(initialData);

  useEffect(() => {
    if (!isOpen) return;

    if (editTerms) {
      setForm({
        country_code: editTerms.country_code,
        terms_type_id: editTerms.terms_type_id,
        version: editTerms.version,
        revision_summary: editTerms.revision_summary ?? '',
        summary: editTerms.summary ?? '',
        non_consent_notice: editTerms.non_consent_notice ?? '',
        is_required: editTerms.is_required,
        is_active: editTerms.is_active,
        published_at: toDatetimeLocal(editTerms.published_at),
        content: editTerms.content ?? '',
      });
    } else if (copyFromTerms) {
      setForm({
        country_code: copyFromTerms.country_code,
        terms_type_id: copyFromTerms.terms_type_id,
        version: '',
        revision_summary: '',
        summary: copyFromTerms.summary ?? '',
        non_consent_notice: copyFromTerms.non_consent_notice ?? '',
        is_required: copyFromTerms.is_required,
        is_active: false,
        published_at: '',
        content: copyFromTerms.content ?? '',
      });
    } else {
      setForm({
        ...initialData,
        terms_type_id: termsTypes[0]?.id ?? '',
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isOpen, editTerms, copyFromTerms]);

  const handleChange = (
    field: keyof FormData,
    value: string | boolean
  ) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);

    try {
      const payload = {
        country_code: form.country_code,
        terms_type_id: form.terms_type_id,
        version: form.version,
        revision_summary: form.revision_summary || null,
        summary: form.summary || null,
        non_consent_notice: form.non_consent_notice || null,
        is_required: form.is_required,
        is_active: form.is_active,
        published_at: form.published_at ? new Date(form.published_at).toISOString() : null,
        content: form.content || null,
      };

      if (isEdit && editTerms) {
        await updateTerms(editTerms.id, payload);
      } else {
        await createTerms(payload);
      }

      onSaved();
      onClose();
    } catch {
      // Error is handled inside the hook
    } finally {
      setSaving(false);
    }
  };

  const typeOptions = termsTypes.map((t) => ({
    value: t.id,
    label: t.type_name,
  }));

  const modalTitle = isEdit
    ? '약관 수정'
    : copyFromTerms
      ? '새 버전 생성'
      : '새 약관 생성';

  return (
    <Modal isOpen={isOpen} onClose={onClose} title={modalTitle} size="xl">
      <form onSubmit={handleSubmit} className="space-y-4 max-h-[70vh] overflow-y-auto pr-1">
        {/* Row: country_code + terms_type_id */}
        <div className="grid grid-cols-2 gap-4">
          <Select
            label="국가 코드"
            options={COUNTRY_OPTIONS}
            value={form.country_code}
            onChange={(e) => handleChange('country_code', e.target.value)}
          />
          <Select
            label="약관 유형"
            options={typeOptions}
            value={form.terms_type_id}
            onChange={(e) => handleChange('terms_type_id', e.target.value)}
            placeholder="유형 선택"
          />
        </div>

        {/* Version */}
        <Input
          label="버전"
          value={form.version}
          onChange={(e) => handleChange('version', e.target.value)}
          placeholder="예: 1.0"
          required
        />

        {/* Revision Summary */}
        <div className="w-full">
          <label className="block text-sm font-medium text-text-primary mb-1">
            개정 요약
          </label>
          <textarea
            value={form.revision_summary}
            onChange={(e) => handleChange('revision_summary', e.target.value)}
            rows={2}
            className="block w-full rounded-lg border border-border bg-surface px-3 py-2 text-sm text-text-primary placeholder:text-text-secondary focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
            placeholder="변경 사항 요약"
          />
        </div>

        {/* Summary */}
        <Input
          label="요약"
          value={form.summary}
          onChange={(e) => handleChange('summary', e.target.value)}
          placeholder="약관 요약 (최대 200자)"
          maxLength={200}
        />

        {/* Non-consent Notice */}
        <div className="w-full">
          <label className="block text-sm font-medium text-text-primary mb-1">
            비동의 시 안내
          </label>
          <textarea
            value={form.non_consent_notice}
            onChange={(e) => handleChange('non_consent_notice', e.target.value)}
            rows={2}
            className="block w-full rounded-lg border border-border bg-surface px-3 py-2 text-sm text-text-primary placeholder:text-text-secondary focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
            placeholder="동의하지 않을 경우 안내 문구"
          />
        </div>

        {/* Toggles Row */}
        <div className="flex items-center gap-6">
          <Toggle
            label="필수 동의"
            checked={form.is_required}
            onChange={(checked) => handleChange('is_required', checked)}
          />
          <Toggle
            label="활성"
            checked={form.is_active}
            onChange={(checked) => handleChange('is_active', checked)}
          />
        </div>

        {/* Published At */}
        <Input
          label="공개일"
          type="datetime-local"
          value={form.published_at}
          onChange={(e) => handleChange('published_at', e.target.value)}
        />

        {/* Content (Rich Text Editor) */}
        <div className="w-full">
          <label className="block text-sm font-medium text-text-primary mb-1">
            내용
          </label>
          <TermsEditor
            content={form.content}
            onChange={(html) => handleChange('content', html)}
          />
        </div>

        {/* Actions */}
        <div className="flex justify-end gap-2 pt-2">
          <Button variant="secondary" onClick={onClose} disabled={saving}>
            취소
          </Button>
          <Button type="submit" loading={saving}>
            {isEdit ? '수정' : '생성'}
          </Button>
        </div>
      </form>
    </Modal>
  );
}
