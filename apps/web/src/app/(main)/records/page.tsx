'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import MonthCalendar from '@/components/learning/MonthCalendar';

export default function RecordsPage() {
  const [completedDays, setCompletedDays] = useState<string[]>([]);
  const [totalChecks, setTotalChecks] = useState(0);
  const [streak, setStreak] = useState(0);

  useEffect(() => {
    const fetchRecords = async () => {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;

      // Get all scores grouped by date
      const { data: scores } = await supabase
        .from('user_sentence_scores')
        .select('last_checked_at, check_count')
        .eq('user_id', user.id)
        .not('last_checked_at', 'is', null);

      if (!scores) return;

      // Count total checks
      const total = scores.reduce((sum, s) => sum + (s.check_count || 0), 0);
      setTotalChecks(total);

      // Extract unique dates
      const dateSet = new Set<string>();
      scores.forEach((s) => {
        if (s.last_checked_at) {
          dateSet.add(s.last_checked_at.split('T')[0]);
        }
      });

      const sortedDates = [...dateSet].sort();
      setCompletedDays(sortedDates);

      // Calculate streak (consecutive days ending today or yesterday)
      let streakCount = 0;
      const today = new Date().toISOString().split('T')[0];
      let checkDate = today;

      while (dateSet.has(checkDate)) {
        streakCount++;
        const d = new Date(checkDate);
        d.setDate(d.getDate() - 1);
        checkDate = d.toISOString().split('T')[0];
      }
      setStreak(streakCount);
    };

    fetchRecords();
  }, []);

  return (
    <div className="max-w-lg mx-auto px-4 py-6">
      <h1 className="text-xl font-bold text-text-primary mb-4">학습 기록</h1>

      {/* Stats */}
      <div className="grid grid-cols-2 gap-3 mb-6">
        <div className="bg-surface rounded-xl p-4 text-center shadow-sm">
          <p className="text-2xl font-bold text-primary-600">{streak}</p>
          <p className="text-xs text-text-secondary mt-1">연속 학습일</p>
        </div>
        <div className="bg-surface rounded-xl p-4 text-center shadow-sm">
          <p className="text-2xl font-bold text-primary-600">{totalChecks}</p>
          <p className="text-xs text-text-secondary mt-1">총 학습 문장수</p>
        </div>
      </div>

      {/* Calendar */}
      <MonthCalendar completedDays={completedDays} />
    </div>
  );
}
