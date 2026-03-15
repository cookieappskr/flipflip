'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Terms, TermsInsert } from '@/types/database';

interface UseTermsFilters {
  countryCode?: string;
  termsTypeId?: string;
}

export function useTerms(filters?: UseTermsFilters) {
  const [terms, setTerms] = useState<Terms[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchTerms = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      let query = supabase
        .from('terms')
        .select('*')
        .order('country_code', { ascending: true })
        .order('terms_type_id', { ascending: true })
        .order('version', { ascending: false });

      if (filters?.countryCode) {
        query = query.eq('country_code', filters.countryCode);
      }

      if (filters?.termsTypeId) {
        query = query.eq('terms_type_id', filters.termsTypeId);
      }

      const { data, error: fetchError } = await query;

      if (fetchError) throw fetchError;
      setTerms(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch terms';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [filters?.countryCode, filters?.termsTypeId]);

  useEffect(() => {
    fetchTerms();
  }, [fetchTerms]);

  const createTerms = useCallback(async (data: TermsInsert, copyFromId?: string) => {
    setError(null);
    try {
      const supabase = createClient();
      let insertData = { ...data };

      // If copyFromId is provided, fetch the previous version's content
      if (copyFromId) {
        const { data: source, error: sourceError } = await supabase
          .from('terms')
          .select('content')
          .eq('id', copyFromId)
          .single();

        if (sourceError) throw sourceError;

        if (source?.content && !insertData.content) {
          insertData = { ...insertData, content: source.content };
        }
      }

      const { error: insertError } = await supabase
        .from('terms')
        .insert(insertData);

      if (insertError) throw insertError;
      await fetchTerms();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create terms';
      setError(message);
      throw err;
    }
  }, [fetchTerms]);

  const updateTerms = useCallback(async (id: string, data: Partial<TermsInsert>) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('terms')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchTerms();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update terms';
      setError(message);
      throw err;
    }
  }, [fetchTerms]);

  return {
    terms,
    loading,
    error,
    createTerms,
    updateTerms,
    refetch: fetchTerms,
  };
}
