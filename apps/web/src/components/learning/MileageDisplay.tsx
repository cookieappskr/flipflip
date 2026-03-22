'use client';

import { useEffect, useRef, useState } from 'react';

interface MileageDisplayProps {
  balance: number;
  onClick?: () => void;
}

export default function MileageDisplay({ balance, onClick }: MileageDisplayProps) {
  const prevBalanceRef = useRef(balance);
  const [animate, setAnimate] = useState(false);

  useEffect(() => {
    if (balance !== prevBalanceRef.current) {
      prevBalanceRef.current = balance;
      setAnimate(true);
      const timer = setTimeout(() => setAnimate(false), 600);
      return () => clearTimeout(timer);
    }
  }, [balance]);

  return (
    <button
      onClick={onClick}
      className={[
        'inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full border text-sm font-medium transition-all duration-300',
        animate
          ? 'bg-amber-100 border-amber-400 text-amber-800 scale-110'
          : 'bg-amber-50 border-amber-200 text-amber-700 scale-100 hover:bg-amber-100',
      ].join(' ')}
      aria-label={`마일리지 ${balance}포인트`}
    >
      <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
      </svg>
      <span className={animate ? 'font-bold' : ''}>
        {balance.toLocaleString()}pt
      </span>
    </button>
  );
}
