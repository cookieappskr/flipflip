'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import Button from '@/components/core/Button';
import type { Type } from '@/types/database';

type DiagnosisStep = 'mother_tongue' | 'learning_language' | 'daily_goal';

export default function DiagnosisPage() {
  const router = useRouter();
  const supabase = createClient();
  const [step, setStep] = useState<DiagnosisStep>('mother_tongue');
  const [motherTongueTypes, setMotherTongueTypes] = useState<Type[]>([]);
  const [learningLangTypes, setLearningLangTypes] = useState<Type[]>([]);
  const [dailyGoalTypes, setDailyGoalTypes] = useState<Type[]>([]);
  const [selectedMotherTongue, setSelectedMotherTongue] = useState('');
  const [selectedLearningLang, setSelectedLearningLang] = useState('');
  const [selectedDailyGoal, setSelectedDailyGoal] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    const fetchTypes = async () => {
      // Get parent type IDs
      const { data: parents } = await supabase
        .from('types')
        .select('id, type_code')
        .in('type_code', ['MOTHER_TONGUE_TYPE', 'LEARNING_LANG_TYPE', 'DAILY_GOAL'])
        .is('parent_id', null);

      if (!parents) return;

      const parentMap = new Map(parents.map((p) => [p.type_code, p.id]));

      const parentIds = parents.map((p) => p.id);
      const { data: children } = await supabase
        .from('types')
        .select('*')
        .in('parent_id', parentIds)
        .eq('is_active', true)
        .order('display_order');

      if (!children) return;

      setMotherTongueTypes(children.filter((c) => c.parent_id === parentMap.get('MOTHER_TONGUE_TYPE')));
      setLearningLangTypes(children.filter((c) => c.parent_id === parentMap.get('LEARNING_LANG_TYPE')));
      setDailyGoalTypes(children.filter((c) => c.parent_id === parentMap.get('DAILY_GOAL')));
    };

    fetchTypes();
  }, []);

  const handleComplete = async () => {
    setSaving(true);
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;

    await supabase
      .from('user_profiles')
      .update({
        mother_tongue: selectedMotherTongue,
        learning_language: selectedLearningLang,
        daily_goal_type_id: selectedDailyGoal,
      })
      .eq('user_id', user.id);

    router.push('/level-test');
  };

  const titles: Record<DiagnosisStep, string> = {
    mother_tongue: '모국어를 선택해주세요',
    learning_language: '학습할 언어를 선택해주세요',
    daily_goal: '하루 학습 목표 시간을 선택해주세요',
  };

  const options: Record<DiagnosisStep, Type[]> = {
    mother_tongue: motherTongueTypes,
    learning_language: learningLangTypes,
    daily_goal: dailyGoalTypes,
  };

  const selected = step === 'mother_tongue' ? selectedMotherTongue : step === 'learning_language' ? selectedLearningLang : selectedDailyGoal;

  const handleSelect = (value: string) => {
    if (step === 'mother_tongue') {
      setSelectedMotherTongue(value);
    } else if (step === 'learning_language') {
      setSelectedLearningLang(value);
    } else {
      setSelectedDailyGoal(value);
    }
  };

  const handleNext = () => {
    if (step === 'mother_tongue') setStep('learning_language');
    else if (step === 'learning_language') setStep('daily_goal');
    else handleComplete();
  };

  return (
    <div className="min-h-screen bg-neutral-50 flex flex-col items-center px-4 py-12">
      <div className="w-full max-w-sm">
        <div className="mb-2 flex gap-1">
          {['mother_tongue', 'learning_language', 'daily_goal'].map((s, i) => (
            <div
              key={s}
              className={`h-1 flex-1 rounded-full ${
                i <= ['mother_tongue', 'learning_language', 'daily_goal'].indexOf(step)
                  ? 'bg-primary-600'
                  : 'bg-neutral-200'
              }`}
            />
          ))}
        </div>

        <h1 className="text-2xl font-bold text-text-primary mt-6 mb-6">
          {titles[step]}
        </h1>

        <div className="space-y-3">
          {options[step].map((type) => (
            <button
              key={type.id}
              onClick={() => handleSelect(step === 'daily_goal' ? type.id : type.value || type.type_code)}
              className={[
                'w-full p-4 rounded-xl border-2 text-left transition-all',
                (step === 'daily_goal' ? type.id : type.value || type.type_code) === selected
                  ? 'border-primary-600 bg-primary-50 text-primary-700'
                  : 'border-border bg-surface text-text-primary hover:border-primary-300',
              ].join(' ')}
            >
              <span className="font-medium">{type.type_name}</span>
              {type.description && (
                <span className="block text-sm text-text-secondary mt-1">{type.description}</span>
              )}
            </button>
          ))}
        </div>

        <Button
          className="w-full mt-6"
          size="lg"
          disabled={!selected}
          loading={saving}
          onClick={handleNext}
        >
          {step === 'daily_goal' ? '완료' : '다음'}
        </Button>
      </div>
    </div>
  );
}
