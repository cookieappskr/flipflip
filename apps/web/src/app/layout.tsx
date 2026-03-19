import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import { ThemeProvider } from '@/components/layout/ThemeProvider';

const inter = Inter({ subsets: ['latin'] });

const faviconUrl = process.env.NODE_ENV === 'development' ? '/favicon-local.svg' : '/favicon.svg';

export const metadata: Metadata = {
  title: 'FlipFlip 세상에서 가장쉬운 언어연습앱',
  description: 'FlipFlip 세상에서 가장쉬운 언어연습앱',
  icons: {
    icon: [
      { url: faviconUrl, type: 'image/svg+xml' },
    ],
  },
  viewport: 'width=device-width, initial-scale=1, maximum-scale=1',
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
