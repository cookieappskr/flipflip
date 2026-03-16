import { createServerClient, type CookieOptions } from '@supabase/ssr';
import { cookies } from 'next/headers';
import { NextResponse, type NextRequest } from 'next/server';

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

/**
 * GET /api/learning/download?level=N&skill_ids=id1,id2 (optional)
 *
 * Downloads all data for a given level (or specific skills within it)
 * for offline-first local DB storage.
 */
export async function GET(request: NextRequest) {
  const supabase = createSupabase();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const levelNumber = parseInt(searchParams.get('level') || '0', 10);
  const skillIdsParam = searchParams.get('skill_ids');

  if (!levelNumber) {
    return NextResponse.json({ error: 'Missing level parameter' }, { status: 400 });
  }

  // 1. Get level
  const { data: level } = await supabase
    .from('levels')
    .select('*')
    .eq('level_number', levelNumber)
    .single();

  if (!level) {
    return NextResponse.json({ error: 'Level not found' }, { status: 404 });
  }

  // 2. Get skills (all or filtered)
  let skillQuery = supabase
    .from('skills')
    .select('*')
    .eq('level_id', level.id)
    .order('display_order');

  if (skillIdsParam) {
    const skillIds = skillIdsParam.split(',').filter(Boolean);
    skillQuery = skillQuery.in('id', skillIds);
  }

  const { data: skills } = await skillQuery;
  if (!skills?.length) {
    return NextResponse.json({
      level,
      skills: [],
      sentences: [],
      expressions: [],
      types: [],
      policy_settings: [],
      user_scores: [],
      user_progress: [],
      user_profile: null,
    });
  }

  const skillIds = skills.map((s) => s.id);

  // 3. Get sentences for these skills
  const { data: sentences } = await supabase
    .from('sentences')
    .select('*')
    .in('skill_id', skillIds);

  const sentenceIds = (sentences || []).map((s) => s.id);

  // 4. Get expressions for these sentences
  const { data: expressions } = sentenceIds.length > 0
    ? await supabase
        .from('expressions')
        .select('*')
        .in('sentence_id', sentenceIds)
    : { data: [] };

  // 5. Get types (CHECK_TYPE children + MASTERY_LEVEL children + referenced type codes)
  const { data: typeParents } = await supabase
    .from('types')
    .select('id, type_code')
    .in('type_code', ['CHECK_TYPE', 'MASTERY_LEVEL'])
    .is('parent_id', null);

  const parentIds = (typeParents || []).map((t) => t.id);
  const { data: typeChildren } = parentIds.length > 0
    ? await supabase
        .from('types')
        .select('*')
        .in('parent_id', parentIds)
        .eq('is_active', true)
    : { data: [] };

  // Also fetch tense/pattern type codes used by skills
  const typeCodes = skills
    .flatMap((s) => [s.tense_type_code, s.pattern_type_code])
    .filter(Boolean) as string[];

  let typeCodeRows: typeof typeChildren = [];
  if (typeCodes.length > 0) {
    const { data } = await supabase
      .from('types')
      .select('*')
      .in('type_code', [...new Set(typeCodes)]);
    typeCodeRows = data || [];
  }

  // Also fetch daily goal types
  const { data: profile } = await supabase
    .from('user_profiles')
    .select('*')
    .eq('user_id', user.id)
    .single();

  let goalType: typeof typeChildren = [];
  if (profile?.daily_goal_type_id) {
    const { data } = await supabase
      .from('types')
      .select('*')
      .eq('id', profile.daily_goal_type_id);
    goalType = data || [];
  }

  const allTypes = [
    ...(typeParents || []).map((t) => ({ ...t, parent_id: null })),
    ...(typeChildren || []),
    ...(typeCodeRows || []),
    ...(goalType || []),
  ];

  // Deduplicate types by id
  const typeMap = new Map(allTypes.map((t) => [t.id, t]));
  const types = Array.from(typeMap.values());

  // 6. Get policy settings
  const { data: policySettings } = await supabase
    .from('policy_settings')
    .select('*');

  // 7. Get user scores for these sentences
  const { data: userScores } = sentenceIds.length > 0
    ? await supabase
        .from('user_sentence_scores')
        .select('*')
        .eq('user_id', user.id)
        .in('sentence_id', sentenceIds)
    : { data: [] };

  // 8. Get user learning progress for these skills
  const { data: userProgress } = await supabase
    .from('user_learning_progress')
    .select('*')
    .eq('user_id', user.id)
    .in('skill_id', skillIds);

  return NextResponse.json({
    level,
    skills: skills || [],
    sentences: sentences || [],
    expressions: expressions || [],
    types,
    policy_settings: policySettings || [],
    user_scores: userScores || [],
    user_progress: userProgress || [],
    user_profile: profile,
  });
}
