'use client';

import { useEffect, useState, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { User as AuthUser } from '@supabase/supabase-js';
import type { UserProfile } from '@/types/database';

interface AuthState {
  user: AuthUser | null;
  profile: UserProfile | null;
  loading: boolean;
}

export function useAuth() {
  const [state, setState] = useState<AuthState>({
    user: null,
    profile: null,
    loading: true,
  });

  const supabase = createClient();

  useEffect(() => {
    const getUser = async () => {
      const { data: { user } } = await supabase.auth.getUser();

      if (user) {
        const { data: profile } = await supabase
          .from('user_profiles')
          .select('*')
          .eq('user_id', user.id)
          .single();

        setState({ user, profile, loading: false });
      } else {
        setState({ user: null, profile: null, loading: false });
      }
    };

    getUser();

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (_event, session) => {
        if (session?.user) {
          const { data: profile } = await supabase
            .from('user_profiles')
            .select('*')
            .eq('user_id', session.user.id)
            .single();

          setState({ user: session.user, profile, loading: false });
        } else {
          setState({ user: null, profile: null, loading: false });
        }
      }
    );

    return () => subscription.unsubscribe();
  }, []);

  const signOut = useCallback(async () => {
    // Sync pending local data to server before signing out
    try {
      const { isLocalDbAvailable } = await import('@/lib/db/dbAvailability');
      if (await isLocalDbAvailable()) {
        const { processSyncQueue } = await import('@/lib/db/syncService');
        await processSyncQueue();
      }
    } catch {
      // Non-critical: proceed with sign out even if sync fails
    }
    await supabase.auth.signOut();
    window.location.href = '/login';
  }, []);

  const refreshProfile = useCallback(async () => {
    if (!state.user) return;
    const { data: profile } = await supabase
      .from('user_profiles')
      .select('*')
      .eq('user_id', state.user.id)
      .single();
    setState((prev) => ({ ...prev, profile }));
  }, [state.user]);

  return {
    ...state,
    signOut,
    refreshProfile,
  };
}
