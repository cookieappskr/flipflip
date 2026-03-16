// Local DB types for FlipFlip offline-first architecture

export interface SyncQueueEntry {
  id?: number; // auto-increment
  table_name: 'user_sentence_scores' | 'user_learning_progress' | 'user_profiles';
  record_id: string;
  operation: 'upsert' | 'update';
  payload: Record<string, unknown>;
  status: 'pending' | 'syncing' | 'synced' | 'failed';
  created_at: string;
  synced_at: string | null;
}

export interface DownloadStatusEntry {
  level_number: number;
  skill_id: string;
  status: 'pending' | 'downloading' | 'complete' | 'error';
  downloaded_at: string | null;
  sentence_count: number;
}
