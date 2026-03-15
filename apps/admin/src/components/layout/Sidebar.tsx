'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  FolderTree,
  BookOpen,
  Layers,
  Settings,
  Users,
  FileText,
} from 'lucide-react';

const menuItems = [
  { href: '/types', label: '유형관리', icon: FolderTree },
  { href: '/content', label: '콘텐츠관리', icon: BookOpen },
  { href: '/levels', label: '레벨관리', icon: Layers },
  { href: '/policies', label: '정책관리', icon: Settings },
  { href: '/members', label: '회원관리', icon: Users },
  { href: '/terms', label: '약관관리', icon: FileText },
];

export function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="fixed left-0 top-0 h-full w-64 bg-[var(--color-sidebar-bg)] flex flex-col z-30">
      <div className="p-6">
        <h1 className="text-xl font-bold text-white">FlipFlip</h1>
        <p className="text-xs text-[var(--color-sidebar-text)] mt-1">Admin</p>
      </div>

      <nav className="flex-1 px-3">
        {menuItems.map((item) => {
          const isActive = pathname.startsWith(item.href);
          const Icon = item.icon;
          return (
            <Link
              key={item.href}
              href={item.href}
              className={`flex items-center gap-3 px-3 py-2.5 rounded-md mb-1 text-sm transition-colors ${
                isActive
                  ? 'bg-[var(--color-sidebar-active)] text-white'
                  : 'text-[var(--color-sidebar-text)] hover:bg-white/10 hover:text-white'
              }`}
            >
              <Icon size={18} />
              <span>{item.label}</span>
            </Link>
          );
        })}
      </nav>
    </aside>
  );
}
