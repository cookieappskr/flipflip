'use client';

import { useState, useCallback, useEffect } from 'react';
import type { LearningCard, CheckType, ScoreResult } from '@/types/database';

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

interface LearningState {
  cards: LearningCard[];
  currentIndex: number;
  revealed: boolean;
  skill: SkillInfo | null;
  level: number;
  levelSummary: string | null;
  loading: boolean;
  submitting: boolean;
  skillUpPopup: { show: boolean; skillName: string };
  levelUpPopup: { show: boolean; newLevel: number };
  sessionComplete: boolean;
  todayCheckCount: number;
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
    submitting: false,
    skillUpPopup: { show: false, skillName: '' },
    levelUpPopup: { show: false, newLevel: 0 },
    sessionComplete: false,
    todayCheckCount: 0,
  });

  const loadSession = useCallback(async () => {
    setState((prev) => ({ ...prev, loading: true }));
    try {
      const res = await fetch('/api/learning/session');
      const data = await res.json();
      setState((prev) => ({
        ...prev,
        cards: data.cards || [],
        currentIndex: 0,
        revealed: false,
        skill: data.skill,
        level: data.level || prev.level,
        levelSummary: data.level_summary || prev.levelSummary,
        loading: false,
        sessionComplete: (data.cards || []).length === 0,
      }));
    } catch {
      setState((prev) => ({ ...prev, loading: false }));
    }
  }, []);

  useEffect(() => {
    loadSession();
  }, [loadSession]);

  const reveal = useCallback(() => {
    setState((prev) => ({ ...prev, revealed: !prev.revealed }));
  }, []);

  const submitCheck = useCallback((checkType: CheckType) => {
    const card = state.cards[state.currentIndex];
    if (!card || state.submitting) return;

    // Optimistic UI update — move to next card immediately
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

    // Background API call — sync score to server
    fetch('/api/score', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sentence_id: card.sentence_id,
        check_type_code: checkType,
      }),
    })
      .then((res) => res.json())
      .then((result: ScoreResult) => {
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
            skillUpPopup: result.skill_up
              ? { show: true, skillName: prev.skill?.skill_name || '' }
              : prev.skillUpPopup,
            levelUpPopup: result.level_up
              ? { show: true, newLevel: result.new_level || prev.level + 1 }
              : prev.levelUpPopup,
          };
        });
      })
      .catch(() => {
        // Score sync failed — will retry on next session load
      });
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
    // Reload session for new level
    loadSession();
  }, [loadSession]);

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
