'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Expression, ExpressionInsert } from '@/types/database';

export function useExpressions(sentenceId?: string) {
  const [expressions, setExpressions] = useState<Expression[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchExpressions = useCallback(async () => {
    if (!sentenceId) return;

    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const { data, error: fetchError } = await supabase
        .from('expressions')
        .select('*')
        .eq('sentence_id', sentenceId);

      if (fetchError) throw fetchError;
      setExpressions(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch expressions';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [sentenceId]);

  useEffect(() => {
    fetchExpressions();
  }, [fetchExpressions]);

  const createExpression = useCallback(async (data: ExpressionInsert) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: insertError } = await supabase
        .from('expressions')
        .insert(data);

      if (insertError) throw insertError;
      await fetchExpressions();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create expression';
      setError(message);
      throw err;
    }
  }, [fetchExpressions]);

  const updateExpression = useCallback(async (id: string, data: Partial<ExpressionInsert>) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('expressions')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchExpressions();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update expression';
      setError(message);
      throw err;
    }
  }, [fetchExpressions]);

  const deleteExpression = useCallback(async (id: string) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: deleteError } = await supabase
        .from('expressions')
        .delete()
        .eq('id', id);

      if (deleteError) throw deleteError;
      await fetchExpressions();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to delete expression';
      setError(message);
      throw err;
    }
  }, [fetchExpressions]);

  return {
    expressions,
    loading,
    error,
    createExpression,
    updateExpression,
    deleteExpression,
    refetch: fetchExpressions,
  };
}
