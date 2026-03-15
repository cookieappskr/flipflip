'use client';

import React from 'react';
import { useSkills } from '@/lib/hooks/useSkills';
import type { Skill } from '@/types/database';
import ColumnPanel from './ColumnPanel';

interface SkillColumnProps {
  levelId: string | undefined;
  selectedSkillId: string | undefined;
  onSelectSkill: (id: string) => void;
  onOpenForm: (skill?: Skill) => void;
}

export default function SkillColumn({
  levelId,
  selectedSkillId,
  onSelectSkill,
  onOpenForm,
}: SkillColumnProps) {
  const { skills, loading } = useSkills(levelId);

  if (!levelId) {
    return (
      <ColumnPanel title="Skills">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          레벨을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="Skills"
      count={skills.length}
      onAdd={() => onOpenForm()}
      loading={loading}
    >
      {skills.length === 0 && !loading ? (
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          스킬이 없습니다
        </div>
      ) : (
        <ul>
          {skills.map((skill) => (
            <li key={skill.id}>
              <button
                type="button"
                onClick={() => {
                  onSelectSkill(skill.id);
                  onOpenForm(skill);
                }}
                className={[
                  'w-full text-left px-4 py-3 border-b border-border transition-colors',
                  selectedSkillId === skill.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <div className="text-sm font-medium text-text-primary truncate">
                  {skill.name}
                </div>
                {skill.summary && (
                  <div className="text-xs text-text-secondary mt-0.5 truncate">
                    {skill.summary}
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
