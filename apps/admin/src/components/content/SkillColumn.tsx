'use client';

import React from 'react';
import { Pencil } from 'lucide-react';
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
      <ColumnPanel title="스킬">
        <div className="px-4 py-8 text-center text-sm text-text-secondary">
          레벨을 선택해주세요
        </div>
      </ColumnPanel>
    );
  }

  return (
    <ColumnPanel
      title="스킬"
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
              <div
                className={[
                  'w-full flex items-center px-4 py-3 border-b border-border transition-colors',
                  selectedSkillId === skill.id
                    ? 'bg-primary-50 border-l-2 border-l-primary-600'
                    : 'hover:bg-neutral-50',
                ].join(' ')}
              >
                <button
                  type="button"
                  onClick={() => onSelectSkill(skill.id)}
                  className="flex-1 min-w-0 text-left"
                >
                  <div className="text-sm font-medium text-text-primary truncate">
                    {skill.skill_name}
                  </div>
                  {skill.skill_summary && (
                    <div className="text-xs text-text-secondary mt-0.5 truncate">
                      {skill.skill_summary}
                    </div>
                  )}
                </button>
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    onOpenForm(skill);
                  }}
                  className="ml-2 p-1 rounded hover:bg-neutral-200 text-text-secondary hover:text-text-primary transition-colors shrink-0"
                  title="스킬 수정"
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
