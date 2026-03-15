'use client';

import React from 'react';
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
      <ColumnPanel title="Sentences">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          스킬을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="Sentences"
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
              <button
                type="button"
                onClick={() => {
                  onSelectSentence(sentence.id);
                  onOpenForm(sentence);
                }}
                className={[
                  'w-full text-left px-4 py-3 border-b border-border transition-colors',
                  selectedSentenceId === sentence.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <div className="text-sm text-text-primary truncate">
                  {sentence.summary || '-'}
                </div>
                {sentence.summary_en && (
                  <div className="text-xs text-text-secondary mt-0.5 truncate">
                    {sentence.summary_en}
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
