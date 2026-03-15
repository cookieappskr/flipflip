'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Sentence, SentenceInsert } from '@/types/database';

export function useSentences(skillId?: string) {
  const [sentences, setSentences] = useState<Sentence[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchSentences = useCallback(async () => {
    if (!skillId) return;

    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const { data, error: fetchError } = await supabase
        .from('sentences')
        .select('*')
        .eq('skill_id', skillId);

      if (fetchError) throw fetchError;
      setSentences(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch sentences';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [skillId]);

  useEffect(() => {
    fetchSentences();
  }, [fetchSentences]);

  const createSentence = useCallback(async (data: SentenceInsert) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: insertError } = await supabase
        .from('sentences')
        .insert(data);

      if (insertError) throw insertError;
      await fetchSentences();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create sentence';
      setError(message);
      throw err;
    }
  }, [fetchSentences]);

  const updateSentence = useCallback(async (id: string, data: Partial<SentenceInsert>) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('sentences')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchSentences();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update sentence';
      setError(message);
      throw err;
    }
  }, [fetchSentences]);

  const deleteSentence = useCallback(async (id: string) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: deleteError } = await supabase
        .from('sentences')
        .delete()
        .eq('id', id);

      if (deleteError) throw deleteError;
      await fetchSentences();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to delete sentence';
      setError(message);
      throw err;
    }
  }, [fetchSentences]);

  return {
    sentences,
    loading,
    error,
    createSentence,
    updateSentence,
    deleteSentence,
    refetch: fetchSentences,
  };
}
