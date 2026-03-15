import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';
import {
  calculateAccumulatedScore,
  determineMasteryLevel,
  calculateNextReviewAt,
  calculateSkillAchievement,
  calculateSkillTotalScore,
  checkSkillUp,
  checkLevelUp,
  type MasteryLevel,
} from '@/lib/utils/scoring';

function createSupabase() {
  const cookieStore = cookies();
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() { return cookieStore.getAll(); },
        setAll(cookiesToSet: { name: string; value: string; options: CookieOptions }[]) {
          try { cookiesToSet.forEach(({ name, value, options }) => cookieStore.set(name, value, options)); } catch {}
        },
      },
    }
  );
}

export async function POST(request: Request) {
  const supabase = createSupabase();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { sentence_id, check_type_code } = body;

  if (!sentence_id || !check_type_code) {
    return NextResponse.json({ error: 'Missing required fields' }, { status: 400 });
  }

  // 1. Get check type value
  const { data: checkTypeParent } = await supabase
    .from('types')
    .select('id')
    .eq('type_code', 'CHECK_TYPE')
    .is('parent_id', null)
    .single();

  const { data: checkType } = await supabase
    .from('types')
    .select('value')
    .eq('type_code', check_type_code)
    .eq('parent_id', checkTypeParent!.id)
    .single();

  if (!checkType) {
    return NextResponse.json({ error: 'Invalid check type' }, { status: 400 });
  }

  const checkScore = parseFloat(checkType.value || '0');

  // 2. Get mastery levels
  const { data: masteryParent } = await supabase
    .from('types')
    .select('id')
    .eq('type_code', 'MASTERY_LEVEL')
    .is('parent_id', null)
    .single();

  const { data: masteryTypes } = await supabase
    .from('types')
    .select('id, type_code, value, extra_attr_1, display_order')
    .eq('parent_id', masteryParent!.id)
    .eq('is_active', true)
    .order('display_order');

  const masteryLevels: MasteryLevel[] = (masteryTypes || []).map((t) => ({
    type_id: t.id,
    code: t.type_code as MasteryLevel['code'],
    base_score: parseFloat(t.value || '0'),
    interval_minutes: parseInt(t.extra_attr_1 || '30', 10),
    display_order: t.display_order,
  }));

  // 3. Get or create user_sentence_score
  let { data: sentenceScore } = await supabase
    .from('user_sentence_scores')
    .select('*')
    .eq('user_id', user.id)
    .eq('sentence_id', sentence_id)
    .single();

  const oldScore = sentenceScore ? parseFloat(String(sentenceScore.accumulated_score)) : 0;
  const newAccumulatedScore = calculateAccumulatedScore(oldScore, checkScore);
  const newMastery = determineMasteryLevel(newAccumulatedScore, masteryLevels);
  const nextReviewAt = calculateNextReviewAt(newMastery.interval_minutes);

  // 4. Upsert user_sentence_scores
  if (sentenceScore) {
    await supabase
      .from('user_sentence_scores')
      .update({
        accumulated_score: newAccumulatedScore,
        mastery_level_type_id: newMastery.type_id,
        mastery_score: newMastery.base_score,
        next_review_at: nextReviewAt.toISOString(),
        last_checked_at: new Date().toISOString(),
        check_count: (sentenceScore.check_count || 0) + 1,
      })
      .eq('id', sentenceScore.id);
  } else {
    await supabase
      .from('user_sentence_scores')
      .insert({
        user_id: user.id,
        sentence_id,
        accumulated_score: newAccumulatedScore,
        mastery_level_type_id: newMastery.type_id,
        mastery_score: newMastery.base_score,
        next_review_at: nextReviewAt.toISOString(),
        last_checked_at: new Date().toISOString(),
        check_count: 1,
      });
  }

  // 5. Get sentence's skill
  const { data: sentence } = await supabase
    .from('sentences')
    .select('skill_id')
    .eq('id', sentence_id)
    .single();

  if (!sentence) {
    return NextResponse.json({ error: 'Sentence not found' }, { status: 404 });
  }

  // 6. Recalculate skill achievement
  const { data: skillSentences } = await supabase
    .from('sentences')
    .select('id')
    .eq('skill_id', sentence.skill_id);

  const sentenceIds = (skillSentences || []).map((s) => s.id);

  const { data: allScores } = await supabase
    .from('user_sentence_scores')
    .select('mastery_score')
    .eq('user_id', user.id)
    .in('sentence_id', sentenceIds);

  const achievementScore = calculateSkillAchievement(
    (allScores || []).map((s) => ({ mastery_score: parseFloat(String(s.mastery_score)) }))
  );
  const totalScore = calculateSkillTotalScore(sentenceIds.length);

  // Get skill_up_ratio from policy
  const { data: policy } = await supabase
    .from('policy_settings')
    .select('value')
    .eq('key', 'skill_up_ratio')
    .single();

  const skillUpRatio = parseFloat(policy?.value || '80');
  const skillUp = checkSkillUp(achievementScore, totalScore, skillUpRatio);

  // Update user_learning_progress
  let { data: progress } = await supabase
    .from('user_learning_progress')
    .select('*')
    .eq('user_id', user.id)
    .eq('skill_id', sentence.skill_id)
    .single();

  const wasCleared = progress?.is_cleared || false;

  if (progress) {
    await supabase
      .from('user_learning_progress')
      .update({
        achievement_score: achievementScore,
        is_cleared: skillUp,
        cleared_at: skillUp && !wasCleared ? new Date().toISOString() : progress.cleared_at,
      })
      .eq('id', progress.id);
  } else {
    await supabase
      .from('user_learning_progress')
      .insert({
        user_id: user.id,
        skill_id: sentence.skill_id,
        achievement_score: achievementScore,
        is_cleared: skillUp,
        cleared_at: skillUp ? new Date().toISOString() : null,
      });
  }

  // 7. Check level-up
  let levelUp = false;
  let newLevel: number | null = null;

  if (skillUp && !wasCleared) {
    // Get the skill's level
    const { data: skill } = await supabase
      .from('skills')
      .select('level_id')
      .eq('id', sentence.skill_id)
      .single();

    if (skill) {
      // Get all skills in this level
      const { data: levelSkills } = await supabase
        .from('skills')
        .select('id')
        .eq('level_id', skill.level_id);

      const levelSkillIds = (levelSkills || []).map((s) => s.id);

      // Get user progress for all skills in this level
      const { data: allProgress } = await supabase
        .from('user_learning_progress')
        .select('skill_id, is_cleared')
        .eq('user_id', user.id)
        .in('skill_id', levelSkillIds);

      const progressMap = new Map((allProgress || []).map((p) => [p.skill_id, p.is_cleared]));

      const allCleared = levelSkillIds.every((id) => progressMap.get(id) === true);

      if (allCleared) {
        levelUp = true;

        // Get current level number
        const { data: level } = await supabase
          .from('levels')
          .select('level_number')
          .eq('id', skill.level_id)
          .single();

        if (level) {
          newLevel = level.level_number + 1;
          // Update user profile
          await supabase
            .from('user_profiles')
            .update({ current_level: newLevel })
            .eq('user_id', user.id);
        }
      }
    }
  }

  return NextResponse.json({
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
  });
}
