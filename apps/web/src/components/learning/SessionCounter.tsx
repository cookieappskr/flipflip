'use client';

interface SessionCounterProps {
  current: number;
  total: number;
}

export default function SessionCounter({ current, total }: SessionCounterProps) {
  return (
    <span className="text-sm font-medium text-text-secondary">
      <span className="text-primary-600 font-bold">{current}</span>
      <span className="mx-0.5">/</span>
      <span>{total}</span>
    </span>
  );
}
