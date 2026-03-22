import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

/**
 * GET /api/types/check-update?since=2026-03-22T00:00:00Z
 *
 * Returns types updated after `since` timestamp.
 * If no `since` param, returns all CHECK_TYPE and MASTERY_LEVEL types.
 * Used for lightweight cache invalidation on the client.
 */
export async function GET(request: NextRequest) {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const since = request.nextUrl.searchParams.get('since');

  // Get parent type IDs for CHECK_TYPE and MASTERY_LEVEL
  const { data: parents } = await supabase
    .from('types')
    .select('id, type_code')
    .in('type_code', ['CHECK_TYPE', 'MASTERY_LEVEL'])
    .is('parent_id', null);

  const parentIds = (parents || []).map((p) => p.id);
  if (parentIds.length === 0) {
    return NextResponse.json({ updated: false, types: [] });
  }

  // Check if any types were updated since the given timestamp
  let query = supabase
    .from('types')
    .select('*')
    .in('parent_id', parentIds)
    .eq('is_active', true);

  if (since) {
    query = query.gt('updated_at', since);
  }

  const { data: types } = await query;

  return NextResponse.json({
    updated: (types || []).length > 0,
    types: types || [],
  });
}
