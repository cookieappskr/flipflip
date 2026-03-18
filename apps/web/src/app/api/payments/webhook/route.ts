import { NextRequest, NextResponse } from 'next/server';
import { createAdminClient } from '@/lib/supabase/admin';
import { sendSlackAlert } from '@/lib/slack';

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { eventType, data } = body;

    const admin = createAdminClient();

    if (eventType === 'PAYMENT_STATUS_CHANGED') {
      const paymentKey = data.paymentKey;
      const status = data.status; // DONE, CANCELED, etc.

      if (status === 'DONE') {
        await admin.from('payment_history')
          .update({ status: 'paid', paid_at: new Date().toISOString() })
          .eq('payment_key', paymentKey);
      } else if (status === 'CANCELED') {
        await admin.from('payment_history')
          .update({ status: 'refunded', refunded_at: new Date().toISOString() })
          .eq('payment_key', paymentKey);
        await sendSlackAlert(`결제 취소: ${paymentKey}`, 'warning', { paymentKey });
      } else if (status === 'ABORTED' || status === 'EXPIRED') {
        await sendSlackAlert(`결제 실패: ${paymentKey} (${status})`, 'error', { paymentKey, status });
      }
    }

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Webhook error:', error);
    await sendSlackAlert(`Webhook 처리 오류: ${String(error)}`, 'error').catch(() => {});
    return NextResponse.json({ success: true }); // Always return 200 to prevent retries
  }
}
