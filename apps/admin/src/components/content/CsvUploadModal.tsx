'use client';

import React, { useState, useRef } from 'react';
import { createClient } from '@/lib/supabase/client';
import {
  parseCsvFile,
  validateSkillsCsv,
  validateSentencesCsv,
  validateExpressionsCsv,
  type CsvValidationError,
} from '@/lib/utils/csv';
import Modal from '@/components/core/Modal';
import Button from '@/components/core/Button';

type CsvMode = 'skills' | 'sentences' | 'expressions';

interface CsvUploadModalProps {
  isOpen: boolean;
  onClose: () => void;
  mode: CsvMode;
  parentId: string;
  onUploaded: () => void;
}

const MODE_TITLES: Record<CsvMode, string> = {
  skills: 'CSV 업로드 - 스킬',
  sentences: 'CSV 업로드 - 문장',
  expressions: 'CSV 업로드 - 표현',
};

const MODE_TABLES: Record<CsvMode, string> = {
  skills: 'skills',
  sentences: 'sentences',
  expressions: 'expressions',
};

const MODE_PARENT_KEY: Record<CsvMode, string> = {
  skills: 'level_id',
  sentences: 'skill_id',
  expressions: 'sentence_id',
};

export default function CsvUploadModal({
  isOpen,
  onClose,
  mode,
  parentId,
  onUploaded,
}: CsvUploadModalProps) {
  const fileRef = useRef<HTMLInputElement>(null);
  const [rows, setRows] = useState<Record<string, string>[]>([]);
  const [errors, setErrors] = useState<CsvValidationError[]>([]);
  const [uploading, setUploading] = useState(false);
  const [uploadError, setUploadError] = useState<string | null>(null);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setUploadError(null);
    const { data, errors: parseErrors } = await parseCsvFile<Record<string, string>>(file);

    let validationErrors = [...parseErrors];
    if (mode === 'skills') {
      validationErrors = [...validationErrors, ...validateSkillsCsv(data)];
    } else if (mode === 'sentences') {
      validationErrors = [...validationErrors, ...validateSentencesCsv(data)];
    } else if (mode === 'expressions') {
      validationErrors = [...validationErrors, ...validateExpressionsCsv(data)];
    }

    setRows(data);
    setErrors(validationErrors);
  };

  const handleUpload = async () => {
    if (rows.length === 0 || errors.length > 0) return;

    setUploading(true);
    setUploadError(null);

    try {
      const supabase = createClient();
      const parentKey = MODE_PARENT_KEY[mode];
      const table = MODE_TABLES[mode];

      const insertData = rows.map((row) => ({
        ...row,
        [parentKey]: parentId,
      }));

      const { error } = await (supabase.from(table) as ReturnType<typeof supabase.from>).insert(insertData as never);

      if (error) throw error;

      onUploaded();
      handleReset();
      onClose();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : '업로드에 실패했습니다';
      setUploadError(message);
    } finally {
      setUploading(false);
    }
  };

  const handleReset = () => {
    setRows([]);
    setErrors([]);
    setUploadError(null);
    if (fileRef.current) fileRef.current.value = '';
  };

  const handleClose = () => {
    handleReset();
    onClose();
  };

  const previewRows = rows.slice(0, 10);
  const columns = previewRows.length > 0 ? Object.keys(previewRows[0]) : [];

  return (
    <Modal isOpen={isOpen} onClose={handleClose} title={MODE_TITLES[mode]} size="xl">
      <div className="space-y-4">
        {/* File Input */}
        <div>
          <label className="block text-sm font-medium text-text-primary mb-1">
            CSV 파일 선택
          </label>
          <input
            ref={fileRef}
            type="file"
            accept=".csv"
            onChange={handleFileChange}
            className="block w-full text-sm text-text-primary file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border file:border-border file:text-sm file:font-medium file:bg-surface file:text-text-primary hover:file:bg-neutral-50"
          />
        </div>

        {/* Validation Errors */}
        {errors.length > 0 && (
          <div className="rounded-lg border border-error bg-red-50 p-3">
            <p className="text-sm font-medium text-error mb-1">
              검증 오류 ({errors.length}건)
            </p>
            <ul className="text-xs text-error space-y-0.5 max-h-32 overflow-y-auto">
              {errors.map((err, i) => (
                <li key={i}>
                  행 {err.row + 1}{err.field ? ` [${err.field}]` : ''}: {err.message}
                </li>
              ))}
            </ul>
          </div>
        )}

        {/* Preview Table */}
        {previewRows.length > 0 && (
          <div>
            <p className="text-sm font-medium text-text-primary mb-2">
              미리보기 (총 {rows.length}건 중 {previewRows.length}건)
            </p>
            <div className="overflow-x-auto border border-border rounded-lg">
              <table className="min-w-full text-xs">
                <thead className="bg-surface-secondary">
                  <tr>
                    {columns.map((col) => (
                      <th
                        key={col}
                        className="px-3 py-2 text-left font-medium text-text-secondary"
                      >
                        {col}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-border">
                  {previewRows.map((row, i) => (
                    <tr key={i}>
                      {columns.map((col) => (
                        <td
                          key={col}
                          className="px-3 py-2 text-text-primary truncate max-w-[200px]"
                        >
                          {row[col] ?? ''}
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {uploadError && (
          <p className="text-sm text-error">{uploadError}</p>
        )}

        {/* Actions */}
        <div className="flex items-center justify-end gap-2 pt-4 border-t border-border">
          <Button variant="secondary" onClick={handleClose} disabled={uploading}>
            취소
          </Button>
          <Button
            onClick={handleUpload}
            loading={uploading}
            disabled={rows.length === 0 || errors.length > 0}
          >
            업로드 ({rows.length}건)
          </Button>
        </div>
      </div>
    </Modal>
  );
}
