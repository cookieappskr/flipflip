import { Sidebar } from '@/components/layout/Sidebar';
import { Header } from '@/components/layout/Header';
import { AdminProvider } from '@/components/layout/AdminContext';

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <AdminProvider>
      <div className="min-h-screen">
        <Sidebar />
        <div className="ml-64">
          <Header />
          <main className="p-6">{children}</main>
        </div>
      </div>
    </AdminProvider>
  );
}
