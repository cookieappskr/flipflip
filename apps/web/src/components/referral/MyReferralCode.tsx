'use client';

import { useEffect, useState } from 'react';
import Button from '@/components/core/Button';

interface ReferralStatus {
  referralCode: string;
  referralCount: number;
  maxReferrals: number;
  referredUsers: string[];
}

export default function MyReferralCode() {
  const [status, setStatus] = useState<ReferralStatus | null>(null);
  const [copied, setCopied] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchStatus = async () => {
      try {
        const res = await fetch('/api/referral/status');
        if (res.ok) {
          const data = await res.json();
          setStatus(data);
        }
      } catch {
        // Silently fail - referral section is non-critical
      } finally {
        setLoading(false);
      }
    };

    fetchStatus();
  }, []);

  const handleCopy = async () => {
    if (!status?.referralCode) return;
    try {
      await navigator.clipboard.writeText(status.referralCode);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      // Fallback for older browsers
      const textarea = document.createElement('textarea');
      textarea.value = status.referralCode;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand('copy');
      document.body.removeChild(textarea);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    }
  };

  if (loading) {
    return (
      <div className="bg-surface rounded-2xl shadow-sm p-4 animate-pulse">
        <div className="h-4 bg-neutral-200 rounded w-1/3 mb-2" />
        <div className="h-6 bg-neutral-200 rounded w-2/3" />
      </div>
    );
  }

  if (!status) return null;

  return (
    <div className="bg-surface rounded-2xl shadow-sm p-4">
      <div className="flex items-center justify-between mb-3">
        <div>
          <p className="text-sm font-medium text-text-primary">내 추천 코드</p>
          <p className="text-lg font-bold text-primary-600">{status.referralCode}</p>
        </div>
        <Button variant="secondary" size="sm" onClick={handleCopy}>
          {copied ? '복사됨!' : '복사'}
        </Button>
      </div>

      <div className="border-t border-border pt-3">
        <p className="text-sm text-text-secondary mb-2">
          추천 현황: <span className="font-semibold text-text-primary">{status.referralCount}</span> / {status.maxReferrals}명
        </p>

        {status.referredUsers.length > 0 && (
          <div className="space-y-1">
            {status.referredUsers.map((nickname) => (
              <div
                key={nickname}
                className="flex items-center gap-2 text-sm text-text-secondary"
              >
                <span className="w-1.5 h-1.5 rounded-full bg-primary-400" />
                {nickname}
              </div>
            ))}
          </div>
        )}

        {status.referralCount === 0 && (
          <p className="text-xs text-text-secondary">
            친구를 추천하면 서로 1주일 무료 이용권을 받아요!
          </p>
        )}
      </div>
    </div>
  );
}
