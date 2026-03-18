'use client';

import { useState, useEffect, useCallback } from 'react';
import type { Subscription } from '@/types/database';

interface SubscriptionState {
  subscription: (Subscription & { effective_status: string }) | null;
  payments: Array<{
    id: string;
    amount: number;
    status: string;
    paid_at: string | null;
    receipt_url: string | null;
  }>;
  loading: boolean;
  error: string | null;
}

export function useSubscription() {
  const [state, setState] = useState<SubscriptionState>({
    subscription: null,
    payments: [],
    loading: true,
    error: null,
  });

  const fetchStatus = useCallback(async () => {
    setState((prev) => ({ ...prev, loading: true, error: null }));
    try {
      const res = await fetch('/api/payments/status');
      if (!res.ok) throw new Error('Failed to fetch');
      const data = await res.json();
      setState({
        subscription: data.subscription,
        payments: data.payments,
        loading: false,
        error: null,
      });
    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Unknown error';
      setState((prev) => ({ ...prev, loading: false, error: message }));
    }
  }, []);

  useEffect(() => {
    fetchStatus();
  }, [fetchStatus]);

  const cancel = useCallback(
    async (subscriptionId: string) => {
      const res = await fetch('/api/payments/cancel', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ subscriptionId }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Cancel failed');
      }
      await fetchStatus();
    },
    [fetchStatus],
  );

  const refund = useCallback(
    async (subscriptionId: string) => {
      const res = await fetch('/api/payments/refund', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ subscriptionId }),
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Refund failed');
      }
      await fetchStatus();
    },
    [fetchStatus],
  );

  return { ...state, fetchStatus, cancel, refund };
}
