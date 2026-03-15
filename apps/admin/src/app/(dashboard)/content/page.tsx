'use client';

import React, { useState, useCallback } from 'react';
import type { Level, Skill, Sentence, Expression } from '@/types/database';
import { useSkills } from '@/lib/hooks/useSkills';
import { useSentences } from '@/lib/hooks/useSentences';
import { useExpressions } from '@/lib/hooks/useExpressions';
import { downloadCsv } from '@/lib/utils/csv';
import Button from '@/components/core/Button';
import LevelColumn from '@/components/content/LevelColumn';
import SkillColumn from '@/components/content/SkillColumn';
import SentenceColumn from '@/components/content/SentenceColumn';
import ExpressionColumn from '@/components/content/ExpressionColumn';
import ContentFormModal from '@/components/content/ContentFormModal';
import LevelEditModal from '@/components/content/LevelEditModal';
import CsvUploadModal from '@/components/content/CsvUploadModal';

type FormMode = 'skill' | 'sentence' | 'expression';
type CsvMode = 'skills' | 'sentences' | 'expressions';

interface FormModalState {
  isOpen: boolean;
  mode: FormMode;
  editData: Skill | Sentence | Expression | null;
  parentId: string;
}

interface CsvModalState {
  isOpen: boolean;
  mode: CsvMode;
  parentId: string;
}

interface LevelEditModalState {
  isOpen: boolean;
  level: Level | null;
}

export default function ContentPage() {
  // Selection state - cascade
  const [selectedLevelId, setSelectedLevelId] = useState<string | undefined>();
  const [selectedSkillId, setSelectedSkillId] = useState<string | undefined>();
  const [selectedSentenceId, setSelectedSentenceId] = useState<string | undefined>();

  // Modal state
  const [formModal, setFormModal] = useState<FormModalState>({
    isOpen: false,
    mode: 'skill',
    editData: null,
    parentId: '',
  });

  const [csvModal, setCsvModal] = useState<CsvModalState>({
    isOpen: false,
    mode: 'skills',
    parentId: '',
  });

  const [levelEditModal, setLevelEditModal] = useState<LevelEditModalState>({
    isOpen: false,
    level: null,
  });

  // Hooks for refetch and CSV download
  const { skills, refetch: refetchSkills } = useSkills(selectedLevelId);
  const { sentences, refetch: refetchSentences } = useSentences(selectedSkillId);
  const { expressions, refetch: refetchExpressions } = useExpressions(selectedSentenceId);

  // Cascade selection handlers
  const handleSelectLevel = useCallback((id: string) => {
    setSelectedLevelId(id);
    setSelectedSkillId(undefined);
    setSelectedSentenceId(undefined);
  }, []);

  const handleSelectSkill = useCallback((id: string) => {
    setSelectedSkillId(id);
    setSelectedSentenceId(undefined);
  }, []);

  const handleSelectSentence = useCallback((id: string) => {
    setSelectedSentenceId(id);
  }, []);

  // Level edit modal handlers
  const handleEditLevel = useCallback((level: Level) => {
    setLevelEditModal({ isOpen: true, level });
  }, []);

  const closeLevelEditModal = useCallback(() => {
    setLevelEditModal((prev) => ({ ...prev, isOpen: false }));
  }, []);

  // Form modal handlers
  const openSkillForm = useCallback(
    (skill?: Skill) => {
      if (!selectedLevelId) return;
      setFormModal({
        isOpen: true,
        mode: 'skill',
        editData: skill ?? null,
        parentId: selectedLevelId,
      });
    },
    [selectedLevelId]
  );

  const openSentenceForm = useCallback(
    (sentence?: Sentence) => {
      if (!selectedSkillId) return;
      setFormModal({
        isOpen: true,
        mode: 'sentence',
        editData: sentence ?? null,
        parentId: selectedSkillId,
      });
    },
    [selectedSkillId]
  );

  const openExpressionForm = useCallback(
    (expression?: Expression) => {
      if (!selectedSentenceId) return;
      setFormModal({
        isOpen: true,
        mode: 'expression',
        editData: expression ?? null,
        parentId: selectedSentenceId,
      });
    },
    [selectedSentenceId]
  );

  const closeFormModal = useCallback(() => {
    setFormModal((prev) => ({ ...prev, isOpen: false }));
  }, []);

  const handleFormSaved = useCallback(() => {
    if (formModal.mode === 'skill') refetchSkills();
    else if (formModal.mode === 'sentence') refetchSentences();
    else if (formModal.mode === 'expression') refetchExpressions();
  }, [formModal.mode, refetchSkills, refetchSentences, refetchExpressions]);

  // CSV modal handlers
  const openCsvModal = useCallback(
    (mode: CsvMode) => {
      let parentId = '';
      if (mode === 'skills' && selectedLevelId) parentId = selectedLevelId;
      else if (mode === 'sentences' && selectedSkillId) parentId = selectedSkillId;
      else if (mode === 'expressions' && selectedSentenceId) parentId = selectedSentenceId;

      if (!parentId) return;

      setCsvModal({ isOpen: true, mode, parentId });
    },
    [selectedLevelId, selectedSkillId, selectedSentenceId]
  );

  const closeCsvModal = useCallback(() => {
    setCsvModal((prev) => ({ ...prev, isOpen: false }));
  }, []);

  const handleCsvUploaded = useCallback(() => {
    if (csvModal.mode === 'skills') refetchSkills();
    else if (csvModal.mode === 'sentences') refetchSentences();
    else if (csvModal.mode === 'expressions') refetchExpressions();
  }, [csvModal.mode, refetchSkills, refetchSentences, refetchExpressions]);

  // CSV download
  const handleCsvDownload = useCallback(
    (mode: CsvMode) => {
      if (mode === 'skills' && skills.length > 0) {
        downloadCsv(
          skills.map(({ id, created_at, updated_at, ...rest }) => rest),
          `skills_level_${selectedLevelId}.csv`
        );
      } else if (mode === 'sentences' && sentences.length > 0) {
        downloadCsv(
          sentences.map(({ id, created_at, updated_at, ...rest }) => rest),
          `sentences_skill_${selectedSkillId}.csv`
        );
      } else if (mode === 'expressions' && expressions.length > 0) {
        downloadCsv(
          expressions.map(({ id, created_at, updated_at, ...rest }) => rest),
          `expressions_sentence_${selectedSentenceId}.csv`
        );
      }
    },
    [skills, sentences, expressions, selectedLevelId, selectedSkillId, selectedSentenceId]
  );

  return (
    <div className="flex flex-col h-full">
      {/* Header / Toolbar */}
      <div className="flex items-center justify-between px-6 py-4 border-b border-border">
        <h1 className="text-xl font-bold text-text-primary">콘텐츠관리</h1>
        <div className="flex items-center gap-2">
          {/* CSV Upload buttons */}
          <Button
            variant="secondary"
            size="sm"
            onClick={() => openCsvModal('skills')}
            disabled={!selectedLevelId}
          >
            스킬 CSV 업로드
          </Button>
          <Button
            variant="secondary"
            size="sm"
            onClick={() => openCsvModal('sentences')}
            disabled={!selectedSkillId}
          >
            문장 CSV 업로드
          </Button>
          <Button
            variant="secondary"
            size="sm"
            onClick={() => openCsvModal('expressions')}
            disabled={!selectedSentenceId}
          >
            표현 CSV 업로드
          </Button>

          {/* CSV Download buttons */}
          <div className="w-px h-6 bg-border mx-1" />
          <Button
            variant="ghost"
            size="sm"
            onClick={() => handleCsvDownload('skills')}
            disabled={skills.length === 0}
          >
            스킬 CSV 다운로드
          </Button>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => handleCsvDownload('sentences')}
            disabled={sentences.length === 0}
          >
            문장 CSV 다운로드
          </Button>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => handleCsvDownload('expressions')}
            disabled={expressions.length === 0}
          >
            표현 CSV 다운로드
          </Button>
        </div>
      </div>

      {/* 4-Column Cascade */}
      <div className="grid grid-cols-4 h-[calc(100vh-8rem)]">
        <LevelColumn
          selectedLevelId={selectedLevelId}
          onSelectLevel={handleSelectLevel}
          onEditLevel={handleEditLevel}
        />
        <SkillColumn
          levelId={selectedLevelId}
          selectedSkillId={selectedSkillId}
          onSelectSkill={handleSelectSkill}
          onOpenForm={openSkillForm}
        />
        <SentenceColumn
          skillId={selectedSkillId}
          selectedSentenceId={selectedSentenceId}
          onSelectSentence={handleSelectSentence}
          onOpenForm={openSentenceForm}
        />
        <ExpressionColumn
          sentenceId={selectedSentenceId}
          onOpenForm={openExpressionForm}
        />
      </div>

      {/* Level Edit Modal */}
      <LevelEditModal
        isOpen={levelEditModal.isOpen}
        onClose={closeLevelEditModal}
        level={levelEditModal.level}
        onSaved={() => {
          // Level list will auto-refetch via useLevels hook
        }}
      />

      {/* Form Modal */}
      <ContentFormModal
        isOpen={formModal.isOpen}
        onClose={closeFormModal}
        mode={formModal.mode}
        editData={formModal.editData}
        parentId={formModal.parentId}
        onSaved={handleFormSaved}
      />

      {/* CSV Upload Modal */}
      <CsvUploadModal
        isOpen={csvModal.isOpen}
        onClose={closeCsvModal}
        mode={csvModal.mode}
        parentId={csvModal.parentId}
        onUploaded={handleCsvUploaded}
      />
    </div>
  );
}
