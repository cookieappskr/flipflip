'use client';

import { useEffect, useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { initLevelTest, processAnswer, type LevelTestState, type LevelTestQuestion } from '@/lib/utils/levelTest';
import Button from '@/components/core/Button';

export default function LevelTestPage() {
  const router = useRouter();
  const supabase = createClient();
  const [state, setState] = useState<LevelTestState>(initLevelTest(5));
  const [showAnswer, setShowAnswer] = useState(false);
  const [loading, setLoading] = useState(true);
  const [finishing, setFinishing] = useState(false);

  const loadQuestions = useCallback(async (levelNumber: number) => {
    setLoading(true);

    // Get the level
    const { data: level } = await supabase
      .from('levels')
      .select('id')
      .eq('level_number', levelNumber)
      .single();

    if (!level) {
      setLoading(false);
      return [];
    }

    // Get skills for this level
    const { data: skills } = await supabase
      .from('skills')
      .select('id')
      .eq('level_id', level.id)
      .order('display_order')
      .limit(1);

    if (!skills?.length) {
      setLoading(false);
      return [];
    }

    // Get user profile for language
    const { data: { user } } = await supabase.auth.getUser();
    const { data: profile } = await supabase
      .from('user_profiles')
      .select('mother_tongue, learning_language')
      .eq('user_id', user!.id)
      .single();

    // Get sentences for the first skill
    const { data: sentences } = await supabase
      .from('sentences')
      .select('id, meaning')
      .eq('skill_id', skills[0].id)
      .limit(3);

    if (!sentences?.length) {
      setLoading(false);
      return [];
    }

    // Get expressions for these sentences
    const sentenceIds = sentences.map((s) => s.id);
    const { data: expressions } = await supabase
      .from('expressions')
      .select('sentence_id, expression_text, hint')
      .in('sentence_id', sentenceIds)
      .eq('language_code', profile?.learning_language || 'en');

    const expressionMap = new Map(
      expressions?.map((e) => [e.sentence_id, e]) || []
    );

    const questions: LevelTestQuestion[] = sentences.map((s) => ({
      sentence_id: s.id,
      meaning: s.meaning || '',
      expression: expressionMap.get(s.id)?.expression_text || '',
      hint: expressionMap.get(s.id)?.hint || null,
      level_number: levelNumber,
    }));

    setLoading(false);
    return questions;
  }, []);

  // Load initial questions
  useEffect(() => {
    loadQuestions(state.currentLevel).then((questions) => {
      if (questions.length > 0) {
        setState((prev) => ({ ...prev, questions }));
      }
    });
  }, []);

  // When level changes (after answer processed), load new questions
  useEffect(() => {
    if (state.questions.length === 0 && !state.finished && !loading) {
      loadQuestions(state.currentLevel).then((questions) => {
        if (questions.length > 0) {
          setState((prev) => ({ ...prev, questions }));
        } else {
          // No content at this level — finish
          setState((prev) => ({ ...prev, finished: true }));
        }
      });
    }
  }, [state.currentLevel, state.questions.length, state.finished, loading]);

  // Finish level test
  useEffect(() => {
    if (state.finished && !finishing) {
      setFinishing(true);
      const finalize = async () => {
        const { data: { user } } = await supabase.auth.getUser();
        if (user) {
          await supabase
            .from('user_profiles')
            .update({ current_level: state.finalLevel })
            .eq('user_id', user.id);
        }
        router.push('/learn');
      };
      finalize();
    }
  }, [state.finished, finishing]);

  const handleCheck = (correct: boolean) => {
    const newState = processAnswer(state, correct);
    setShowAnswer(false);
    setState(newState);
  };

  const currentQuestion = state.questions[state.currentQuestionIndex];

  if (loading || !currentQuestion) {
    return (
      <div className="min-h-screen bg-neutral-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin h-8 w-8 border-2 border-primary-600 border-t-transparent rounded-full mx-auto mb-4" />
          <p className="text-text-secondary">
            {state.finished ? '결과 저장 중...' : `레벨 ${state.currentLevel} 문제 불러오는 중...`}
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-neutral-50 flex flex-col items-center px-4 py-8">
      <div className="w-full max-w-sm">
        <div className="text-center mb-2">
          <p className="text-xs text-text-secondary">레벨 테스트</p>
          <p className="text-sm font-medium text-primary-600">
            Level {state.currentLevel} · 문제 {state.currentQuestionIndex + 1}/3
          </p>
          <p className="text-xs text-text-secondary mt-1">
            실력을 파악하고 있습니다 ({state.history.length + 1}단계)
          </p>
        </div>

        {/* Card */}
        <div className="bg-surface rounded-2xl shadow-lg p-8 text-center min-h-[200px] flex flex-col items-center justify-center mb-6">
          <p className="text-lg font-medium text-text-primary mb-4">
            {currentQuestion.meaning}
          </p>

          {showAnswer ? (
            <div>
              <p className="text-xl font-bold text-primary-600">
                {currentQuestion.expression}
              </p>
              {currentQuestion.hint && (
                <p className="text-sm text-text-secondary mt-2">{currentQuestion.hint}</p>
              )}
            </div>
          ) : (
            <Button variant="ghost" size="sm" onClick={() => setShowAnswer(true)}>
              정답 보기
            </Button>
          )}
        </div>

        {/* Check buttons */}
        {showAnswer && (
          <div className="grid grid-cols-3 gap-2">
            <button
              onClick={() => handleCheck(true)}
              className="py-3 rounded-xl bg-success text-white font-medium text-sm hover:opacity-90 transition-opacity"
            >
              완벽히맞춤
            </button>
            <button
              onClick={() => handleCheck(true)}
              className="py-3 rounded-xl bg-warning text-white font-medium text-sm hover:opacity-90 transition-opacity"
            >
              대부분맞춤
            </button>
            <button
              onClick={() => handleCheck(false)}
              className="py-3 rounded-xl bg-error text-white font-medium text-sm hover:opacity-90 transition-opacity"
            >
              못맞춤
            </button>
          </div>
        )}

        {/* Skip button */}
        <div className="mt-6 text-center">
          <button
            onClick={() => router.push('/learn')}
            className="text-sm text-text-secondary hover:text-text-primary underline transition-colors"
          >
            건너뛰기 (Level 1부터 시작)
          </button>
        </div>
      </div>
    </div>
  );
}
