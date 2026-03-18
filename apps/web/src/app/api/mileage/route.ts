import { NextResponse } from 'next/server';
import { createServerSupabaseClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = createServerSupabaseClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  // Get current balance (latest transaction)
  const { data: lastTx } = await supabase
    .from('mileage_transactions')
    .select('balance_after')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(1)
    .single();

  // Get recent transactions
  const { data: transactions } = await supabase
    .from('mileage_transactions')
    .select('id, amount, balance_after, transaction_type, description, created_at')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(20);

  return NextResponse.json({
    balance: lastTx?.balance_after || 0,
    transactions: transactions || [],
  });
}
