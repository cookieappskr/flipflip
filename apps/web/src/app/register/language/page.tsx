'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
import type { Type } from '@/types/database';

export default function LanguagePage() {
  const router = useRouter();
  const supabase = createClient();
  const [motherTongueTypes, setMotherTongueTypes] = useState<Type[]>([]);
  const [learningLangTypes, setLearningLangTypes] = useState<Type[]>([]);
  const [selectedMotherTongue, setSelectedMotherTongue] = useState('');
  const [selectedLearningLang, setSelectedLearningLang] = useState('');

  useEffect(() => {
    const fetchTypes = async () => {
      const { data: parents } = await supabase
        .from('types')
        .select('id, type_code')
        .in('type_code', ['MOTHER_TONGUE_TYPE', 'LEARNING_LANG_TYPE'])
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
    };

    fetchTypes();
  }, []);

  const canProceed = selectedMotherTongue && selectedLearningLang;

  return (
    <WizardLayout step={3} totalSteps={4} title="언어 선택" subtitle="모국어와 학습할 언어를 선택해주세요.">
      <div className="space-y-6">
        {/* Mother tongue */}
        <div>
          <label className="block text-sm font-medium text-text-primary mb-2">모국어</label>
          <div className="grid grid-cols-2 gap-2">
            {motherTongueTypes.map((type) => (
              <button
                key={type.id}
                onClick={() => setSelectedMotherTongue(type.value || type.type_code)}
                className={[
                  'p-3 rounded-xl border-2 text-center text-sm font-medium transition-all',
                  (type.value || type.type_code) === selectedMotherTongue
                    ? 'border-primary-600 bg-primary-50 text-primary-700'
                    : 'border-border bg-surface text-text-primary hover:border-primary-300',
                ].join(' ')}
              >
                {type.type_name}
              </button>
            ))}
          </div>
        </div>

        {/* Learning language */}
        <div>
          <label className="block text-sm font-medium text-text-primary mb-2">학습할 언어</label>
          <div className="grid grid-cols-2 gap-2">
            {learningLangTypes.map((type) => (
              <button
                key={type.id}
                onClick={() => setSelectedLearningLang(type.value || type.type_code)}
                className={[
                  'p-3 rounded-xl border-2 text-center text-sm font-medium transition-all',
                  (type.value || type.type_code) === selectedLearningLang
                    ? 'border-primary-600 bg-primary-50 text-primary-700'
                    : 'border-border bg-surface text-text-primary hover:border-primary-300',
                ].join(' ')}
              >
                {type.type_name}
              </button>
            ))}
          </div>
        </div>

        <Button
          className="w-full"
          size="lg"
          disabled={!canProceed}
          onClick={() => {
            sessionStorage.setItem('reg_mother_tongue', selectedMotherTongue);
            sessionStorage.setItem('reg_learning_language', selectedLearningLang);
            router.push('/register/referrer');
          }}
        >
          다음
        </Button>
      </div>
    </WizardLayout>
  );
}
