'use client';

import { useState, useMemo } from 'react';

interface MonthCalendarProps {
  completedDays: string[]; // ISO date strings
}

function getDaysInMonth(year: number, month: number): Date[] {
  const days: Date[] = [];
  const d = new Date(year, month, 1);
  while (d.getMonth() === month) {
    days.push(new Date(d));
    d.setDate(d.getDate() + 1);
  }
  return days;
}

const MONTH_NAMES = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
const DAY_HEADERS = ['일', '월', '화', '수', '목', '금', '토'];

export default function MonthCalendar({ completedDays }: MonthCalendarProps) {
  const today = new Date();
  const [year, setYear] = useState(today.getFullYear());
  const [month, setMonth] = useState(today.getMonth());

  const completedSet = useMemo(() => new Set(completedDays), [completedDays]);
  const todayKey = today.toISOString().split('T')[0];

  const days = useMemo(() => getDaysInMonth(year, month), [year, month]);
  const firstDayOfWeek = days[0].getDay();

  const prevMonth = () => {
    if (month === 0) {
      setYear(year - 1);
      setMonth(11);
    } else {
      setMonth(month - 1);
    }
  };

  const nextMonth = () => {
    if (month === 11) {
      setYear(year + 1);
      setMonth(0);
    } else {
      setMonth(month + 1);
    }
  };

  return (
    <div className="bg-surface rounded-2xl shadow-sm p-4">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <button onClick={prevMonth} className="p-1 rounded-lg hover:bg-neutral-100 text-text-secondary">
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M15 19l-7-7 7-7" />
          </svg>
        </button>
        <h2 className="text-base font-semibold text-text-primary">
          {year}년 {MONTH_NAMES[month]}
        </h2>
        <button onClick={nextMonth} className="p-1 rounded-lg hover:bg-neutral-100 text-text-secondary">
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M9 5l7 7-7 7" />
          </svg>
        </button>
      </div>

      {/* Day headers */}
      <div className="grid grid-cols-7 gap-1 mb-1">
        {DAY_HEADERS.map((d) => (
          <div key={d} className="text-center text-xs text-text-secondary font-medium py-1">
            {d}
          </div>
        ))}
      </div>

      {/* Days grid */}
      <div className="grid grid-cols-7 gap-1">
        {/* Empty cells before first day */}
        {Array.from({ length: firstDayOfWeek }).map((_, i) => (
          <div key={`empty-${i}`} />
        ))}

        {days.map((date) => {
          const key = date.toISOString().split('T')[0];
          const isCompleted = completedSet.has(key);
          const isToday = key === todayKey;
          const isFuture = key > todayKey;

          return (
            <div
              key={key}
              className={[
                'aspect-square flex items-center justify-center rounded-full text-xs font-medium',
                isCompleted
                  ? 'bg-success text-white'
                  : isToday
                  ? 'ring-2 ring-primary-500 text-primary-600'
                  : isFuture
                  ? 'text-neutral-400'
                  : 'text-text-secondary',
              ].join(' ')}
            >
              {date.getDate()}
            </div>
          );
        })}
      </div>

      {/* Legend */}
      <div className="flex items-center justify-center gap-4 mt-4 text-xs text-text-secondary">
        <div className="flex items-center gap-1">
          <div className="w-3 h-3 rounded-full bg-success" />
          <span>완료</span>
        </div>
        <div className="flex items-center gap-1">
          <div className="w-3 h-3 rounded-full ring-2 ring-primary-500" />
          <span>오늘</span>
        </div>
      </div>
    </div>
  );
}
