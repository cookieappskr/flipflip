'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Level, LevelUpdate } from '@/types/database';

export function useLevels() {
  const [levels, setLevels] = useState<Level[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchLevels = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const { data, error: fetchError } = await supabase
        .from('levels')
        .select('*')
        .order('level_number', { ascending: true });

      if (fetchError) throw fetchError;
      setLevels(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch levels';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchLevels();
  }, [fetchLevels]);

  const updateLevel = useCallback(async (id: string, data: LevelUpdate) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('levels')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchLevels();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update level';
      setError(message);
      throw err;
    }
  }, [fetchLevels]);

  return {
    levels,
    loading,
    error,
    updateLevel,
    refetch: fetchLevels,
  };
}
