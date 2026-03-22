'use client';

import type { CheckType } from '@/types/database';

interface CheckButtonsProps {
  onCheck: (type: CheckType) => void;
  disabled?: boolean;
  labels?: {
    MISSED?: string;
    MOSTLY?: string;
    PERFECT?: string;
  };
}

// Keyboard keycap-style icon
function KeyCap({ label, className = '' }: { label: string; className?: string }) {
  return (
    <span
      className={`inline-flex items-center justify-center w-6 h-5 rounded border text-[10px] font-mono font-bold leading-none shadow-[0_1px_0_1px] ${className}`}
    >
      {label}
    </span>
  );
}

export default function CheckButtons({ onCheck, disabled, labels }: CheckButtonsProps) {
  const missedLabel = labels?.MISSED || '못맞춤';
  const mostlyLabel = labels?.MOSTLY || '대부분맞춤';
  const perfectLabel = labels?.PERFECT || '완벽히맞춤';

  return (
    <div className="grid grid-cols-3 gap-2" role="group" aria-label="학습 체크">
      <button
        onClick={() => onCheck('MISSED')}
        disabled={disabled}
        aria-label={`${missedLabel} (← 키)`}
        className="py-3 rounded-xl bg-red-400/80 hover:bg-red-400 text-white font-medium text-sm transition-all disabled:opacity-50 active:scale-95 touch-target"
      >
        <div className="flex flex-col items-center gap-1">
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span>{missedLabel}</span>
          <KeyCap label="←" className="border-red-300/60 text-white/80 shadow-red-500/30" />
        </div>
      </button>
      <button
        onClick={() => onCheck('MOSTLY')}
        disabled={disabled}
        aria-label={`${mostlyLabel} (↓ 키)`}
        className="py-3 rounded-xl bg-amber-400/80 hover:bg-amber-400 text-white font-medium text-sm transition-all disabled:opacity-50 active:scale-95 touch-target"
      >
        <div className="flex flex-col items-center gap-1">
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
          </svg>
          <span>{mostlyLabel}</span>
          <KeyCap label="↓" className="border-amber-300/60 text-white/80 shadow-amber-500/30" />
        </div>
      </button>
      <button
        onClick={() => onCheck('PERFECT')}
        disabled={disabled}
        aria-label={`${perfectLabel} (→ 키)`}
        className="py-3 rounded-xl bg-emerald-400/80 hover:bg-emerald-400 text-white font-medium text-sm transition-all disabled:opacity-50 active:scale-95 touch-target"
      >
        <div className="flex flex-col items-center gap-1">
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span>{perfectLabel}</span>
          <KeyCap label="→" className="border-emerald-300/60 text-white/80 shadow-emerald-500/30" />
        </div>
      </button>
    </div>
  );
}
