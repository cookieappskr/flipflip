'use client';

import { useState, useEffect, useCallback } from 'react';
import {
  processSyncQueue,
  getSyncStatus,
  startSyncTimer,
  stopSyncTimer,
  registerVisibilitySync,
} from '@/lib/db/syncService';

interface SyncState {
  pendingCount: number;
  lastSyncAt: string | null;
  isSyncing: boolean;
}

export function useSync() {
  const [state, setState] = useState<SyncState>({
    pendingCount: 0,
    lastSyncAt: null,
    isSyncing: false,
  });

  const refreshStatus = useCallback(async () => {
    const status = await getSyncStatus();
    setState(status);
  }, []);

  const syncNow = useCallback(async () => {
    setState((prev) => ({ ...prev, isSyncing: true }));
    try {
      await processSyncQueue();
    } finally {
      await refreshStatus();
    }
  }, [refreshStatus]);

  useEffect(() => {
    refreshStatus();
    startSyncTimer();
    const unregister = registerVisibilitySync();

    // Refresh status periodically
    const statusInterval = setInterval(refreshStatus, 30_000);

    return () => {
      stopSyncTimer();
      unregister();
      clearInterval(statusInterval);
    };
  }, [refreshStatus]);

  return {
    ...state,
    syncNow,
  };
}
