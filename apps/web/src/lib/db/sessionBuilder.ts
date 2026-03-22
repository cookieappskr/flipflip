import { db } from './flipflipDb';
import { getDailyGoalInfo, getSkillUpRatio } from './typeCache';
import type { LearningCard } from '@/types/database';

interface SessionResult {
  cards: LearningCard[];
  skill: {
    id: string;
    skill_name: string;
    achievement_score: number;
    total_score: number;
    skill_up_ratio: number;
    is_cleared: boolean;
    tense_type_code: string | null;
    tense_type_name: string | null;
    pattern_type_code: string | null;
    pattern_type_name: string | null;
  } | null;
  level: number;
  level_summary: string | null;
  debug: {
    daily_goal_minutes: number;
    daily_goal_type_name?: string;
    min_check_count: number;
    local_sentence_count: number;
    session_sentence_count: number;
  } | null;
}

/**
 * Build a learning session entirely from local Dexie DB.
 * Mirrors the logic of /api/learning/session/route.ts.
 */
export async function buildLocalSession(
  userId: string,
  currentLevel: number,
  learningLanguage: string
): Promise<SessionResult> {
  const langCode = learningLanguage.toUpperCase();

  // 1. Get user profile for daily goal
  const profile = await db.userProfiles.get(userId);
  const { dailyGoalMinutes, dailyGoalTypeName, minCheckCount } = await getDailyGoalInfo(
    profile?.daily_goal_type_id || null
  );

  // 2. Get current level
  const level = await db.levels.where('level_number').equals(currentLevel).first();
  if (!level) {
    return { cards: [], skill: null, level: currentLevel, level_summary: null, debug: null };
  }

  // 3. Get skills for current level, ordered by display_order
  const skills = await db.skills
    .where('level_id')
    .equals(level.id)
    .sortBy('display_order');

  if (!skills.length) {
    return { cards: [], skill: null, level: currentLevel, level_summary: level.level_summary || null, debug: null };
  }

  // Resolve type names for tense/pattern codes
  const typeCodes = skills
    .flatMap((s) => [s.tense_type_code, s.pattern_type_code])
    .filter(Boolean) as string[];

  const typeNameMap = new Map<string, string>();
  if (typeCodes.length > 0) {
    const uniqueCodes = [...new Set(typeCodes)];
    for (const code of uniqueCodes) {
      const t = await db.types.where('type_code').equals(code).first();
      if (t) typeNameMap.set(code, t.type_name);
    }
  }

  // 4. Find current skill (first uncleared)
  const progressList = await db.userLearningProgress
    .where('user_id')
    .equals(userId)
    .toArray();

  const progressMap = new Map(progressList.map((p) => [p.skill_id, p]));
  const currentSkill = skills.find((s) => !progressMap.get(s.id)?.is_cleared) || skills[0];
  const currentSkillIndex = skills.findIndex((s) => s.id === currentSkill.id);

  // 5. Get sentences from current skill
  let allFetchedSentences = await db.sentences
    .where('skill_id')
    .equals(currentSkill.id)
    .toArray();

  // If not enough, add from next skills
  if (allFetchedSentences.length < minCheckCount && currentSkillIndex < skills.length - 1) {
    for (let i = currentSkillIndex + 1; i < skills.length; i++) {
      if (allFetchedSentences.length >= minCheckCount) break;
      const nextSentences = await db.sentences
        .where('skill_id')
        .equals(skills[i].id)
        .toArray();
      allFetchedSentences = [...allFetchedSentences, ...nextSentences];
    }
  }

  const sentenceIds = allFetchedSentences.map((s) => s.id);

  // 6. Get existing user scores
  const existingScores = await db.userSentenceScores
    .where('user_id')
    .equals(userId)
    .toArray();

  const scoreMap = new Map(
    existingScores
      .filter((s) => sentenceIds.includes(s.sentence_id))
      .map((s) => [s.sentence_id, s])
  );

  // Get mastery code map
  const masteryParent = await db.types.where('type_code').equals('MASTERY_LEVEL').first();
  const masteryTypes = masteryParent
    ? await db.types.where('parent_id').equals(masteryParent.id).toArray()
    : [];
  const masteryCodeMap = new Map(masteryTypes.map((t) => [t.id, t.type_code]));
  const masteryNameMap = new Map(masteryTypes.map((t) => [t.id, t.type_name]));

  // 7. Separate new vs review sentences
  const newSentenceIds = sentenceIds.filter((id) => !scoreMap.has(id));

  const now = new Date().toISOString();
  const reviewScores = existingScores.filter(
    (s) => s.next_review_at && s.next_review_at <= now
  ).slice(0, 30);
  const reviewSentenceIds = reviewScores.map((s) => s.sentence_id);
  const reviewScoreMap = new Map(reviewScores.map((s) => [s.sentence_id, s]));

  let allNeededIds = [...new Set([...newSentenceIds, ...reviewSentenceIds])];

  // Fallback: if no new or review, include all current skill sentences
  if (allNeededIds.length === 0 && sentenceIds.length > 0) {
    allNeededIds = sentenceIds;
  }

  // 8. Build cards with expressions
  const cards: LearningCard[] = [];

  for (const sentenceId of allNeededIds) {
    const sentence = allFetchedSentences.find((s) => s.id === sentenceId)
      || await db.sentences.get(sentenceId);
    if (!sentence) continue;

    // Get expression in learning language
    const expression = await db.expressions
      .where('[sentence_id+language_code]')
      .equals([sentenceId, langCode])
      .first();

    const score = scoreMap.get(sentenceId) || reviewScoreMap.get(sentenceId);
    const skill = skills.find((s) => s.id === sentence.skill_id) || currentSkill;

    cards.push({
      sentence_id: sentenceId,
      meaning: sentence.meaning || '',
      expression: expression?.expression_text || '',
      hint: expression?.hint || null,
      skill_name: skill.skill_name,
      skill_id: sentence.skill_id,
      is_review: reviewSentenceIds.includes(sentenceId),
      current_score: score ? parseFloat(String(score.accumulated_score)) : 0,
      mastery_level_code: score?.mastery_level_type_id
        ? masteryCodeMap.get(score.mastery_level_type_id) || null
        : null,
      mastery_level_name: score?.mastery_level_type_id
        ? masteryNameMap.get(score.mastery_level_type_id) || null
        : null,
    });
  }

  // 9. Shuffle and limit to 50
  const shuffled = cards.sort(() => Math.random() - 0.5).slice(0, 50);

  // 10. Skill metadata
  const progress = progressMap.get(currentSkill.id);
  const currentSkillSentences = await db.sentences
    .where('skill_id')
    .equals(currentSkill.id)
    .count();
  const skillUpRatio = await getSkillUpRatio();

  return {
    cards: shuffled,
    skill: {
      id: currentSkill.id,
      skill_name: currentSkill.skill_name,
      achievement_score: progress ? parseFloat(String(progress.achievement_score)) : 0,
      total_score: currentSkillSentences * 8,
      skill_up_ratio: skillUpRatio,
      is_cleared: progress?.is_cleared || false,
      tense_type_code: currentSkill.tense_type_code || null,
      tense_type_name: currentSkill.tense_type_code
        ? typeNameMap.get(currentSkill.tense_type_code) || currentSkill.tense_type_code
        : null,
      pattern_type_code: currentSkill.pattern_type_code || null,
      pattern_type_name: currentSkill.pattern_type_code
        ? typeNameMap.get(currentSkill.pattern_type_code) || currentSkill.pattern_type_code
        : null,
    },
    level: currentLevel,
    level_summary: level.level_summary || null,
    debug: {
      daily_goal_minutes: dailyGoalMinutes,
      daily_goal_type_name: dailyGoalTypeName,
      min_check_count: minCheckCount,
      local_sentence_count: sentenceIds.length,
      session_sentence_count: shuffled.length,
    },
  };
}
