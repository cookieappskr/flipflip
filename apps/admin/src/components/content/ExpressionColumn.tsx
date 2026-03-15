'use client';

import React from 'react';
import { Pencil } from 'lucide-react';
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
      <ColumnPanel title="표현">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          문장을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="표현"
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
              <div className="w-full flex items-center px-4 py-3 border-b border-border hover:bg-neutral-50 transition-colors">
                <div className="flex-1 min-w-0">
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
                </div>
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    onOpenForm(expression);
                  }}
                  className="ml-2 p-1 rounded hover:bg-neutral-200 text-text-secondary hover:text-text-primary transition-colors shrink-0"
                  title="표현 수정"
                >
                  <Pencil className="h-4 w-4" />
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </ColumnPanel>
  );
}
