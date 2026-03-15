'use client';

import React from 'react';
import { Pencil } from 'lucide-react';
import { useSentences } from '@/lib/hooks/useSentences';
import type { Sentence } from '@/types/database';
import ColumnPanel from './ColumnPanel';

interface SentenceColumnProps {
  skillId: string | undefined;
  selectedSentenceId: string | undefined;
  onSelectSentence: (id: string) => void;
  onOpenForm: (sentence?: Sentence) => void;
}

export default function SentenceColumn({
  skillId,
  selectedSentenceId,
  onSelectSentence,
  onOpenForm,
}: SentenceColumnProps) {
  const { sentences, loading } = useSentences(skillId);

  if (!skillId) {
    return (
      <ColumnPanel title="문장">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          스킬을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="문장"
      count={sentences.length}
      onAdd={() => onOpenForm()}
      loading={loading}
    >
      {sentences.length === 0 && !loading ? (
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          문장이 없습니다
        </div>
      ) : (
        <ul>
          {sentences.map((sentence) => (
            <li key={sentence.id}>
              <div
                className={[
                  'w-full flex items-center px-4 py-3 border-b border-border transition-colors',
                  selectedSentenceId === sentence.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <button
                  type="button"
                  onClick={() => onSelectSentence(sentence.id)}
                  className="flex-1 min-w-0 text-left"
                >
                  <div className="text-sm text-text-primary truncate">
                    {sentence.meaning || '-'}
                  </div>
                </button>
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    onOpenForm(sentence);
                  }}
                  className="ml-2 p-1 rounded hover:bg-neutral-200 text-text-secondary hover:text-text-primary transition-colors shrink-0"
                  title="문장 수정"
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
