'use client';

import { useEffect, useState, useCallback, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { initLevelTest, processAnswer, type LevelTestState, type LevelTestQuestion } from '@/lib/utils/levelTest';
import QuizFlipCard, { type QuizFlipCardRef } from '@/components/learning/QuizFlipCard';
import CheckButtons from '@/components/learning/CheckButtons';
import type { CheckType } from '@/types/database';

export default function LevelTestPage() {
  const router = useRouter();
  const supabase = createClient();
  const [state, setState] = useState<LevelTestState>(initLevelTest(5));
  const [revealed, setRevealed] = useState(false);
  const [loading, setLoading] = useState(true);
  const [finishing, setFinishing] = useState(false);
  const flipCardRef = useRef<QuizFlipCardRef>(null);

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

    // Get expressions for these sentences (uppercase to match DB convention)
    const learningLanguage = (profile?.learning_language || 'en').toUpperCase();
    const sentenceIds = sentences.map((s) => s.id);
    const { data: expressions } = await supabase
      .from('expressions')
      .select('sentence_id, expression_text, hint')
      .in('sentence_id', sentenceIds)
      .eq('language_code', learningLanguage);

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

  const handleCheck = useCallback((type: CheckType) => {
    const correct = type === 'PERFECT' || type === 'MOSTLY';
    const newState = processAnswer(state, correct);
    setRevealed(false);
    setState(newState);
  }, [state]);

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

  const frontContent = (
    <div className="flex flex-col items-center gap-3">
      <p className="text-2xl font-bold text-text-primary leading-relaxed">
        {currentQuestion.meaning}
      </p>
      <p className="mt-3 text-sm text-text-secondary">
        탭하여 정답 보기
      </p>
    </div>
  );

  const backContent = (
    <div className="flex flex-col items-center gap-3">
      <p className="text-lg text-text-secondary leading-relaxed">
        {currentQuestion.meaning}
      </p>
      <p className="text-2xl font-bold text-primary-600 leading-relaxed">
        {currentQuestion.expression}
      </p>
    </div>
  );

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

        {/* Shared QuizFlipCard */}
        <QuizFlipCard
          ref={flipCardRef}
          cardKey={currentQuestion.sentence_id}
          frontContent={frontContent}
          backContent={backContent}
          onRevealChange={setRevealed}
          onCheck={handleCheck}
          className="w-full mb-6"
        />

        {/* Check buttons — same component as regular learning */}
        {revealed && <CheckButtons onCheck={(type) => flipCardRef.current?.triggerCheck(type)} />}

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
