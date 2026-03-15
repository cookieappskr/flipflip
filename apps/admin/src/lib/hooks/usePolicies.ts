'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { PolicySetting } from '@/types/database';

export function usePolicies() {
  const [policies, setPolicies] = useState<PolicySetting[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchPolicies = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const { data, error: fetchError } = await supabase
        .from('policy_settings')
        .select('*');

      if (fetchError) throw fetchError;
      setPolicies(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch policies';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchPolicies();
  }, [fetchPolicies]);

  const updatePolicy = useCallback(async (id: string, value: string) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('policy_settings')
        .update({ value })
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchPolicies();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update policy';
      setError(message);
      throw err;
    }
  }, [fetchPolicies]);

  return {
    policies,
    loading,
    error,
    updatePolicy,
    refetch: fetchPolicies,
  };
}
