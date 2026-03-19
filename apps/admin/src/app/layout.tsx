import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import { ThemeProvider } from '@/components/layout/ThemeProvider';

const inter = Inter({ subsets: ['latin'] });

const faviconUrl = process.env.NODE_ENV === 'development' ? '/favicon-local.svg' : '/favicon.svg';

export const metadata: Metadata = {
  title: 'Admin',
  description: 'FlipFlip 관리자 시스템',
  icons: {
    icon: [
      { url: faviconUrl, type: 'image/svg+xml' },
    ],
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ko" suppressHydrationWarning>
      <body className={inter.className}>
        <ThemeProvider>{children}</ThemeProvider>
      </body>
    </html>
  );
}
