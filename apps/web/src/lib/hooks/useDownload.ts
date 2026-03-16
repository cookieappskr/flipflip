'use client';

import { useState, useCallback } from 'react';
import { downloadLevelWithPriority } from '@/lib/db/downloadManager';

interface DownloadState {
  isDownloading: boolean;
  progress: number;
  message: string;
}

export function useDownload() {
  const [state, setState] = useState<DownloadState>({
    isDownloading: false,
    progress: 0,
    message: '',
  });

  const startDownload = useCallback(async (levelNumber: number, userId: string) => {
    setState({ isDownloading: true, progress: 0, message: '다운로드 시작...' });

    try {
      await downloadLevelWithPriority(levelNumber, userId, ({ percent, message }) => {
        setState({ isDownloading: percent < 100, progress: percent, message });
      });
    } catch (error) {
      setState({ isDownloading: false, progress: 0, message: '다운로드 실패' });
      throw error;
    }
  }, []);

  return {
    ...state,
    startDownload,
  };
}
