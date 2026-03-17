'use client';

import { useState, useCallback, useEffect, useRef } from 'react';
import type { LearningCard, CheckType, ScoreResult } from '@/types/database';
import { isLocalDbAvailable } from '@/lib/db/dbAvailability';
import { isLevelDownloaded, downloadLevelWithPriority } from '@/lib/db/downloadManager';
import { buildLocalSession } from '@/lib/db/sessionBuilder';
import { processCheckLocally } from '@/lib/db/scoreProcessor';
import { processSyncQueue, registerVisibilitySync, startSyncTimer, stopSyncTimer } from '@/lib/db/syncService';

interface SkillInfo {
  id: string;
  skill_name: string;
  achievement_score: number;
  total_score: number;
  is_cleared: boolean;
  tense_type_code: string | null;
  tense_type_name: string | null;
  pattern_type_code: string | null;
  pattern_type_name: string | null;
}

interface DebugInfo {
  daily_goal_minutes: number;
  daily_goal_type_name?: string;
  min_check_count: number;
  local_sentence_count: number;
  session_sentence_count: number;
}

interface LoadingProgress {
  active: boolean;
  percent: number;
  message: string;
}

interface LearningState {
  cards: LearningCard[];
  currentIndex: number;
  revealed: boolean;
  skill: SkillInfo | null;
  level: number;
  levelSummary: string | null;
  loading: boolean;
  loadingProgress: LoadingProgress;
  submitting: boolean;
  skillUpPopup: { show: boolean; skillName: string };
  levelUpPopup: { show: boolean; newLevel: number };
  sessionComplete: boolean;
  todayCheckCount: number;
  debug: DebugInfo | null;
  lastScoreResult: ScoreResult | null;
}

export function useLearning() {
  const [state, setState] = useState<LearningState>({
    cards: [],
    currentIndex: 0,
    revealed: false,
    skill: null,
    level: 1,
    levelSummary: null,
    loading: true,
    loadingProgress: { active: false, percent: 0, message: '' },
    submitting: false,
    skillUpPopup: { show: false, skillName: '' },
    levelUpPopup: { show: false, newLevel: 0 },
    sessionComplete: false,
    todayCheckCount: 0,
    debug: null,
    lastScoreResult: null,
  });

  const localDbRef = useRef<boolean | null>(null);
  const userIdRef = useRef<string | null>(null);
  const unregisterVisibilityRef = useRef<(() => void) | null>(null);

  const loadSession = useCallback(async () => {
    setState((prev) => ({
      ...prev,
      loading: true,
      loadingProgress: { active: true, percent: 10, message: '학습 데이터를 준비하고 있습니다...' },
    }));

    try {
      // Check local DB availability (only once)
      if (localDbRef.current === null) {
        localDbRef.current = await isLocalDbAvailable();
      }

      const useLocal = localDbRef.current;

      if (useLocal) {
        // --- LOCAL-FIRST PATH ---
        setState((prev) => ({
          ...prev,
          loadingProgress: { active: true, percent: 20, message: '로컬 데이터를 확인하고 있습니다...' },
        }));

        // We need the user's profile to know current_level and learning_language.
        // First fetch minimal info from server if not yet downloaded.
        const profileRes = await fetch('/api/learning/session');
        const serverData = await profileRes.json();

        const currentLevel = serverData.level || 1;
        const userId = serverData.debug?.user_id || '';
        userIdRef.current = userId;

        // Determine userId from the profile endpoint or from server data
        // Since session API doesn't return user_id, we get it from download
        if (!await isLevelDownloaded(currentLevel)) {
          setState((prev) => ({
            ...prev,
            loadingProgress: { active: true, percent: 30, message: '학습 데이터를 다운로드하고 있습니다...' },
          }));

          await downloadLevelWithPriority(currentLevel, '', (progress) => {
            setState((prev) => ({
              ...prev,
              loadingProgress: {
                active: true,
                percent: 30 + Math.round(progress.percent * 0.5),
                message: progress.message,
              },
            }));
          });
        }

        setState((prev) => ({
          ...prev,
          loadingProgress: { active: true, percent: 80, message: '세션을 구성하고 있습니다...' },
        }));

        // Get user profile from local DB for building session
        const { db } = await import('@/lib/db/flipflipDb');
        const profiles = await db.userProfiles.toArray();
        const profile = profiles[0]; // There should be exactly one user profile

        if (profile) {
          userIdRef.current = profile.user_id;
          const sessionData = await buildLocalSession(
            profile.user_id,
            profile.current_level,
            profile.learning_language || 'en'
          );

          await new Promise((r) => setTimeout(r, 300));

          setState((prev) => ({
            ...prev,
            cards: sessionData.cards || [],
            currentIndex: 0,
            revealed: false,
            skill: sessionData.skill,
            level: sessionData.level || prev.level,
            levelSummary: sessionData.level_summary || prev.levelSummary,
            loading: false,
            loadingProgress: { active: false, percent: 100, message: '' },
            sessionComplete: (sessionData.cards || []).length === 0,
            debug: sessionData.debug || null,
          }));

          // Start sync services
          startSyncTimer();
          if (!unregisterVisibilityRef.current) {
            unregisterVisibilityRef.current = registerVisibilitySync();
          }

          return;
        }

        // If no profile in local DB, fall through to online mode
      }

      // --- ONLINE FALLBACK PATH ---
      setState((prev) => ({
        ...prev,
        loadingProgress: { active: true, percent: 30, message: '서버에서 학습 데이터를 가져오고 있습니다...' },
      }));

      const res = await fetch('/api/learning/session');
      const data = await res.json();

      const cardCount = (data.cards || []).length;

      setState((prev) => ({
        ...prev,
        loadingProgress: {
          active: true,
          percent: 80,
          message: cardCount > 0
            ? `총 ${cardCount}개의 새로운 학습데이터를 가져오고 있습니다`
            : '학습 데이터를 정리하고 있습니다...',
        },
      }));

      await new Promise((r) => setTimeout(r, 300));

      setState((prev) => ({
        ...prev,
        cards: data.cards || [],
        currentIndex: 0,
        revealed: false,
        skill: data.skill,
        level: data.level || prev.level,
        levelSummary: data.level_summary || prev.levelSummary,
        loading: false,
        loadingProgress: { active: false, percent: 100, message: '' },
        sessionComplete: cardCount === 0,
        debug: data.debug || null,
      }));
    } catch {
      setState((prev) => ({
        ...prev,
        loading: false,
        loadingProgress: { active: false, percent: 0, message: '' },
      }));
    }
  }, []);

  useEffect(() => {
    loadSession();
    return () => {
      stopSyncTimer();
      unregisterVisibilityRef.current?.();
    };
  }, [loadSession]);

  const reveal = useCallback(() => {
    setState((prev) => ({ ...prev, revealed: !prev.revealed }));
  }, []);

  const submitCheck = useCallback((checkType: CheckType) => {
    const card = state.cards[state.currentIndex];
    if (!card || state.submitting) return;

    setState((prev) => ({ ...prev, submitting: true }));

    const handleResult = (result: ScoreResult) => {
      const nextReview = new Date(result.next_review_at);
      const formatted = `${nextReview.getFullYear()}-${String(nextReview.getMonth() + 1).padStart(2, '0')}-${String(nextReview.getDate()).padStart(2, '0')} ${String(nextReview.getHours()).padStart(2, '0')}:${String(nextReview.getMinutes()).padStart(2, '0')}`;

      setState((prev) => {
        const updatedSkill = prev.skill
          ? {
              ...prev.skill,
              achievement_score: result.skill_achievement_score,
              total_score: result.skill_total_score,
            }
          : null;

        return {
          ...prev,
          skill: updatedSkill,
          lastScoreResult: result,
          skillUpPopup: result.skill_up
            ? { show: true, skillName: prev.skill?.skill_name || '' }
            : prev.skillUpPopup,
          levelUpPopup: result.level_up
            ? { show: true, newLevel: result.new_level || prev.level + 1 }
            : prev.levelUpPopup,
        };
      });

      alert(`다음학습 시간 : ${formatted}`);

      setState((prev) => {
        const newCheckCount = prev.todayCheckCount + 1;
        const nextIndex = prev.currentIndex + 1;
        const sessionComplete = nextIndex >= prev.cards.length;

        return {
          ...prev,
          submitting: false,
          todayCheckCount: newCheckCount,
          currentIndex: sessionComplete ? prev.currentIndex : nextIndex,
          revealed: false,
          sessionComplete,
        };
      });
    };

    const handleError = () => {
      setState((prev) => {
        const newCheckCount = prev.todayCheckCount + 1;
        const nextIndex = prev.currentIndex + 1;
        const sessionComplete = nextIndex >= prev.cards.length;

        return {
          ...prev,
          submitting: false,
          todayCheckCount: newCheckCount,
          currentIndex: sessionComplete ? prev.currentIndex : nextIndex,
          revealed: false,
          sessionComplete,
        };
      });
    };

    if (localDbRef.current && userIdRef.current) {
      // --- LOCAL-FIRST SCORING ---
      processCheckLocally(userIdRef.current, card.sentence_id, checkType)
        .then(handleResult)
        .catch(handleError);
    } else {
      // --- ONLINE FALLBACK SCORING ---
      fetch('/api/score', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          sentence_id: card.sentence_id,
          check_type_code: checkType,
        }),
      })
        .then((res) => res.json())
        .then(handleResult)
        .catch(handleError);
    }
  }, [state.cards, state.currentIndex, state.submitting]);

  const closeSkillUpPopup = useCallback(() => {
    setState((prev) => ({
      ...prev,
      skillUpPopup: { show: false, skillName: '' },
    }));
  }, []);

  const closeLevelUpPopup = useCallback(() => {
    setState((prev) => ({
      ...prev,
      levelUpPopup: { show: false, newLevel: 0 },
    }));
    loadSession();
  }, [loadSession]);

  // Sync on session complete
  useEffect(() => {
    if (state.sessionComplete && localDbRef.current) {
      processSyncQueue().catch(() => {});
    }
  }, [state.sessionComplete]);

  const currentCard = state.cards[state.currentIndex] || null;

  return {
    ...state,
    currentCard,
    reveal,
    submitCheck,
    loadSession,
    closeSkillUpPopup,
    closeLevelUpPopup,
  };
}
