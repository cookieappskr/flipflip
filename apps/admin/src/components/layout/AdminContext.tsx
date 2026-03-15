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
      if (user?.email) {
        const { data } = await supabase
          .from('admin_users')
          .select('*')
          .eq('email', user.email)
          .single();
        if (data) {
          const adminData = data as AdminUser;
          setAdmin({
            ...adminData,
            name: adminData.name || user.user_metadata?.full_name || null,
            profile_image_url:
              adminData.profile_image_url || user.user_metadata?.avatar_url || null,
          });
        }
      }
      setLoading(false);
    }
    loadAdmin();
  }, [supabase]);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    window.location.href = '/login';
  };

  return (
    <AdminContext.Provider value={{ admin, loading, signOut: handleSignOut }}>
      {children}
    </AdminContext.Provider>
  );
}
