'use client';

import { Moon, Sun, LogOut } from 'lucide-react';
import { useTheme } from './ThemeProvider';
import { useAdmin } from './AdminContext';

export function Header() {
  const { theme, toggleTheme } = useTheme();
  const { admin, signOut } = useAdmin();

  return (
    <header className="h-14 border-b border-border bg-surface flex items-center justify-end px-6 gap-4">
      <button
        onClick={toggleTheme}
        className="p-2 rounded-md hover:bg-neutral-100 transition-colors"
        aria-label="테마 전환"
      >
        {theme === 'light' ? <Moon size={18} /> : <Sun size={18} />}
      </button>

      {admin && (
        <div className="flex items-center gap-3">
          {admin.profile_image_url ? (
            <img
              src={admin.profile_image_url}
              alt={admin.name || ''}
              className="w-8 h-8 rounded-full"
            />
          ) : (
            <div className="w-8 h-8 rounded-full bg-primary-500 flex items-center justify-center text-white text-sm font-medium">
              {(admin.name || admin.email)?.[0]?.toUpperCase()}
            </div>
          )}
          <span className="text-sm text-text-primary">{admin.name || admin.email}</span>
          <button
            onClick={signOut}
            className="p-2 rounded-md hover:bg-neutral-100 transition-colors text-text-secondary"
            aria-label="로그아웃"
          >
            <LogOut size={18} />
          </button>
        </div>
      )}
    </header>
  );
}
