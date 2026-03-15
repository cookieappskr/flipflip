'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Member } from '@/types/database';

interface UseMembersParams {
  page: number;
  pageSize: number;
  search?: string;
  searchField?: 'nickname' | 'phone' | 'email';
}

export function useMembers({ page, pageSize, search, searchField }: UseMembersParams) {
  const [members, setMembers] = useState<Member[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchMembers = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const supabase = createClient();
      const from = page * pageSize;
      const to = from + pageSize - 1;

      let query = supabase
        .from('users')
        .select('*, user_profiles(*), subscriptions(*)', { count: 'exact' })
        .range(from, to);

      // Apply search filter on the related user_profiles table
      if (search && searchField) {
        query = query.ilike(`user_profiles.${searchField}`, `%${search}%`);
      }

      const { data, count, error: fetchError } = await query;

      if (fetchError) throw fetchError;

      // Map the joined data to the Member type
      const mapped: Member[] = (data ?? []).map((user: Record<string, unknown>) => {
        const profile = (Array.isArray(user.user_profiles)
          ? user.user_profiles[0]
          : user.user_profiles) as Record<string, unknown> | null;
        const subscription = (Array.isArray(user.subscriptions)
          ? user.subscriptions[0]
          : user.subscriptions) as Record<string, unknown> | null;

        return {
          id: user.id as string,
          auth_email: (user.auth_email as string) ?? null,
          role: user.role as string,
          is_active: user.is_active as boolean,
          created_at: user.created_at as string,
          nickname: (profile?.nickname as string) ?? null,
          email: (profile?.email as string) ?? null,
          phone: (profile?.phone as string) ?? null,
          subscription_status: (subscription?.status as string) ?? null,
        };
      });

      setMembers(mapped);
      setTotalCount(count ?? 0);
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to fetch members';
      setError(message);
    } finally {
      setLoading(false);
    }
  }, [page, pageSize, search, searchField]);

  useEffect(() => {
    fetchMembers();
  }, [fetchMembers]);

  return {
    members,
    totalCount,
    loading,
    error,
    refetch: fetchMembers,
  };
}
