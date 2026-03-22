'use client';

import { createContext, useContext, useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { AdminUser } from '@/types/database';

interface AdminContextType {
  admin: AdminUser | null;
  loading: boolean;
  signOut: () => Promise<void>;
}

const AdminContext = createContext<AdminContextType>({
  admin: null,
  loading: true,
  signOut: async () => {},
});

export function useAdmin() {
  return useContext(AdminContext);
}

export function AdminProvider({ children }: { children: React.ReactNode }) {
  const [admin, setAdmin] = useState<AdminUser | null>(null);
  const [loading, setLoading] = useState(true);
  const supabase = createClient();

  useEffect(() => {
    async function loadAdmin() {
      const {
        data: { user },
      } = await supabase.auth.getUser();

      if (!user) {
        // No auth session — middleware will redirect to login
        setLoading(false);
        return;
      }

      if (user.email) {
        const { data } = await supabase
          .from('admin_users')
          .select('*')
          .eq('email', user.email)
          .eq('is_active', true)
          .single();

        if (data) {
          const adminData = data as AdminUser;
          setAdmin({
            ...adminData,
            name: adminData.name || user.user_metadata?.full_name || null,
            profile_image_url:
              adminData.profile_image_url || user.user_metadata?.avatar_url || null,
          });
          setLoading(false);
          return;
        }
      }

      // Authenticated but NOT an approved admin — sign out and redirect
      await supabase.auth.signOut();
      window.location.href = '/login?error=unauthorized';
    }
    loadAdmin();
  }, [supabase]);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    window.location.href = '/login';
  };

  // Show loading indicator while checking admin status
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-sm text-text-secondary">관리자 권한을 확인하고 있습니다...</p>
      </div>
    );
  }

  return (
    <AdminContext.Provider value={{ admin, loading, signOut: handleSignOut }}>
      {children}
    </AdminContext.Provider>
  );
}
