'use client';

import React, { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useSkills } from '@/lib/hooks/useSkills';
import { useSentences } from '@/lib/hooks/useSentences';
import { useExpressions } from '@/lib/hooks/useExpressions';
import type { Skill, Sentence, Expression, Type } from '@/types/database';
import Modal from '@/components/core/Modal';
import Input from '@/components/core/Input';
import Select from '@/components/core/Select';
import Button from '@/components/core/Button';

type FormMode = 'skill' | 'sentence' | 'expression';

interface ContentFormModalProps {
  isOpen: boolean;
  onClose: () => void;
  mode: FormMode;
  editData?: Skill | Sentence | Expression | null;
  parentId: string;
  onSaved: () => void;
}

interface TypeOptions {
  tense: { value: string; label: string }[];
  purpose: { value: string; label: string }[];
  tone: { value: string; label: string }[];
  place: { value: string; label: string }[];
}

const LANGUAGE_OPTIONS = [
  { value: 'en', label: 'English (en)' },
  { value: 'es', label: 'Espa\u00f1ol (es)' },
  { value: 'zh', label: '\u4e2d\u6587 (zh)' },
  { value: 'ja', label: '\u65e5\u672c\u8a9e (ja)' },
];

const MODE_TITLES: Record<FormMode, { create: string; edit: string }> = {
  skill: { create: '\uc2a4\ud0ac \ucd94\uac00', edit: '\uc2a4\ud0ac \uc218\uc815' },
  sentence: { create: '\ubb38\uc7a5 \ucd94\uac00', edit: '\ubb38\uc7a5 \uc218\uc815' },
  expression: { create: '\ud45c\ud604 \ucd94\uac00', edit: '\ud45c\ud604 \uc218\uc815' },
};

export default function ContentFormModal({
  isOpen,
  onClose,
  mode,
  editData,
  parentId,
  onSaved,
}: ContentFormModalProps) {
  const isEditing = !!editData;
  const title = isEditing ? MODE_TITLES[mode].edit : MODE_TITLES[mode].create;

  // Skill form state
  const [name, setName] = useState('');
  const [summary, setSummary] = useState('');
  const [sortOrder, setSortOrder] = useState(0);
  const [tenseTypeId, setTenseTypeId] = useState('');
  const [purposeTypeId, setPurposeTypeId] = useState('');
  const [toneTypeId, setToneTypeId] = useState('');
  const [placeTypeId, setPlaceTypeId] = useState('');

  // Sentence form state
  const [sentenceSummary, setSentenceSummary] = useState('');
  const [summaryEn, setSummaryEn] = useState('');

  // Expression form state
  const [languageCode, setLanguageCode] = useState('en');
  const [expressionText, setExpressionText] = useState('');
  const [hint, setHint] = useState('');

  // Type options for skill mode
  const [typeOptions, setTypeOptions] = useState<TypeOptions>({
    tense: [],
    purpose: [],
    tone: [],
    place: [],
  });

  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Hooks for CRUD - use parentId to scope correctly
  const { createSkill, updateSkill, deleteSkill } = useSkills(
    mode === 'skill' ? parentId : undefined
  );
  const { createSentence, updateSentence, deleteSentence } = useSentences(
    mode === 'sentence' ? parentId : undefined
  );
  const { createExpression, updateExpression, deleteExpression } = useExpressions(
    mode === 'expression' ? parentId : undefined
  );

  // Fetch type options for skill mode
  useEffect(() => {
    if (mode !== 'skill' || !isOpen) return;

    const fetchTypeOptions = async () => {
      const supabase = createClient();
      const typeCodes = ['TENSE_TYPE', 'PURPOSE_TYPE', 'TONE_TYPE', 'PLACE_TYPE'];

      // Fetch root types
      const { data: rawRootTypes } = await supabase
        .from('types')
        .select('*')
        .is('parent_id', null)
        .in('type_code', typeCodes);

      const rootTypes = (rawRootTypes ?? []) as Type[];
      if (rootTypes.length === 0) return;

      const rootIds = rootTypes.map((t) => t.id);

      // Fetch children of these root types
      const { data: rawChildTypes } = await supabase
        .from('types')
        .select('*')
        .in('parent_id', rootIds)
        .eq('is_active', true)
        .order('sort_order', { ascending: true });

      const childTypes = (rawChildTypes ?? []) as Type[];

      const mapByParent = (parentCode: string) => {
        const parent = rootTypes.find((t) => t.type_code === parentCode);
        if (!parent) return [];
        return childTypes
          .filter((c) => c.parent_id === parent.id)
          .map((c) => ({ value: c.id, label: c.type_name }));
      };

      setTypeOptions({
        tense: mapByParent('TENSE_TYPE'),
        purpose: mapByParent('PURPOSE_TYPE'),
        tone: mapByParent('TONE_TYPE'),
        place: mapByParent('PLACE_TYPE'),
      });
    };

    fetchTypeOptions();
  }, [mode, isOpen]);

  // Populate form when editing
  useEffect(() => {
    if (!isOpen) return;

    if (mode === 'skill' && editData) {
      const skill = editData as Skill;
      setName(skill.name);
      setSummary(skill.summary ?? '');
      setSortOrder(skill.sort_order);
      setTenseTypeId(skill.tense_type_id ?? '');
      setPurposeTypeId(skill.purpose_type_id ?? '');
      setToneTypeId(skill.tone_type_id ?? '');
      setPlaceTypeId(skill.place_type_id ?? '');
    } else if (mode === 'sentence' && editData) {
      const sentence = editData as Sentence;
      setSentenceSummary(sentence.summary ?? '');
      setSummaryEn(sentence.summary_en ?? '');
    } else if (mode === 'expression' && editData) {
      const expression = editData as Expression;
      setLanguageCode(expression.language_code);
      setExpressionText(expression.expression_text ?? '');
      setHint(expression.hint ?? '');
    } else {
      // Reset all fields for create mode
      setName('');
      setSummary('');
      setSortOrder(0);
      setTenseTypeId('');
      setPurposeTypeId('');
      setToneTypeId('');
      setPlaceTypeId('');
      setSentenceSummary('');
      setSummaryEn('');
      setLanguageCode('en');
      setExpressionText('');
      setHint('');
    }
    setError(null);
  }, [isOpen, mode, editData]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitting(true);
    setError(null);

    try {
      if (mode === 'skill') {
        if (!name.trim()) {
          setError('스킬명은 필수입니다');
          setSubmitting(false);
          return;
        }
        const data = {
          level_id: parentId,
          name: name.trim(),
          summary: summary.trim() || null,
          sort_order: sortOrder,
          tense_type_id: tenseTypeId || null,
          purpose_type_id: purposeTypeId || null,
          tone_type_id: toneTypeId || null,
          place_type_id: placeTypeId || null,
        };
        if (isEditing) {
          await updateSkill(editData!.id, data);
        } else {
          await createSkill(data);
        }
      } else if (mode === 'sentence') {
        const data = {
          skill_id: parentId,
          summary: sentenceSummary.trim() || null,
          summary_en: summaryEn.trim() || null,
        };
        if (isEditing) {
          await updateSentence(editData!.id, data);
        } else {
          await createSentence(data);
        }
      } else if (mode === 'expression') {
        if (!expressionText.trim()) {
          setError('표현 텍스트는 필수입니다');
          setSubmitting(false);
          return;
        }
        const data = {
          sentence_id: parentId,
          language_code: languageCode,
          expression_text: expressionText.trim() || null,
          hint: hint.trim() || null,
        };
        if (isEditing) {
          await updateExpression(editData!.id, data);
        } else {
          await createExpression(data);
        }
      }

      onSaved();
      onClose();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : '저장에 실패했습니다';
      setError(message);
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async () => {
    if (!editData || !confirm('정말 삭제하시겠습니까?')) return;

    setSubmitting(true);
    setError(null);

    try {
      if (mode === 'skill') {
        await deleteSkill(editData.id);
      } else if (mode === 'sentence') {
        await deleteSentence(editData.id);
      } else if (mode === 'expression') {
        await deleteExpression(editData.id);
      }

      onSaved();
      onClose();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : '삭제에 실패했습니다';
      setError(message);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} title={title} size="lg">
      <form onSubmit={handleSubmit} className="space-y-4">
        {mode === 'skill' && (
          <>
            <Input
              label="스킬명 *"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="스킬명을 입력하세요"
              required
            />
            <Input
              label="요약"
              value={summary}
              onChange={(e) => setSummary(e.target.value)}
              placeholder="요약을 입력하세요"
            />
            <Input
              label="정렬순서"
              type="number"
              value={sortOrder}
              onChange={(e) => setSortOrder(Number(e.target.value))}
            />
            <div className="grid grid-cols-2 gap-4">
              <Select
                label="시제 유형"
                options={typeOptions.tense}
                value={tenseTypeId}
                onChange={(e) => setTenseTypeId(e.target.value)}
                placeholder="선택하세요"
              />
              <Select
                label="목적 유형"
                options={typeOptions.purpose}
                value={purposeTypeId}
                onChange={(e) => setPurposeTypeId(e.target.value)}
                placeholder="선택하세요"
              />
              <Select
                label="어조 유형"
                options={typeOptions.tone}
                value={toneTypeId}
                onChange={(e) => setToneTypeId(e.target.value)}
                placeholder="선택하세요"
              />
              <Select
                label="장소 유형"
                options={typeOptions.place}
                value={placeTypeId}
                onChange={(e) => setPlaceTypeId(e.target.value)}
                placeholder="선택하세요"
              />
            </div>
          </>
        )}

        {mode === 'sentence' && (
          <>
            <Input
              label="문장개요 (국문)"
              value={sentenceSummary}
              onChange={(e) => setSentenceSummary(e.target.value)}
              placeholder="문장개요를 입력하세요"
            />
            <Input
              label="문장개요 (영문)"
              value={summaryEn}
              onChange={(e) => setSummaryEn(e.target.value)}
              placeholder="Enter sentence summary"
            />
          </>
        )}

        {mode === 'expression' && (
          <>
            <Select
              label="언어코드 *"
              options={LANGUAGE_OPTIONS}
              value={languageCode}
              onChange={(e) => setLanguageCode(e.target.value)}
            />
            <Input
              label="표현 텍스트 *"
              value={expressionText}
              onChange={(e) => setExpressionText(e.target.value)}
              placeholder="표현 텍스트를 입력하세요"
              required
            />
            <Input
              label="힌트"
              value={hint}
              onChange={(e) => setHint(e.target.value)}
              placeholder="힌트를 입력하세요"
            />
          </>
        )}

        {error && (
          <p className="text-sm text-error">{error}</p>
        )}

        <div className="flex items-center justify-between pt-4 border-t border-border">
          <div>
            {isEditing && (
              <Button
                variant="danger"
                size="sm"
                onClick={handleDelete}
                disabled={submitting}
              >
                삭제
              </Button>
            )}
          </div>
          <div className="flex items-center gap-2">
            <Button variant="secondary" onClick={onClose} disabled={submitting}>
              취소
            </Button>
            <Button type="submit" loading={submitting}>
              {isEditing ? '수정' : '추가'}
            </Button>
          </div>
        </div>
      </form>
    </Modal>
  );
}
