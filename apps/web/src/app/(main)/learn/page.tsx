'use client';

import { useEffect, useCallback, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useLearning } from '@/lib/hooks/useLearning';
import { useTheme } from '@/components/layout/ThemeProvider';
import FlipCard from '@/components/learning/FlipCard';
import CheckButtons from '@/components/learning/CheckButtons';
import SkillGauge from '@/components/learning/SkillGauge';
import WeekStreak from '@/components/learning/WeekStreak';
import SessionCounter from '@/components/learning/SessionCounter';
import SkillUpPopup from '@/components/learning/SkillUpPopup';
import LevelUpPopup from '@/components/learning/LevelUpPopup';
import SwipeGuide from '@/components/learning/SwipeGuide';
import Button from '@/components/core/Button';
import type { CheckType } from '@/types/database';

export default function LearnPage() {
  const router = useRouter();
  const {
    cards,
    currentIndex,
    currentCard,
    revealed,
    skill,
    level,
    levelSummary,
    loading,
    loadingProgress,
    submitting,
    skillUpPopup,
    levelUpPopup,
    sessionComplete,
    todayCheckCount,
    debug,
    lastScoreResult,
    reveal,
    submitCheck,
    loadSession,
    closeSkillUpPopup,
    closeLevelUpPopup,
  } = useLearning();

  const { theme, toggleTheme } = useTheme();

  // Swipe guide — show on first visit
  const [showGuide, setShowGuide] = useState(false);

  useEffect(() => {
    if (!localStorage.getItem('swipe_guide_seen')) {
      setShowGuide(true);
    }
  }, []);

  const closeGuide = () => {
    setShowGuide(false);
    localStorage.setItem('swipe_guide_seen', 'true');
  };

  // Keyboard shortcuts
  const handleKeyDown = useCallback(
    (e: KeyboardEvent) => {
      if (skillUpPopup.show || levelUpPopup.show || showGuide) return;

      if (e.key === 'ArrowUp' || e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        reveal();
        return;
      }

      if (!revealed) return;

      const keyMap: Record<string, CheckType> = {
        ArrowLeft: 'MISSED',
        ArrowDown: 'MOSTLY',
        ArrowRight: 'PERFECT',
      };

      const checkType = keyMap[e.key];
      if (checkType) {
        e.preventDefault();
        submitCheck(checkType);
      }
    },
    [revealed, reveal, submitCheck, skillUpPopup.show, levelUpPopup.show, showGuide]
  );

  useEffect(() => {
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [handleKeyDown]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center px-8">
        <div className="w-full max-w-xs">
          <div className="w-full h-2 bg-neutral-200 rounded-full overflow-hidden mb-3">
            <div
              className="h-full bg-primary-600 rounded-full transition-all duration-500 ease-out"
              style={{ width: `${loadingProgress.percent}%` }}
            />
          </div>
          <p className="text-xs text-text-secondary text-center">
            {loadingProgress.message || '로딩 중...'}
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-lg mx-auto px-4 py-4">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div>
          <h1 className="text-lg font-bold text-text-primary">Level {level}</h1>
          {levelSummary && <p className="text-xs text-text-secondary mt-0.5">{levelSummary}</p>}
        </div>
        <div className="flex items-center gap-2">
          <SessionCounter current={currentIndex + 1} total={cards.length} />
          <button
            onClick={() => setShowGuide(true)}
            className="p-2 rounded-lg hover:bg-neutral-100 transition-colors"
            aria-label="제스처 도움말"
          >
            <svg className="w-5 h-5 text-text-secondary" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z" />
            </svg>
          </button>
          <button
            onClick={toggleTheme}
            className="p-2 rounded-lg hover:bg-neutral-100 transition-colors"
            aria-label="테마 전환"
          >
            {theme === 'light' ? (
              <svg className="w-5 h-5 text-text-secondary" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
              </svg>
            ) : (
              <svg className="w-5 h-5 text-text-secondary" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
              </svg>
            )}
          </button>
        </div>
      </div>

      {/* Week streak */}
      <div className="my-4">
        <WeekStreak completedDays={[]} />
      </div>

      {/* Skill gauge */}
      {skill && (
        <div className="mb-4">
          <SkillGauge
            skillName={skill.skill_name}
            achievementScore={skill.achievement_score}
            totalScore={skill.total_score}
          />
        </div>
      )}

      {/* Card or session complete */}
      {sessionComplete ? (
        <div className="text-center py-12">
          <div className="w-16 h-16 mx-auto bg-success/20 rounded-full flex items-center justify-center mb-4">
            <svg className="w-8 h-8 text-success" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
            </svg>
          </div>
          <h2 className="text-xl font-bold text-text-primary mb-2">세션 완료!</h2>
          <p className="text-text-secondary text-sm mb-6">
            오늘 {todayCheckCount}문장을 학습했습니다.
          </p>
          <Button onClick={loadSession}>더 학습하기</Button>
        </div>
      ) : currentCard ? (
        <FlipCard
          card={currentCard}
          onReveal={reveal}
          revealed={revealed}
          onSwipeCheck={submitCheck}
          tenseTypeName={skill?.tense_type_name}
          patternTypeName={skill?.pattern_type_name}
        />
      ) : (
        <div className="text-center py-12">
          <p className="text-text-secondary">학습할 문장이 없습니다.</p>
          <p className="text-text-secondary text-sm mt-2">콘텐츠가 추가될 때까지 기다려주세요.</p>
        </div>
      )}

      {/* Check buttons */}
      {revealed && currentCard && !sessionComplete && (
        <div className="mt-4">
          <CheckButtons onCheck={submitCheck} disabled={submitting} />
        </div>
      )}

      {/* Debug info panel */}
      {debug && (
        <div className="mt-4 p-3 rounded-lg bg-neutral-100 border border-border text-xs text-text-secondary space-y-1 font-mono">
          <p>일학습시간 {debug.daily_goal_minutes}분 ({debug.daily_goal_type_name || '타입 미확인'}) : 설정된 일목표학습시간</p>
          <p>최소체크문장수 {debug.min_check_count}건 : 일학습시간 extra_attr_1 값 x 1</p>
          <p>로컬학습 데이터 문장수 {debug.local_sentence_count}건</p>
          <p>지금학습할 문장수 {debug.session_sentence_count}건</p>
          {lastScoreResult && (
            <p>누적익힘점수 {lastScoreResult.accumulated_score}점 : 해당 문장학습의 익힘점수</p>
          )}
        </div>
      )}

      {/* Level test button */}
      <div className="mt-6 text-center">
        <button
          onClick={() => router.push('/level-test')}
          className="text-sm text-text-secondary hover:text-primary-600 underline transition-colors"
        >
          레벨 테스트 받기
        </button>
      </div>

      {/* Popups */}
      <SkillUpPopup
        isOpen={skillUpPopup.show}
        skillName={skillUpPopup.skillName}
        onClose={closeSkillUpPopup}
      />
      <LevelUpPopup
        isOpen={levelUpPopup.show}
        newLevel={levelUpPopup.newLevel}
        onClose={closeLevelUpPopup}
      />
      <SwipeGuide isOpen={showGuide} onClose={closeGuide} />
    </div>
  );
}
