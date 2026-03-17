import { db } from './flipflipDb';
import type { DownloadStatusEntry } from '@/types/localDb';

const PRIORITY_SKILL_COUNT = 2;

interface DownloadProgress {
  percent: number;
  message: string;
}

type ProgressCallback = (progress: DownloadProgress) => void;

/**
 * Check if a level's priority skills (first 2) are already downloaded.
 */
export async function isLevelDownloaded(levelNumber: number): Promise<boolean> {
  const statuses = await db.downloadStatus
    .where('level_number')
    .equals(levelNumber)
    .toArray();

  if (statuses.length === 0) return false;

  // At minimum, first 2 skills must be complete
  const completeCount = statuses.filter((s) => s.status === 'complete').length;
  return completeCount >= PRIORITY_SKILL_COUNT;
}

/**
 * Download level data with priority loading:
 * 1. Fetch skill list for the level
 * 2. Download first 2 skills (priority) → learning can start
 * 3. Download remaining skills in background
 */
export async function downloadLevel(
  levelNumber: number,
  userId: string,
  onProgress?: ProgressCallback
): Promise<void> {
  onProgress?.({ percent: 5, message: '스킬 목록을 가져오고 있습니다...' });

  // Step 1: Fetch all skills for this level to get the list
  const metaRes = await fetch(`/api/learning/download?level=${levelNumber}`);
  if (!metaRes.ok) throw new Error(`Download failed: ${metaRes.status}`);
  const metaData = await metaRes.json();

  const allSkills = metaData.skills || [];
  if (allSkills.length === 0) {
    onProgress?.({ percent: 100, message: '스킬이 없습니다.' });
    return;
  }

  // Store level
  await db.levels.put(metaData.level);

  // Store all skills (metadata is small)
  await db.skills.bulkPut(allSkills);

  // Store types and policy settings from the full response
  if (metaData.types?.length) await db.types.bulkPut(metaData.types);
  if (metaData.policy_settings?.length) await db.policySettings.bulkPut(metaData.policy_settings);
  if (metaData.user_profile) await db.userProfiles.put(metaData.user_profile);

  // Store all data from the full fetch (sentences, expressions, scores, progress)
  await storeBulkData(metaData);

  // Mark all skills as complete
  const now = new Date().toISOString();
  const downloadStatuses: DownloadStatusEntry[] = allSkills.map((skill: { id: string }) => {
    const skillSentences = (metaData.sentences || []).filter(
      (s: { skill_id: string }) => s.skill_id === skill.id
    );
    return {
      level_number: levelNumber,
      skill_id: skill.id,
      status: 'complete' as const,
      downloaded_at: now,
      sentence_count: skillSentences.length,
    };
  });

  await db.downloadStatus.bulkPut(downloadStatuses);

  onProgress?.({ percent: 100, message: '학습 준비 완료!' });
}

/**
 * Download only specific skills for a level (used for background loading).
 */
export async function downloadSkills(
  levelNumber: number,
  skillIds: string[],
  onProgress?: ProgressCallback
): Promise<void> {
  if (skillIds.length === 0) return;

  const res = await fetch(
    `/api/learning/download?level=${levelNumber}&skill_ids=${skillIds.join(',')}`
  );
  if (!res.ok) throw new Error(`Skill download failed: ${res.status}`);
  const data = await res.json();

  await storeBulkData(data);

  const now = new Date().toISOString();
  for (const skillId of skillIds) {
    const skillSentences = (data.sentences || []).filter(
      (s: { skill_id: string }) => s.skill_id === skillId
    );
    await db.downloadStatus.put({
      level_number: levelNumber,
      skill_id: skillId,
      status: 'complete',
      downloaded_at: now,
      sentence_count: skillSentences.length,
    });
  }

  onProgress?.({ percent: 100, message: '백그라운드 다운로드 완료' });
}

/**
 * Download level with priority loading strategy:
 * First 2 skills loaded first, then remaining in background.
 */
export async function downloadLevelWithPriority(
  levelNumber: number,
  userId: string,
  onProgress?: ProgressCallback
): Promise<void> {
  onProgress?.({ percent: 5, message: '스킬 목록을 가져오고 있습니다...' });

  // We use a single full download for simplicity and fewer round trips.
  // The API returns all data for the level in one call.
  // If the level has many skills, we could optimize with two calls,
  // but a single call is simpler and the data size per level is manageable.
  await downloadLevel(levelNumber, userId, onProgress);
}

async function storeBulkData(data: Record<string, unknown[]>): Promise<void> {
  const sentences = (data.sentences as Array<Record<string, unknown>>) || [];
  const expressions = (data.expressions as Array<Record<string, unknown>>) || [];
  const userScores = (data.user_scores as Array<Record<string, unknown>>) || [];
  const userProgress = (data.user_progress as Array<Record<string, unknown>>) || [];

  await db.transaction('rw', [db.sentences, db.expressions, db.userSentenceScores, db.userLearningProgress], async () => {
    if (sentences.length) await db.sentences.bulkPut(sentences as never[]);
    if (expressions.length) await db.expressions.bulkPut(expressions as never[]);
    if (userScores.length) await db.userSentenceScores.bulkPut(userScores as never[]);
    if (userProgress.length) await db.userLearningProgress.bulkPut(userProgress as never[]);
  });
}
