import { db } from './flipflipDb';
import { getMasteryLevels, getCheckTypeScore, getSkillUpRatio } from './typeCache';
import {
  calculateAccumulatedScore,
  determineMasteryLevel,
  calculateNextReviewAt,
  calculateSkillAchievement,
  calculateSkillTotalScore,
  checkSkillUp,
  checkLevelUp,
} from '@/lib/utils/scoring';
import type { ScoreResult, CheckType } from '@/types/database';
import { downloadLevelWithPriority } from './downloadManager';

/**
 * Process a check locally using Dexie DB.
 * Mirrors the logic of /api/score/route.ts exactly.
 * All writes are atomic within a transaction and queued for sync.
 */
export async function processCheckLocally(
  userId: string,
  sentenceId: string,
  checkTypeCode: CheckType
): Promise<ScoreResult> {
  // 1. Get check type score
  const checkTypeValue = await getCheckTypeScore(checkTypeCode);
  if (!checkTypeValue) {
    console.error('[scoreProcessor] CHECK_TYPE not found in local DB for:', checkTypeCode);
    throw new Error(`Invalid check type: ${checkTypeCode}`);
  }
  const checkScore = checkTypeValue.score;
  console.log('[scoreProcessor] checkType:', checkTypeCode, 'score:', checkScore);

  // 2. Get mastery levels
  const masteryLevels = await getMasteryLevels();
  if (masteryLevels.length === 0) {
    console.error('[scoreProcessor] No MASTERY_LEVEL types found in local DB');
    throw new Error('No mastery levels found in local DB');
  }

  // 3. Get or create user_sentence_score
  const existingScore = await db.userSentenceScores
    .where('[user_id+sentence_id]')
    .equals([userId, sentenceId])
    .first();

  const oldScore = existingScore ? parseFloat(String(existingScore.accumulated_score)) : 0;
  const newAccumulatedScore = calculateAccumulatedScore(oldScore, checkScore);
  console.log('[scoreProcessor] sentence:', sentenceId, 'oldScore:', oldScore, '→ newScore:', newAccumulatedScore);
  const newMastery = determineMasteryLevel(newAccumulatedScore, masteryLevels);
  const nextReviewAt = calculateNextReviewAt(newMastery.interval_minutes);
  const now = new Date().toISOString();

  // 4. Get sentence's skill
  const sentence = await db.sentences.get(sentenceId);
  if (!sentence) throw new Error(`Sentence not found: ${sentenceId}`);

  // 4.5. Pre-fetch skill_up_ratio BEFORE transaction (policySettings is not in transaction scope)
  const skillUpRatio = await getSkillUpRatio();

  // Execute all writes in a transaction
  let achievementScore = 0;
  let totalScore = 0;
  let skillUp = false;
  let wasCleared = false;
  let levelUp = false;
  let newLevel: number | null = null;

  await db.transaction(
    'rw',
    [db.userSentenceScores, db.userLearningProgress, db.userProfiles, db.sentences, db.skills, db.levels, db.syncQueue],
    async () => {
      // 4. Upsert user_sentence_score
      if (existingScore) {
        await db.userSentenceScores.update(existingScore.id, {
          accumulated_score: newAccumulatedScore,
          mastery_level_type_id: newMastery.type_id,
          mastery_score: newMastery.base_score,
          next_review_at: nextReviewAt.toISOString(),
          last_checked_at: now,
          check_count: (existingScore.check_count || 0) + 1,
          updated_at: now,
        });

        // Queue for sync
        await db.syncQueue.add({
          table_name: 'user_sentence_scores',
          record_id: existingScore.id,
          operation: 'upsert',
          payload: {
            id: existingScore.id,
            user_id: userId,
            sentence_id: sentenceId,
            accumulated_score: newAccumulatedScore,
            mastery_level_type_id: newMastery.type_id,
            mastery_score: newMastery.base_score,
            next_review_at: nextReviewAt.toISOString(),
            last_checked_at: now,
            check_count: (existingScore.check_count || 0) + 1,
          },
          status: 'pending',
          created_at: now,
          synced_at: null,
        });
      } else {
        const newId = crypto.randomUUID();
        await db.userSentenceScores.add({
          id: newId,
          user_id: userId,
          sentence_id: sentenceId,
          accumulated_score: newAccumulatedScore,
          mastery_level_type_id: newMastery.type_id,
          mastery_score: newMastery.base_score,
          next_review_at: nextReviewAt.toISOString(),
          last_checked_at: now,
          check_count: 1,
          created_at: now,
          updated_at: now,
        });

        await db.syncQueue.add({
          table_name: 'user_sentence_scores',
          record_id: newId,
          operation: 'upsert',
          payload: {
            id: newId,
            user_id: userId,
            sentence_id: sentenceId,
            accumulated_score: newAccumulatedScore,
            mastery_level_type_id: newMastery.type_id,
            mastery_score: newMastery.base_score,
            next_review_at: nextReviewAt.toISOString(),
            last_checked_at: now,
            check_count: 1,
          },
          status: 'pending',
          created_at: now,
          synced_at: null,
        });
      }

      // 5. Recalculate skill achievement
      const skillSentences = await db.sentences
        .where('skill_id')
        .equals(sentence.skill_id)
        .toArray();

      const sentenceIds = skillSentences.map((s) => s.id);

      const allScores = await db.userSentenceScores
        .where('user_id')
        .equals(userId)
        .toArray();

      const skillScores = allScores.filter((s) => sentenceIds.includes(s.sentence_id));

      achievementScore = calculateSkillAchievement(
        skillScores.map((s) => ({ mastery_score: parseFloat(String(s.mastery_score)) }))
      );
      totalScore = calculateSkillTotalScore(sentenceIds.length);

      // 6. Check skill-up (skillUpRatio pre-fetched before transaction)
      skillUp = checkSkillUp(achievementScore, totalScore, skillUpRatio);

      // 7. Update user_learning_progress
      const existingProgress = await db.userLearningProgress
        .where('[user_id+skill_id]')
        .equals([userId, sentence.skill_id])
        .first();

      wasCleared = existingProgress?.is_cleared || false;

      if (existingProgress) {
        await db.userLearningProgress.update(existingProgress.id, {
          achievement_score: achievementScore,
          is_cleared: skillUp,
          cleared_at: skillUp && !wasCleared ? now : existingProgress.cleared_at,
          updated_at: now,
        });

        await db.syncQueue.add({
          table_name: 'user_learning_progress',
          record_id: existingProgress.id,
          operation: 'upsert',
          payload: {
            id: existingProgress.id,
            user_id: userId,
            skill_id: sentence.skill_id,
            achievement_score: achievementScore,
            is_cleared: skillUp,
            cleared_at: skillUp && !wasCleared ? now : existingProgress.cleared_at,
          },
          status: 'pending',
          created_at: now,
          synced_at: null,
        });
      } else {
        const progressId = crypto.randomUUID();
        await db.userLearningProgress.add({
          id: progressId,
          user_id: userId,
          skill_id: sentence.skill_id,
          achievement_score: achievementScore,
          is_cleared: skillUp,
          cleared_at: skillUp ? now : null,
          created_at: now,
          updated_at: now,
        });

        await db.syncQueue.add({
          table_name: 'user_learning_progress',
          record_id: progressId,
          operation: 'upsert',
          payload: {
            id: progressId,
            user_id: userId,
            skill_id: sentence.skill_id,
            achievement_score: achievementScore,
            is_cleared: skillUp,
            cleared_at: skillUp ? now : null,
          },
          status: 'pending',
          created_at: now,
          synced_at: null,
        });
      }

      // 8. Check level-up
      if (skillUp && !wasCleared) {
        const skill = await db.skills.get(sentence.skill_id);
        if (skill) {
          const levelSkills = await db.skills
            .where('level_id')
            .equals(skill.level_id)
            .toArray();

          const levelSkillIds = levelSkills.map((s) => s.id);
          const allProgress = await db.userLearningProgress
            .where('user_id')
            .equals(userId)
            .toArray();

          const progressMap = new Map(allProgress.map((p) => [p.skill_id, p.is_cleared]));
          const allCleared = checkLevelUp(
            levelSkillIds.map((id) => ({ is_cleared: progressMap.get(id) === true }))
          );

          if (allCleared) {
            levelUp = true;
            const levelRecord = await db.levels.get(skill.level_id);
            if (levelRecord) {
              newLevel = levelRecord.level_number + 1;

              // Update local user profile
              await db.userProfiles.update(userId, { current_level: newLevel });

              await db.syncQueue.add({
                table_name: 'user_profiles',
                record_id: userId,
                operation: 'update',
                payload: { user_id: userId, current_level: newLevel },
                status: 'pending',
                created_at: now,
                synced_at: null,
              });
            }
          }
        }
      }
    }
  );

  // 9. Trigger next level download if level up (outside transaction)
  if (levelUp && newLevel) {
    downloadLevelWithPriority(newLevel, userId).catch(() => {
      // Background download failure is non-critical
    });
  }

  return {
    accumulated_score: newAccumulatedScore,
    mastery_level_type_id: newMastery.type_id,
    mastery_level_code: newMastery.code,
    mastery_score: newMastery.base_score,
    next_review_at: nextReviewAt.toISOString(),
    skill_achievement_score: achievementScore,
    skill_total_score: totalScore,
    skill_up: skillUp && !wasCleared,
    level_up: levelUp,
    new_level: newLevel,
  };
}
