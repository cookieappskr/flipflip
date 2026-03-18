import { NextRequest, NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';
import { sendSlackAlert } from '@/lib/slack';

/**
 * POST /api/alerts/slack
 * Server-side Slack notification endpoint.
 * Requires authentication (admin or service role).
 */
export async function POST(request: NextRequest) {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { message, level, details } = await request.json() as {
    message: string;
    level?: 'info' | 'warning' | 'error';
    details?: Record<string, string>;
  };

  if (!message) {
    return NextResponse.json({ error: 'Message required' }, { status: 400 });
  }

  await sendSlackAlert(message, level || 'info', details);

  return NextResponse.json({ success: true });
}
