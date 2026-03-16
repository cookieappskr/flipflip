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

interface SyncPayload {
  scores: Array<Record<string, unknown>>;
  progress: Array<Record<string, unknown>>;
  profile_updates: { current_level: number } | null;
}

/**
 * POST /api/learning/sync
 *
 * Batch sync endpoint for local-first data.
 * Conflict resolution: Last Write Wins (based on updated_at).
 */
export async function POST(request: Request) {
  const supabase = createSupabase();

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body: SyncPayload = await request.json();
  const { scores = [], progress = [], profile_updates } = body;

  const syncedScores: string[] = [];
  const syncedProgress: string[] = [];
  const conflicts: Array<{ table: string; id: string; reason: string }> = [];

  // Sync scores
  for (const score of scores) {
    try {
      const id = score.id as string;
      const { data: existing } = await supabase
        .from('user_sentence_scores')
        .select('id, updated_at')
        .eq('id', id)
        .single();

      if (existing) {
        // Last Write Wins: only update if local is newer
        const remoteUpdated = existing.updated_at ? new Date(existing.updated_at).getTime() : 0;
        const localUpdated = score.last_checked_at ? new Date(score.last_checked_at as string).getTime() : Date.now();

        if (localUpdated >= remoteUpdated) {
          await supabase
            .from('user_sentence_scores')
            .update({
              accumulated_score: score.accumulated_score,
              mastery_level_type_id: score.mastery_level_type_id,
              mastery_score: score.mastery_score,
              next_review_at: score.next_review_at,
              last_checked_at: score.last_checked_at,
              check_count: score.check_count,
            })
            .eq('id', id);
          syncedScores.push(id);
        } else {
          conflicts.push({ table: 'user_sentence_scores', id, reason: 'remote_newer' });
        }
      } else {
        await supabase.from('user_sentence_scores').insert({
          id,
          user_id: user.id,
          sentence_id: score.sentence_id,
          accumulated_score: score.accumulated_score,
          mastery_level_type_id: score.mastery_level_type_id,
          mastery_score: score.mastery_score,
          next_review_at: score.next_review_at,
          last_checked_at: score.last_checked_at,
          check_count: score.check_count,
        });
        syncedScores.push(id);
      }
    } catch {
      conflicts.push({
        table: 'user_sentence_scores',
        id: score.id as string,
        reason: 'error',
      });
    }
  }

  // Sync progress
  for (const prog of progress) {
    try {
      const id = prog.id as string;
      const { data: existing } = await supabase
        .from('user_learning_progress')
        .select('id, updated_at')
        .eq('id', id)
        .single();

      if (existing) {
        const remoteUpdated = existing.updated_at ? new Date(existing.updated_at).getTime() : 0;
        const localCleared = prog.cleared_at ? new Date(prog.cleared_at as string).getTime() : Date.now();

        if (localCleared >= remoteUpdated) {
          await supabase
            .from('user_learning_progress')
            .update({
              achievement_score: prog.achievement_score,
              is_cleared: prog.is_cleared,
              cleared_at: prog.cleared_at,
            })
            .eq('id', id);
          syncedProgress.push(id);
        } else {
          conflicts.push({ table: 'user_learning_progress', id, reason: 'remote_newer' });
        }
      } else {
        await supabase.from('user_learning_progress').insert({
          id,
          user_id: user.id,
          skill_id: prog.skill_id,
          achievement_score: prog.achievement_score,
          is_cleared: prog.is_cleared,
          cleared_at: prog.cleared_at,
        });
        syncedProgress.push(id);
      }
    } catch {
      conflicts.push({
        table: 'user_learning_progress',
        id: prog.id as string,
        reason: 'error',
      });
    }
  }

  // Sync profile updates
  if (profile_updates) {
    await supabase
      .from('user_profiles')
      .update({ current_level: profile_updates.current_level })
      .eq('user_id', user.id);
  }

  return NextResponse.json({
    synced_scores: syncedScores.length,
    synced_progress: syncedProgress.length,
    conflicts,
  });
}
