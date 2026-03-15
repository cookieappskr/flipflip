'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Type, TypeInsert } from '@/types/database';

export function useTypes(parentId?: string | null) {
  const [types, setTypes] = useState<Type[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchTypes = useCallback(async () => {
    // parentId === undefined means "don't fetch" (no argument provided)
    // parentId === null means "fetch root types (parent_id IS NULL)"
    // parentId === string means "fetch children of that parent"
    if (parentId === undefined) return;

    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      let query = supabase
        .from('types')
        .select('*');

      if (parentId === null) {
        query = query.is('parent_id', null);
      } else {
        query = query.eq('parent_id', parentId);
      }

      // Try display_order first, fallback to no ordering if column doesn't exist
      const { data, error: fetchError } = await query.order('display_order', { ascending: true });

      if (fetchError) {
        // If display_order column doesn't exist, retry without ordering
        if (fetchError.message?.includes('display_order')) {
          let retryQuery = supabase.from('types').select('*');
          if (parentId === null) {
            retryQuery = retryQuery.is('parent_id', null);
          } else {
            retryQuery = retryQuery.eq('parent_id', parentId);
          }
          const { data: retryData, error: retryError } = await retryQuery;
          if (retryError) throw retryError;
          setTypes(retryData ?? []);
          return;
        }
        throw fetchError;
      }
      setTypes(data ?? []);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch types';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [parentId]);

  useEffect(() => {
    fetchTypes();
  }, [fetchTypes]);

  const createType = useCallback(async (data: TypeInsert) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: insertError } = await supabase
        .from('types')
        .insert(data);

      if (insertError) throw insertError;
      await fetchTypes();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to create type';
      setError(message);
      throw err;
    }
  }, [fetchTypes]);

  const updateType = useCallback(async (id: string, data: Partial<TypeInsert>) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: updateError } = await supabase
        .from('types')
        .update(data)
        .eq('id', id);

      if (updateError) throw updateError;
      await fetchTypes();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to update type';
      setError(message);
      throw err;
    }
  }, [fetchTypes]);

  const deleteType = useCallback(async (id: string) => {
    setError(null);
    try {
      const supabase = createClient();
      const { error: deleteError } = await supabase
        .from('types')
        .delete()
        .eq('id', id);

      if (deleteError) throw deleteError;
      await fetchTypes();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to delete type';
      setError(message);
      throw err;
    }
  }, [fetchTypes]);

  const checkDuplicate = useCallback(async (
    checkParentId: string | null,
    typeCode: string,
    excludeId?: string,
  ): Promise<boolean> => {
    try {
      const supabase = createClient();
      let query = supabase
        .from('types')
        .select('id', { count: 'exact', head: true })
        .eq('type_code', typeCode);

      if (checkParentId === null) {
        query = query.is('parent_id', null);
      } else {
        query = query.eq('parent_id', checkParentId);
      }

      if (excludeId) {
        query = query.neq('id', excludeId);
      }

      const { count } = await query;
      return (count ?? 0) > 0;
    } catch {
      return false;
    }
  }, []);

  return {
    types,
    loading,
    error,
    createType,
    updateType,
    deleteType,
    checkDuplicate,
    refetch: fetchTypes,
  };
}
