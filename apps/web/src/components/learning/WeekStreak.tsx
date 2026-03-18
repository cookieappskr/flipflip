'use client';

interface WeekStreakProps {
  completedDays: string[]; // ISO date strings of completed days this week
}

const DAY_LABELS = ['일', '월', '화', '수', '목', '금', '토'];

function getWeekDates(): Date[] {
  const today = new Date();
  const day = today.getDay(); // 0=Sun
  const dates: Date[] = [];
  for (let i = 0; i < 7; i++) {
    const d = new Date(today);
    d.setDate(today.getDate() - day + i);
    dates.push(d);
  }
  return dates;
}

function formatDateKey(d: Date): string {
  return d.toISOString().split('T')[0];
}

export default function WeekStreak({ completedDays }: WeekStreakProps) {
  const weekDates = getWeekDates();
  const today = formatDateKey(new Date());
  const completedSet = new Set(completedDays);

  return (
    <div className="w-full grid grid-cols-7 gap-1 px-6 py-2">
      {weekDates.map((date, i) => {
        const key = formatDateKey(date);
        const isToday = key === today;
        const isCompleted = completedSet.has(key);
        const isFuture = key > today;

        return (
          <div key={key} className="flex flex-col items-center">
            <span className="text-[11px] text-text-secondary mb-1">
              {DAY_LABELS[i]}
            </span>
            <div
              className={[
                'w-9 h-9 rounded-full flex items-center justify-center text-sm font-medium transition-colors',
                isCompleted
                  ? 'bg-success text-white'
                  : isToday
                  ? 'bg-primary-100 text-primary-700 ring-2 ring-primary-500'
                  : isFuture
                  ? 'bg-neutral-100 text-neutral-500'
                  : 'bg-neutral-200 text-neutral-500',
              ].join(' ')}
            >
              {isCompleted ? '✓' : date.getDate()}
            </div>
          </div>
        );
      })}
    </div>
  );
}
