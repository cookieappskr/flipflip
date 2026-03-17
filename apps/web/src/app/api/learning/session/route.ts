import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';

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

export async function GET() {
  const supabase = createSupabase();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  // Get user profile
  const { data: profile } = await supabase
    .from('user_profiles')
    .select('current_level, mother_tongue, learning_language, daily_goal_type_id')
    .eq('user_id', user.id)
    .single();

  if (!profile) {
    return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
  }

  const learningLanguage = (profile.learning_language || 'en').toUpperCase();

  // Get daily goal info (minimum check count)
  let minCheckCount = 10; // default
  let dailyGoalMinutes = 5; // default
  let dailyGoalTypeName = '기본값 (미설정)';
  if (profile.daily_goal_type_id) {
    const { data: goalType } = await supabase
      .from('types')
      .select('type_name, value, extra_attr_1')
      .eq('id', profile.daily_goal_type_id)
      .single();
    if (goalType) {
      dailyGoalMinutes = parseInt(goalType.value || '5', 10);
      minCheckCount = parseInt(goalType.extra_attr_1 || '10', 10);
      dailyGoalTypeName = goalType.type_name || `${dailyGoalMinutes}분`;
    }
  }

  // Get current level
  const { data: level } = await supabase
    .from('levels')
    .select('id, level_summary')
    .eq('level_number', profile.current_level)
    .single();

  if (!level) {
    return NextResponse.json({ error: 'Level not found' }, { status: 404 });
  }

  // Get skills for current level
  const { data: skills } = await supabase
    .from('skills')
    .select('id, skill_name, display_order, tense_type_code, pattern_type_code')
    .eq('level_id', level.id)
    .order('display_order');

  // Resolve type_code → type_name for tense and pattern
  const typeCodes = (skills || [])
    .flatMap((s) => [s.tense_type_code, s.pattern_type_code])
    .filter(Boolean) as string[];

  let typeNameMap = new Map<string, string>();
  if (typeCodes.length > 0) {
    const { data: typeRows } = await supabase
      .from('types')
      .select('type_code, type_name')
      .in('type_code', [...new Set(typeCodes)]);
    typeNameMap = new Map((typeRows || []).map((t) => [t.type_code, t.type_name]));
  }

  if (!skills?.length) {
    return NextResponse.json({ cards: [], skill: null });
  }

  // Find current skill (first uncleared, or first)
  const { data: progressList } = await supabase
    .from('user_learning_progress')
    .select('skill_id, is_cleared, achievement_score')
    .eq('user_id', user.id)
    .in('skill_id', skills.map((s) => s.id));

  const progressMap = new Map((progressList || []).map((p) => [p.skill_id, p]));
  const currentSkill = skills.find((s) => !progressMap.get(s.id)?.is_cleared) || skills[0];
  const currentSkillIndex = skills.findIndex((s) => s.id === currentSkill.id);

  // Get sentences from current skill
  const { data: allSentences } = await supabase
    .from('sentences')
    .select('id, meaning, skill_id')
    .eq('skill_id', currentSkill.id);

  let sentenceIds = (allSentences || []).map((s) => s.id);
  let allFetchedSentences = [...(allSentences || [])];

  // If current skill sentences < minCheckCount, add next skills' sentences
  if (sentenceIds.length < minCheckCount && currentSkillIndex < skills.length - 1) {
    for (let i = currentSkillIndex + 1; i < skills.length; i++) {
      if (sentenceIds.length >= minCheckCount) break;

      const { data: nextSentences } = await supabase
        .from('sentences')
        .select('id, meaning, skill_id')
        .eq('skill_id', skills[i].id);

      if (nextSentences?.length) {
        allFetchedSentences = [...allFetchedSentences, ...nextSentences];
        sentenceIds = allFetchedSentences.map((s) => s.id);
      }
    }
  }

  // Get existing scores
  const { data: existingScores } = await supabase
    .from('user_sentence_scores')
    .select('sentence_id, accumulated_score, mastery_level_type_id, mastery_score')
    .eq('user_id', user.id)
    .in('sentence_id', sentenceIds);

  const scoreMap = new Map((existingScores || []).map((s) => [s.sentence_id, s]));

  // Get mastery level codes
  const { data: masteryParent } = await supabase
    .from('types')
    .select('id')
    .eq('type_code', 'MASTERY_LEVEL')
    .is('parent_id', null)
    .single();

  const { data: masteryTypes } = await supabase
    .from('types')
    .select('id, type_code')
    .eq('parent_id', masteryParent!.id);

  const masteryCodeMap = new Map((masteryTypes || []).map((t) => [t.id, t.type_code]));

  const newSentenceIds = sentenceIds.filter((id) => !scoreMap.has(id));

  // REVIEW SENTENCES: next_review_at <= now
  const { data: reviewScores } = await supabase
    .from('user_sentence_scores')
    .select('sentence_id, accumulated_score, mastery_level_type_id, mastery_score')
    .eq('user_id', user.id)
    .lte('next_review_at', new Date().toISOString())
    .limit(30);

  const reviewSentenceIds = (reviewScores || []).map((s) => s.sentence_id);
  const reviewScoreMap = new Map((reviewScores || []).map((s) => [s.sentence_id, s]));

  // Combine all sentence IDs we need
  let allNeededIds = [...new Set([...newSentenceIds, ...reviewSentenceIds])];

  // Fallback: if no new or review sentences, include ALL current skill sentences
  if (allNeededIds.length === 0 && sentenceIds.length > 0) {
    allNeededIds = sentenceIds;
  }

  // Fetch sentences + expressions
  let combinedSentences: any[] = [];
  if (allNeededIds.length > 0) {
    const { data: sentences } = await supabase
      .from('sentences')
      .select('id, meaning, skill_id')
      .in('id', allNeededIds);

    const { data: expressions } = await supabase
      .from('expressions')
      .select('sentence_id, expression_text, hint')
      .in('sentence_id', allNeededIds)
      .eq('language_code', learningLanguage);

    const expressionMap = new Map((expressions || []).map((e) => [e.sentence_id, e]));

    const skillIds = [...new Set((sentences || []).map((s) => s.skill_id))];
    const { data: sentenceSkills } = await supabase
      .from('skills')
      .select('id, skill_name')
      .in('id', skillIds);

    const skillNameMap = new Map((sentenceSkills || []).map((s) => [s.id, s.skill_name]));

    combinedSentences = (sentences || []).map((s) => {
      const score = scoreMap.get(s.id) || reviewScoreMap.get(s.id);
      const expr = expressionMap.get(s.id);
      const isReview = reviewSentenceIds.includes(s.id);

      return {
        sentence_id: s.id,
        meaning: s.meaning || '',
        expression: expr?.expression_text || '',
        hint: expr?.hint || null,
        skill_name: skillNameMap.get(s.skill_id) || currentSkill.skill_name,
        skill_id: s.skill_id,
        is_review: isReview,
        current_score: score ? parseFloat(String(score.accumulated_score)) : 0,
        mastery_level_code: score?.mastery_level_type_id
          ? masteryCodeMap.get(score.mastery_level_type_id) || null
          : null,
      };
    });
  }

  // Shuffle and limit to 50
  const shuffled = combinedSentences.sort(() => Math.random() - 0.5).slice(0, 50);

  // Skill info
  const progress = progressMap.get(currentSkill.id);
  const currentSkillSentenceCount = (allSentences || []).length;

  return NextResponse.json({
    cards: shuffled,
    skill: {
      id: currentSkill.id,
      skill_name: currentSkill.skill_name,
      achievement_score: progress ? parseFloat(String(progress.achievement_score)) : 0,
      total_score: currentSkillSentenceCount * 8,
      is_cleared: progress?.is_cleared || false,
      tense_type_code: currentSkill.tense_type_code || null,
      tense_type_name: currentSkill.tense_type_code ? typeNameMap.get(currentSkill.tense_type_code) || currentSkill.tense_type_code : null,
      pattern_type_code: currentSkill.pattern_type_code || null,
      pattern_type_name: currentSkill.pattern_type_code ? typeNameMap.get(currentSkill.pattern_type_code) || currentSkill.pattern_type_code : null,
    },
    level: profile.current_level,
    level_summary: level.level_summary || null,
    // Debug/verification data
    debug: {
      daily_goal_minutes: dailyGoalMinutes,
      daily_goal_type_name: dailyGoalTypeName,
      min_check_count: minCheckCount,
      local_sentence_count: sentenceIds.length,
      session_sentence_count: shuffled.length,
    },
  });
}
