export const PLANS = {
  monthly: { name: '월간 구독', amount: 1900, period: 'monthly' as const, intervalDays: 30 },
  yearly: { name: '연간 구독', amount: 11400, period: 'yearly' as const, intervalDays: 365 },
} as const;

export const FREE_TRIAL_DAYS = 30;
export const REFUND_PERIOD_DAYS = 7;
export const RENEWAL_NOTIFICATION_DAYS = 3;
export const DAILY_SENTENCE_LIMIT_FREE = 10;
