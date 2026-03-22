'use client';

import { useEffect, useCallback, useState, useRef } from 'react';
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
import MileageDisplay from '@/components/learning/MileageDisplay';
import TrialLimitModal from '@/components/learning/TrialLimitBanner';
import Button from '@/components/core/Button';
import type { CheckType } from '@/types/database';
import type { QuizFlipCardRef } from '@/components/learning/QuizFlipCard';

const LANGUAGE_FLAGS: Record<string, string> = {
  en: '🇺🇸', ja: '🇯🇵', zh: '🇨🇳', es: '🇪🇸', ko: '🇰🇷',
  fr: '🇫🇷', de: '🇩🇪', vi: '🇻🇳', th: '🇹🇭', id: '🇮🇩',
};

interface DailyStatus {
  completedDays: string[];
  mileageBalance: number;
  streak: number;
  isDailyComplete: boolean;
  learningLanguage: string;
  serverTodayCheckCount: number;
  subscription: {
    status: string;
    isLimited: boolean;
    dailySentenceLimit: number | null;
    trialDaysRemaining: number | null;
    trialTotalDays: number | null;
  } | null;
}

export default function LearnPage() {
  const router = useRouter();
  const flipCardRef = useRef<QuizFlipCardRef>(null);
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

  // Daily status (mileage, streak, subscription)
  const [dailyStatus, setDailyStatus] = useState<DailyStatus | null>(null);
  const dailyCompleteCalledRef = useRef(false);
  const dailyCompleteNewlyEarnedRef = useRef(false);

  useEffect(() => {
    fetch('/api/learning/daily-status')
      .then((res) => res.json())
      .then((data) => {
        setDailyStatus({
          completedDays: data.completedDays || [],
          mileageBalance: data.mileageBalance || 0,
          streak: data.streak || 0,
          isDailyComplete: data.isDailyComplete || false,
          learningLanguage: data.learningLanguage || 'en',
          serverTodayCheckCount: data.todayCheckCount || 0,
          subscription: data.subscription || null,
        });
      })
      .catch(() => {});
  }, []);

  // Check daily completion and award mileage
  useEffect(() => {
    if (dailyCompleteCalledRef.current) return;
    if (!debug || !dailyStatus) return;

    const totalChecked = (dailyStatus.serverTodayCheckCount || 0) + todayCheckCount;
    if (totalChecked >= debug.min_check_count && !dailyStatus.isDailyComplete) {
      dailyCompleteCalledRef.current = true;
      fetch('/api/learning/complete', { method: 'POST' })
        .then((res) => res.json())
        .then((data) => {
          if (data.success) {
            dailyCompleteNewlyEarnedRef.current = true;
            setDailyStatus((prev) => prev ? {
              ...prev,
              isDailyComplete: true,
              mileageBalance: data.newBalance,
              streak: data.streak,
              completedDays: [...prev.completedDays, new Date().toISOString().split('T')[0]],
            } : prev);
          }
        })
        .catch(() => {});
    }
  }, [todayCheckCount, debug, dailyStatus]);

  // Trial modal
  const subStatus = dailyStatus?.subscription;
  const [showTrialModal, setShowTrialModal] = useState(false);

  useEffect(() => {
    if (!subStatus) return;
    if (subStatus.status === 'active') return;
    if (subStatus.status === 'trial') {
      const key = `trial_modal_${new Date().toISOString().split('T')[0]}`;
      if (!localStorage.getItem(key)) {
        setShowTrialModal(true);
      }
    } else if (subStatus.status === 'expired' || subStatus.status === 'no_subscription') {
      setShowTrialModal(true);
    }
  }, [subStatus]);

  const closeTrialModal = () => {
    if (subStatus?.status === 'trial') {
      const key = `trial_modal_${new Date().toISOString().split('T')[0]}`;
      localStorage.setItem(key, 'true');
    }
    setShowTrialModal(false);
  };

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
        flipCardRef.current?.flip();
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
        flipCardRef.current?.triggerCheck(checkType);
      }
    },
    [revealed, skillUpPopup.show, levelUpPopup.show, showGuide]
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
        <div className="flex items-center gap-2">
          <h1 className="text-lg font-bold text-text-primary">Level {level}</h1>
          <span className="text-xl" role="img" aria-label="학습 언어">
            {LANGUAGE_FLAGS[dailyStatus?.learningLanguage || 'en'] || '🌐'}
          </span>
        </div>
        <div className="flex items-center gap-2">
          <MileageDisplay
            balance={dailyStatus?.mileageBalance || 0}
            onClick={() => router.push('/mypage')}
          />
        </div>
      </div>
      {levelSummary && <p className="text-xs text-text-secondary -mt-3 mb-4">{levelSummary}</p>}

      {/* Week streak */}
      <div className="my-4">
        <WeekStreak completedDays={dailyStatus?.completedDays || []} />
      </div>

      {/* Skill gauge */}
      {skill && (
        <div className="mb-4">
          <SkillGauge
            skillName={skill.skill_name}
            achievementScore={skill.achievement_score}
            totalScore={skill.total_score}
            skillUpRatio={skill.skill_up_ratio}
          />
        </div>
      )}

      {/* Session counter + Help (above card) */}
      {!sessionComplete && currentCard && (
        <div className="flex items-center justify-end gap-1.5 mb-2">
          <SessionCounter current={currentIndex + 1} total={cards.length} />
          <button
            onClick={() => setShowGuide(true)}
            className="p-1.5 rounded-lg hover:bg-neutral-100 transition-colors"
            aria-label="제스처 도움말"
          >
            <svg className="w-4 h-4 text-text-secondary" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z" />
            </svg>
          </button>
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
          {dailyCompleteNewlyEarnedRef.current && (
            <p className="text-sm text-success font-medium mb-4">
              일학습 완료! +{10}pt 적립
            </p>
          )}
          <Button onClick={() => { dailyCompleteNewlyEarnedRef.current = false; loadSession(); }}>더 학습하기</Button>
        </div>
      ) : currentCard ? (
        <FlipCard
          ref={flipCardRef}
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
          {subStatus?.isLimited ? (
            <div className="mt-4">
              <p className="text-text-secondary text-sm mb-3">오늘의 무료 학습 한도에 도달했습니다.</p>
              <Button onClick={() => router.push('/pricing')}>구독하고 무제한 학습하기</Button>
            </div>
          ) : (
            <p className="text-text-secondary text-sm mt-2">콘텐츠가 추가될 때까지 기다려주세요.</p>
          )}
        </div>
      )}

      {/* Check buttons */}
      {revealed && currentCard && !sessionComplete && (
        <div className="mt-4">
          <CheckButtons
            onCheck={(type) => flipCardRef.current?.triggerCheck(type)}
            disabled={submitting}
          />
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
      {subStatus && (subStatus.status === 'trial' || subStatus.status === 'expired' || subStatus.status === 'no_subscription') && (
        <TrialLimitModal
          isOpen={showTrialModal}
          onClose={closeTrialModal}
          status={subStatus.status as 'trial' | 'expired' | 'no_subscription'}
          trialDaysRemaining={subStatus.trialDaysRemaining}
          trialTotalDays={subStatus.trialTotalDays}
          todayRemaining={Math.max(0, (subStatus.dailySentenceLimit || 10) - todayCheckCount)}
          dailyLimit={subStatus.dailySentenceLimit || 10}
        />
      )}
    </div>
  );
}
