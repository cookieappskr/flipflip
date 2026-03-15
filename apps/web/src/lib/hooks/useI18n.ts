'use client';

import { useMemo } from 'react';
import ko from '@/i18n/ko.json';
import en from '@/i18n/en.json';

const messages: Record<string, typeof ko> = { ko, en };

function getNestedValue(obj: any, path: string): string {
  return path.split('.').reduce((acc, key) => acc?.[key], obj) ?? path;
}

export function useI18n(locale: string = 'ko') {
  const t = useMemo(() => {
    const currentMessages = messages[locale] || messages['ko'];

    return (key: string, params?: Record<string, string | number>) => {
      let text = getNestedValue(currentMessages, key);
      if (params) {
        Object.entries(params).forEach(([k, v]) => {
          text = text.replace(`{${k}}`, String(v));
        });
      }
      return text;
    };
  }, [locale]);

  return { t };
}
