'use client';

import React, { useState } from 'react';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';
import { useSkills } from '@/lib/hooks/useSkills';
import type { Skill } from '@/types/database';

interface LevelSkillListProps {
  levelId: string | null;
}

interface ModalState {
  isOpen: boolean;
  skill: Skill | null;
  name: string;
  summary: string;
  sortOrder: number;
}

export default function LevelSkillList({ levelId }: LevelSkillListProps) {
  const { skills, loading, error, updateSkill, deleteSkill } = useSkills(
    levelId ?? undefined
  );

  const [modal, setModal] = useState<ModalState>({
    isOpen: false,
    skill: null,
    name: '',
    summary: '',
    sortOrder: 0,
  });
  const [modalSaving, setModalSaving] = useState(false);

  const openModal = (skill: Skill) => {
    setModal({
      isOpen: true,
      skill,
      name: skill.name,
      summary: skill.summary ?? '',
      sortOrder: skill.sort_order,
    });
  };

  const closeModal = () => {
    setModal({
      isOpen: false,
      skill: null,
      name: '',
      summary: '',
      sortOrder: 0,
    });
  };

  const handleSave = async () => {
    if (!modal.skill) return;
    setModalSaving(true);
    try {
      await updateSkill(modal.skill.id, {
        name: modal.name,
        summary: modal.summary || null,
        sort_order: modal.sortOrder,
      });
      closeModal();
    } finally {
      setModalSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!modal.skill) return;
    if (!window.confirm('Are you sure you want to delete this skill?')) return;
    setModalSaving(true);
    try {
      await deleteSkill(modal.skill.id);
      closeModal();
    } finally {
      setModalSaving(false);
    }
  };

  if (!levelId) {
    return (
      <div className="flex items-center justify-center h-32 text-text-secondary text-sm">
        Select a level to view skills.
      </div>
    );
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center h-32 text-text-secondary text-sm">
        Loading skills...
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-32 text-error text-sm">
        {error}
      </div>
    );
  }

  return (
    <div className="p-4">
      <h3 className="text-sm font-semibold text-text-primary mb-3">
        Skills ({skills.length})
      </h3>

      {skills.length === 0 ? (
        <div className="text-sm text-text-secondary">
          No skills for this level.
        </div>
      ) : (
        <div className="space-y-1">
          {skills.map((skill) => (
            <button
              key={skill.id}
              type="button"
              onClick={() => openModal(skill)}
              className="w-full text-left px-3 py-2 rounded-lg border border-border hover:bg-surface-secondary/50 transition-colors flex items-center gap-3"
            >
              <span className="text-xs text-text-secondary w-6 shrink-0 text-right">
                {skill.sort_order}
              </span>
              <span className="text-sm text-text-primary truncate">
                {skill.name}
              </span>
              {skill.summary && (
                <span className="text-xs text-text-secondary truncate ml-auto">
                  {skill.summary}
                </span>
              )}
            </button>
          ))}
        </div>
      )}

      {/* Inline Edit Modal */}
      {modal.isOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div
            className="fixed inset-0 bg-black/50"
            onClick={closeModal}
          />
          <div className="relative w-full max-w-md rounded-xl bg-surface shadow-xl">
            <div className="flex items-center justify-between border-b border-border px-6 py-4">
              <h2 className="text-lg font-semibold text-text-primary">
                Edit Skill
              </h2>
              <button
                type="button"
                onClick={closeModal}
                className="rounded-lg p-1 text-text-secondary hover:bg-neutral-100 hover:text-text-primary transition-colors"
              >
                <svg
                  className="h-5 w-5"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  strokeWidth={2}
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
            <div className="px-6 py-4 space-y-4">
              <Input
                label="Name"
                value={modal.name}
                onChange={(e) =>
                  setModal((prev) => ({ ...prev, name: e.target.value }))
                }
              />
              <Input
                label="Summary"
                value={modal.summary}
                onChange={(e) =>
                  setModal((prev) => ({ ...prev, summary: e.target.value }))
                }
              />
              <Input
                label="Sort Order"
                type="number"
                value={modal.sortOrder}
                onChange={(e) =>
                  setModal((prev) => ({
                    ...prev,
                    sortOrder: parseInt(e.target.value, 10) || 0,
                  }))
                }
              />
              <div className="flex items-center gap-2 pt-2">
                <Button onClick={handleSave} loading={modalSaving}>
                  Save
                </Button>
                <Button
                  variant="danger"
                  onClick={handleDelete}
                  loading={modalSaving}
                >
                  Delete
                </Button>
                <Button variant="secondary" onClick={closeModal}>
                  Cancel
                </Button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
