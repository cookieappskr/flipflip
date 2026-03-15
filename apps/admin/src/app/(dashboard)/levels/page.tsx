'use client';

import React, { useState, useEffect } from 'react';
import LevelList from '@/components/levels/LevelList';
import LevelDetail from '@/components/levels/LevelDetail';
import LevelSkillList from '@/components/levels/LevelSkillList';
import { useLevels } from '@/lib/hooks/useLevels';
import { useTypes } from '@/lib/hooks/useTypes';

export default function LevelsPage() {
  const { levels, loading, updateLevel } = useLevels();
  const [selectedLevelId, setSelectedLevelId] = useState<string | null>(null);

  // Fetch root types to find NATIVE_LEVEL_TYPE parent
  const { types: rootTypes } = useTypes(null);
  const nativeLevelTypeRoot = rootTypes.find(
    (t) => t.type_code === 'NATIVE_LEVEL_TYPE'
  );

  // Fetch children of NATIVE_LEVEL_TYPE root
  const { types: nativeLevelTypes } = useTypes(
    nativeLevelTypeRoot?.id ?? undefined
  );

  const selectedLevel =
    levels.find((l) => l.id === selectedLevelId) ?? null;

  // Auto-select first level when levels load
  useEffect(() => {
    if (levels.length > 0 && !selectedLevelId) {
      setSelectedLevelId(levels[0].id);
    }
  }, [levels, selectedLevelId]);

  return (
    <div>
      <h1 className="text-2xl font-bold text-text-primary mb-6">
        레벨관리
      </h1>

      <div className="flex gap-6 h-[calc(100vh-12rem)]">
        {/* Left 1/3 - Level List */}
        <div className="w-1/3 rounded-lg border border-border bg-surface overflow-hidden">
          <LevelList
            levels={levels}
            selectedLevelId={selectedLevelId}
            onSelectLevel={setSelectedLevelId}
            loading={loading}
          />
        </div>

        {/* Right 2/3 - Detail + Skills */}
        <div className="w-2/3 flex flex-col gap-4">
          {/* Top - Level Detail */}
          <div className="rounded-lg border border-border bg-surface flex-1 overflow-auto">
            <LevelDetail
              level={selectedLevel}
              onSave={updateLevel}
              nativeLevelTypes={nativeLevelTypes}
            />
          </div>

          {/* Bottom - Skills */}
          <div className="rounded-lg border border-border bg-surface flex-1 overflow-auto">
            <LevelSkillList levelId={selectedLevelId} />
          </div>
        </div>
      </div>
    </div>
  );
}
