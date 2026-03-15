// Pure scoring functions for FlipFlip learning algorithm

import type { CheckType, MasteryLevelCode } from '@/types/database';

export interface MasteryLevel {
  type_id: string;
  code: MasteryLevelCode;
  base_score: number;       // value field
  interval_minutes: number; // extra_attr_1 field
  display_order: number;
}

export interface CheckTypeValue {
  code: CheckType;
  score: number; // value field (+2, +0.5, -1)
}

/**
 * Calculate new accumulated score after a check.
 * Floor at 0.
 */
export function calculateAccumulatedScore(
  currentScore: number,
  checkScore: number
): number {
  return Math.max(0, currentScore + checkScore);
}

/**
 * Determine mastery level based on accumulated score.
 * Returns the highest level whose base_score <= accumulated_score.
 */
export function determineMasteryLevel(
  accumulatedScore: number,
  masteryLevels: MasteryLevel[]
): MasteryLevel {
  // Sort by base_score descending to find highest matching
  const sorted = [...masteryLevels].sort((a, b) => b.base_score - a.base_score);
  for (const level of sorted) {
    if (accumulatedScore >= level.base_score) {
      return level;
    }
  }
  // Fallback to lowest level
  return masteryLevels.sort((a, b) => a.display_order - b.display_order)[0];
}

/**
 * Calculate next review time based on mastery level interval.
 */
export function calculateNextReviewAt(
  intervalMinutes: number,
  fromDate: Date = new Date()
): Date {
  return new Date(fromDate.getTime() + intervalMinutes * 60 * 1000);
}

/**
 * Calculate skill achievement score (sum of mastery_scores for all sentences in skill).
 */
export function calculateSkillAchievement(
  sentenceScores: { mastery_score: number }[]
): number {
  return sentenceScores.reduce((sum, s) => sum + s.mastery_score, 0);
}

/**
 * Calculate total possible score for a skill.
 * total = sentence_count × perfect_mastery_base_score (8)
 */
export function calculateSkillTotalScore(
  sentenceCount: number,
  perfectMasteryScore: number = 8
): number {
  return sentenceCount * perfectMasteryScore;
}

/**
 * Check if skill should be cleared (skill-up).
 * achievement_score >= total_score × (skill_up_ratio / 100)
 */
export function checkSkillUp(
  achievementScore: number,
  totalScore: number,
  skillUpRatio: number = 80
): boolean {
  if (totalScore === 0) return false;
  return achievementScore >= totalScore * (skillUpRatio / 100);
}

/**
 * Check if all skills in current level are cleared → level up.
 */
export function checkLevelUp(
  skillStatuses: { is_cleared: boolean }[]
): boolean {
  if (skillStatuses.length === 0) return false;
  return skillStatuses.every((s) => s.is_cleared);
}
