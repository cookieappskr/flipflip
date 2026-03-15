'use client';

import React from 'react';
import { useLevels } from '@/lib/hooks/useLevels';
import ColumnPanel from './ColumnPanel';

interface LevelColumnProps {
  selectedLevelId: string | undefined;
  onSelectLevel: (id: string) => void;
}

export default function LevelColumn({
  selectedLevelId,
  onSelectLevel,
}: LevelColumnProps) {
  const { levels, loading } = useLevels();

  return (
    <ColumnPanel title="Levels" count={levels.length} loading={loading}>
      {levels.length === 0 && !loading ? (
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          레벨이 없습니다
        </div>
      ) : (
        <ul>
          {levels.map((level) => (
            <li key={level.id}>
              <button
                type="button"
                onClick={() => onSelectLevel(level.id)}
                className={[
                  'w-full text-left px-4 py-3 border-b border-border transition-colors',
                  selectedLevelId === level.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <div className="flex items-center gap-2">
                  <span className="inline-flex items-center justify-center h-6 w-8 rounded bg-neutral-100 text-xs font-semibold text-neutral-700">
                    {level.level_number}
                  </span>
                  <span className="text-sm text-text-primary truncate flex-1">
                    {level.summary || '-'}
                  </span>
                </div>
              </button>
            </li>
          ))}
        </ul>
      )}
    </ColumnPanel>
  );
}
