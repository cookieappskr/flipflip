'use client';

import React from 'react';
import { Pencil } from 'lucide-react';
import { useLevels } from '@/lib/hooks/useLevels';
import type { Level } from '@/types/database';
import ColumnPanel from './ColumnPanel';

interface LevelColumnProps {
  selectedLevelId: string | undefined;
  onSelectLevel: (id: string) => void;
  onEditLevel: (level: Level) => void;
}

export default function LevelColumn({
  selectedLevelId,
  onSelectLevel,
  onEditLevel,
}: LevelColumnProps) {
  const { levels, loading } = useLevels();

  return (
    <ColumnPanel title="레벨" count={levels.length} loading={loading}>
      {levels.length === 0 && !loading ? (
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          레벨이 없습니다
        </div>
      ) : (
        <ul>
          {levels.map((level) => (
            <li key={level.id}>
              <div
                className={[
                  'w-full flex items-center px-4 py-3 border-b border-border transition-colors',
                  selectedLevelId === level.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <button
                  type="button"
                  onClick={() => onSelectLevel(level.id)}
                  className="flex items-center gap-2 flex-1 min-w-0 text-left"
                >
                  <span className="inline-flex items-center justify-center h-6 w-10 rounded bg-neutral-100 text-xs font-semibold text-neutral-700 shrink-0">
                    Lv{level.level_number}
                  </span>
                  <span className="text-sm text-text-primary truncate flex-1">
                    {level.level_summary || '-'}
                  </span>
                </button>
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    onEditLevel(level);
                  }}
                  className="ml-2 p-1 rounded hover:bg-neutral-200 text-text-secondary hover:text-text-primary transition-colors shrink-0"
                  title="레벨 수정"
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
