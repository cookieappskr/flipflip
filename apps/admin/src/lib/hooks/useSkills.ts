'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Skill, SkillInsert } from '@/types/database';

export function useSkills(levelId?: string) {
  const [skills, setSkills] = useState<Skill[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchSkills = useCallback(async () => {
    if (!levelId) return;

    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const { data, error: fetchError } = await supabase
        .from('skills')
        .select('*')
        .eq('level_id', levelId)
        .order('sort_order', { ascending: true });

      if (fetchError) throw fetchError;
      setSkills(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch skills';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [levelId]);

  useEffect(() => {
    fetchSkills();
  }, [fetchSkills]);

  const createSkill = useCallback(async (data: SkillInsert) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: insertError } = await supabase
        .from('skills')
        .insert(data);

      if (insertError) throw insertError;
      await fetchSkills();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create skill';
      setError(message);
      throw err;
    }
  }, [fetchSkills]);

  const updateSkill = useCallback(async (id: string, data: Partial<SkillInsert>) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('skills')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchSkills();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update skill';
      setError(message);
      throw err;
    }
  }, [fetchSkills]);

  const deleteSkill = useCallback(async (id: string) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: deleteError } = await supabase
        .from('skills')
        .delete()
        .eq('id', id);

      if (deleteError) throw deleteError;
      await fetchSkills();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to delete skill';
      setError(message);
      throw err;
    }
  }, [fetchSkills]);

  return {
    skills,
    loading,
    error,
    createSkill,
    updateSkill,
    deleteSkill,
    refetch: fetchSkills,
  };
}
