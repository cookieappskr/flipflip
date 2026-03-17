import { db } from './flipflipDb';
import type { MasteryLevel, CheckTypeValue } from '@/lib/utils/scoring';
import type { MasteryLevelCode } from '@/types/database';

/**
 * Get all mastery levels from local types table.
 */
export async function getMasteryLevels(): Promise<MasteryLevel[]> {
  const parent = await db.types.where('type_code').equals('MASTERY_LEVEL').first();
  if (!parent) return [];

  const children = await db.types
    .where('parent_id')
    .equals(parent.id)
    .and((t) => t.is_active)
    .sortBy('display_order');

  return children.map((t) => ({
    type_id: t.id,
    code: t.type_code as MasteryLevelCode,
    base_score: parseFloat(t.value || '0'),
    interval_minutes: parseInt(t.extra_attr_1 || '30', 10),
    display_order: t.display_order,
  }));
}

/**
 * Get check type score value for a given code (PERFECT, MOSTLY, MISSED).
 */
export async function getCheckTypeScore(code: string): Promise<CheckTypeValue | null> {
  const parent = await db.types.where('type_code').equals('CHECK_TYPE').first();
  if (!parent) return null;

  const checkType = await db.types
    .where('parent_id')
    .equals(parent.id)
    .and((t) => t.type_code === code)
    .first();

  if (!checkType) return null;

  return {
    code: code as CheckTypeValue['code'],
    score: parseFloat(checkType.value || '0'),
  };
}

/**
 * Get the skill_up_ratio from policy_settings.
 */
export async function getSkillUpRatio(): Promise<number> {
  const policy = await db.policySettings.where('key').equals('skill_up_ratio').first();
  return parseFloat(policy?.value || '80');
}

/**
 * Get daily goal info from user profile's daily_goal_type_id.
 */
export async function getDailyGoalInfo(dailyGoalTypeId: string | null): Promise<{
  dailyGoalMinutes: number;
  dailyGoalTypeName: string;
  minCheckCount: number;
}> {
  if (!dailyGoalTypeId) return { dailyGoalMinutes: 5, dailyGoalTypeName: '기본값 (미설정)', minCheckCount: 10 };

  const goalType = await db.types.get(dailyGoalTypeId);
  if (!goalType) return { dailyGoalMinutes: 5, dailyGoalTypeName: '기본값 (미설정)', minCheckCount: 10 };

  const minutes = parseInt(goalType.value || '5', 10);
  return {
    dailyGoalMinutes: minutes,
    dailyGoalTypeName: goalType.type_name || `${minutes}분`,
    minCheckCount: parseInt(goalType.extra_attr_1 || '10', 10),
  };
}
