'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import WizardLayout from '@/components/register/WizardLayout';
import Button from '@/components/core/Button';
interface TermsAgreement {
  terms_id: string;
  type_name: string;
  summary: string | null;
  is_required: boolean;
  agreed: boolean;
}

export default function TermsPage() {
  const router = useRouter();
  const [termsList, setTermsList] = useState<TermsAgreement[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchTerms = async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from('terms')
        .select('id, terms_type_id, summary, is_required, is_active')
        .eq('is_active', true)
        .eq('country_code', 'KR');

      if (data) {
        // Fetch type names
        const typeIds = data.map((t: any) => t.terms_type_id);
        const { data: types } = await supabase
          .from('types')
          .select('id, type_name')
          .in('id', typeIds);

        const typeMap = new Map(types?.map((t) => [t.id, t.type_name]) || []);

        setTermsList(
          data.map((t: any) => ({
            terms_id: t.id,
            type_name: typeMap.get(t.terms_type_id) || '',
            summary: t.summary,
            is_required: t.is_required,
            agreed: false,
          }))
        );
      }
      setLoading(false);
    };

    fetchTerms();
  }, []);

  const allRequiredAgreed = termsList
    .filter((t) => t.is_required)
    .every((t) => t.agreed);

  const toggleAll = (checked: boolean) => {
    setTermsList((prev) =>
      prev.map((t) => ({ ...t, agreed: checked }))
    );
  };

  const toggleOne = (idx: number) => {
    setTermsList((prev) =>
      prev.map((t, i) => (i === idx ? { ...t, agreed: !t.agreed } : t))
    );
  };

  const allChecked = termsList.every((t) => t.agreed);

  return (
    <WizardLayout step={1} totalSteps={4} title="약관 동의" subtitle="서비스 이용을 위해 약관에 동의해주세요.">
      {loading ? (
        <div className="text-center py-8 text-text-secondary">로딩 중...</div>
      ) : (
        <>
          {/* Select all */}
          <label className="flex items-center gap-3 p-3 rounded-lg bg-surface border border-border mb-3 cursor-pointer">
            <input
              type="checkbox"
              checked={allChecked}
              onChange={(e) => toggleAll(e.target.checked)}
              className="h-5 w-5 rounded accent-primary-600"
            />
            <span className="text-sm font-semibold text-text-primary">전체 동의</span>
          </label>

          <div className="space-y-2">
            {termsList.map((t, idx) => (
              <label
                key={t.terms_id}
                className="flex items-center gap-3 p-3 rounded-lg bg-surface border border-border cursor-pointer"
              >
                <input
                  type="checkbox"
                  checked={t.agreed}
                  onChange={() => toggleOne(idx)}
                  className="h-5 w-5 rounded accent-primary-600"
                />
                <div className="flex-1">
                  <span className="text-sm text-text-primary">
                    {t.type_name}
                    {t.is_required && (
                      <span className="text-error ml-1">(필수)</span>
                    )}
                    {!t.is_required && (
                      <span className="text-text-secondary ml-1">(선택)</span>
                    )}
                  </span>
                </div>
              </label>
            ))}
          </div>

          {termsList.length === 0 && (
            <p className="text-sm text-text-secondary text-center py-4">
              등록된 약관이 없습니다. 다음 단계로 진행하세요.
            </p>
          )}

          <Button
            className="w-full mt-6"
            size="lg"
            disabled={termsList.length > 0 && !allRequiredAgreed}
            onClick={() => router.push('/register/profile-setup')}
          >
            다음
          </Button>
        </>
      )}
    </WizardLayout>
  );
}
