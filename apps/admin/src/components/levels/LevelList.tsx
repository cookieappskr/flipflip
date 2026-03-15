'use client';

import React from 'react';
import type { Level } from '@/types/database';

interface LevelListProps {
  levels: Level[];
  selectedLevelId: string | null;
  onSelectLevel: (id: string) => void;
  loading: boolean;
}

export default function LevelList({
  levels,
  selectedLevelId,
  onSelectLevel,
  loading,
}: LevelListProps) {
  if (loading) {
    return (
      <div className="flex items-center justify-center h-64 text-text-secondary text-sm">
        Loading levels...
      </div>
    );
  }

  if (levels.length === 0) {
    return (
      <div className="flex items-center justify-center h-64 text-text-secondary text-sm">
        No levels found.
      </div>
    );
  }

  return (
    <div className="overflow-y-auto h-full">
      {levels.map((level) => {
        const isSelected = level.id === selectedLevelId;
        const truncatedSummary = level.summary
          ? level.summary.length > 30
            ? level.summary.slice(0, 30) + '...'
            : level.summary
          : '-';

        return (
          <button
            key={level.id}
            type="button"
            onClick={() => onSelectLevel(level.id)}
            className={[
              'w-full text-left px-4 py-3 flex items-center gap-3 border-b border-border transition-colors',
              isSelected
                ? 'bg-primary-50 border-l-4 border-l-primary-500'
                : 'border-l-4 border-l-transparent hover:bg-surface-secondary/50',
            ].join(' ')}
          >
            <span className="text-sm font-semibold text-text-primary w-8 shrink-0">
              {level.level_number}
            </span>
            <span className="text-sm text-text-secondary truncate">
              {truncatedSummary}
            </span>
          </button>
        );
      })}
    </div>
  );
}
