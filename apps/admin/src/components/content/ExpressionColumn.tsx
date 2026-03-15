'use client';

import React from 'react';
import { useExpressions } from '@/lib/hooks/useExpressions';
import type { Expression } from '@/types/database';
import Badge from '@/components/core/Badge';
import ColumnPanel from './ColumnPanel';

interface ExpressionColumnProps {
  sentenceId: string | undefined;
  onOpenForm: (expression?: Expression) => void;
}

export default function ExpressionColumn({
  sentenceId,
  onOpenForm,
}: ExpressionColumnProps) {
  const { expressions, loading } = useExpressions(sentenceId);

  if (!sentenceId) {
    return (
      <ColumnPanel title="Expressions">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          문장을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="Expressions"
      count={expressions.length}
      onAdd={() => onOpenForm()}
      loading={loading}
    >
      {expressions.length === 0 && !loading ? (
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          표현이 없습니다
        </div>
      ) : (
        <ul>
          {expressions.map((expression) => (
            <li key={expression.id}>
              <button
                type="button"
                onClick={() => onOpenForm(expression)}
                className="w-full text-left px-4 py-3 border-b border-border hover:bg-neutral-50 transition-colors"
              >
                <div className="flex items-center gap-2">
                  <Badge variant="info">{expression.language_code}</Badge>
                  <span className="text-sm text-text-primary truncate flex-1">
                    {expression.expression_text || '-'}
                  </span>
                </div>
                {expression.hint && (
                  <div className="text-xs text-text-secondary mt-1 truncate pl-10">
                    {expression.hint}
                  </div>
                )}
              </button>
            </li>
          ))}
        </ul>
      )}
    </ColumnPanel>
  );
}
