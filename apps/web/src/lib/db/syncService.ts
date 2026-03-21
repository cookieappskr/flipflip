import { db } from './flipflipDb';

let syncTimer: ReturnType<typeof setInterval> | null = null;
let isSyncing = false;

const SYNC_INTERVAL_MS = 5 * 60 * 1000; // 5 minutes

/**
 * Process the sync queue: read pending items, deduplicate, POST to server.
 */
export async function processSyncQueue(): Promise<{
  synced: number;
  failed: number;
}> {
  if (isSyncing) return { synced: 0, failed: 0 };
  isSyncing = true;

  try {
    // Include failed items for retry
    const pendingItems = await db.syncQueue
      .where('status')
      .anyOf(['pending', 'failed'])
      .toArray();

    if (pendingItems.length === 0) {
      return { synced: 0, failed: 0 };
    }

    // Deduplicate: keep latest entry per record_id
    const latestByRecord = new Map<string, typeof pendingItems[0]>();
    for (const item of pendingItems) {
      const key = `${item.table_name}:${item.record_id}`;
      const existing = latestByRecord.get(key);
      if (!existing || item.created_at > existing.created_at) {
        latestByRecord.set(key, item);
      }
    }

    const deduped = Array.from(latestByRecord.values());

    // Separate by table
    const scores = deduped
      .filter((i) => i.table_name === 'user_sentence_scores')
      .map((i) => i.payload);

    const progress = deduped
      .filter((i) => i.table_name === 'user_learning_progress')
      .map((i) => i.payload);

    const profileUpdate = deduped.find((i) => i.table_name === 'user_profiles');

    // Mark as syncing
    const allIds = pendingItems.map((i) => i.id!).filter(Boolean);
    await db.syncQueue.where('id').anyOf(allIds).modify({ status: 'syncing' });

    try {
      const res = await fetch('/api/learning/sync', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          scores,
          progress,
          profile_updates: profileUpdate
            ? { current_level: profileUpdate.payload.current_level as number }
            : null,
        }),
      });

      if (!res.ok) throw new Error(`Sync failed: ${res.status}`);

      const now = new Date().toISOString();

      // Mark synced items
      await db.syncQueue.where('id').anyOf(allIds).modify({
        status: 'synced',
        synced_at: now,
      });

      // Clean up old synced items (keep last 100)
      const syncedItems = await db.syncQueue
        .where('status')
        .equals('synced')
        .sortBy('created_at');

      if (syncedItems.length > 100) {
        const toDelete = syncedItems.slice(0, syncedItems.length - 100);
        await db.syncQueue.bulkDelete(toDelete.map((i) => i.id!));
      }

      return { synced: deduped.length, failed: 0 };
    } catch {
      // Mark back as pending on failure
      await db.syncQueue.where('id').anyOf(allIds).modify({ status: 'failed' });
      return { synced: 0, failed: deduped.length };
    }
  } finally {
    isSyncing = false;
  }
}

/**
 * Get current sync status info.
 */
export async function getSyncStatus(): Promise<{
  pendingCount: number;
  lastSyncAt: string | null;
  isSyncing: boolean;
}> {
  const pendingCount = await db.syncQueue
    .where('status')
    .anyOf(['pending', 'failed'])
    .count();

  const lastSynced = await db.syncQueue
    .where('status')
    .equals('synced')
    .last();

  return {
    pendingCount,
    lastSyncAt: lastSynced?.synced_at || null,
    isSyncing,
  };
}

/**
 * Start periodic sync timer.
 */
export function startSyncTimer(): void {
  if (syncTimer) return;
  syncTimer = setInterval(() => {
    processSyncQueue().catch(() => {});
  }, SYNC_INTERVAL_MS);
}

/**
 * Stop periodic sync timer.
 */
export function stopSyncTimer(): void {
  if (syncTimer) {
    clearInterval(syncTimer);
    syncTimer = null;
  }
}

/**
 * Register visibilitychange handler to sync when tab is hidden.
 */
export function registerVisibilitySync(): () => void {
  const handler = () => {
    if (document.visibilityState === 'hidden') {
      processSyncQueue().catch(() => {});
    }
  };

  document.addEventListener('visibilitychange', handler);
  return () => document.removeEventListener('visibilitychange', handler);
}
