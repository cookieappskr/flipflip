'use client';

import { useCallback, useState, useEffect, useRef, forwardRef, useImperativeHandle } from 'react';
import type { LearningCard, CheckType } from '@/types/database';
import SkillTags from './SkillTags';
import QuizFlipCard, { type QuizFlipCardRef } from './QuizFlipCard';

interface FlipCardProps {
  card: LearningCard;
  onReveal: () => void;
  revealed: boolean;
  onSwipeCheck?: (type: CheckType) => void;
  tenseTypeName?: string | null;
  patternTypeName?: string | null;
}

// Color mapping by mastery code (colors are UI-only, not in DB)
const MASTERY_COLORS: Record<string, string> = {
  FIRST: 'bg-neutral-100 text-neutral-500 border-neutral-200',
  FIRST_MEMORIZE: 'bg-neutral-100 text-neutral-500 border-neutral-200',
  WEAK: 'bg-orange-50 text-orange-500 border-orange-200',
  FAMILIAR: 'bg-blue-50 text-blue-500 border-blue-200',
  VERY_FAMILIAR: 'bg-emerald-50 text-emerald-500 border-emerald-200',
  PERFECT_MASTERY: 'bg-purple-50 text-purple-500 border-purple-200',
  MASTERED: 'bg-purple-50 text-purple-500 border-purple-200',
};

const DEFAULT_MASTERY_COLOR = 'bg-neutral-100 text-neutral-500 border-neutral-200';

function shouldShowTapGuide(): boolean {
  const key = `tap_guide_${new Date().toISOString().split('T')[0]}`;
  if (typeof window === 'undefined') return false;
  if (localStorage.getItem(key)) return false;
  localStorage.setItem(key, 'true');
  return true;
}

const FlipCard = forwardRef<QuizFlipCardRef, FlipCardProps>(
  function FlipCard({ card, onReveal, revealed, onSwipeCheck, tenseTypeName, patternTypeName }, ref) {
  const [showTapGuide, setShowTapGuide] = useState(false);
  const [hintToast, setHintToast] = useState(false);
  const hintClickedRef = useRef(false);
  const hintTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const flipCardRef = useRef<QuizFlipCardRef>(null);

  // Forward ref so parent can call triggerCheck and flip
  useImperativeHandle(ref, () => ({
    triggerCheck: (type: CheckType) => flipCardRef.current?.triggerCheck(type),
    flip: () => flipCardRef.current?.flip(),
  }), []);

  useEffect(() => {
    setShowTapGuide(shouldShowTapGuide());
  }, []);

  // Clear hint toast on card change
  useEffect(() => {
    setHintToast(false);
    if (hintTimerRef.current) clearTimeout(hintTimerRef.current);
  }, [card.sentence_id]);

  const showHintToast = useCallback(() => {
    hintClickedRef.current = true;
    setHintToast(true);
    if (hintTimerRef.current) clearTimeout(hintTimerRef.current);
    hintTimerRef.current = setTimeout(() => setHintToast(false), 3000);
  }, []);

  const handleRevealChange = useCallback((isRevealed: boolean) => {
    // Sync with parent's revealed state
    if (isRevealed !== revealed) {
      onReveal(); // toggle parent state
    }
  }, [revealed, onReveal]);

  const handleCheck = useCallback((type: CheckType) => {
    onSwipeCheck?.(type);
  }, [onSwipeCheck]);

  // Mastery badge
  const masteryDisplay = card.mastery_level_name || '처음';
  const masteryColor = card.mastery_level_code
    ? MASTERY_COLORS[card.mastery_level_code] || DEFAULT_MASTERY_COLOR
    : DEFAULT_MASTERY_COLOR;

  // Badge row used in both front and back faces
  const badgeRow = (
    <div className="absolute top-3 left-4 right-4 flex items-start justify-between">
      <div>
        {(tenseTypeName || patternTypeName) && (
          <SkillTags tenseTypeName={tenseTypeName} patternTypeName={patternTypeName} />
        )}
      </div>
      <div className="flex items-center gap-1">
        <span className={`inline-flex items-center text-[10px] px-1.5 py-0.5 rounded border font-medium ${masteryColor}`}>
          {masteryDisplay}
        </span>
      </div>
    </div>
  );

  const frontContent = (
    <>
      {badgeRow}
      <div className="flex flex-col items-center gap-3 mt-4">
        <p className="text-2xl font-bold text-text-primary leading-relaxed">
          {card.meaning}
        </p>
        {card.hint && (
          <button
            onPointerDown={(e) => e.stopPropagation()}
            onClick={(e) => { e.stopPropagation(); showHintToast(); }}
            className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg border border-border text-text-secondary hover:bg-neutral-100 hover:text-info transition-colors text-xs"
            aria-label="힌트 보기"
          >
            <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 18v-5.25m0 0a6.01 6.01 0 001.5-.189m-1.5.189a6.01 6.01 0 01-1.5-.189m3.75 7.478a12.06 12.06 0 01-4.5 0m3.75 2.383a14.406 14.406 0 01-3 0M14.25 18v-.192c0-.983.658-1.823 1.508-2.316a7.5 7.5 0 10-7.517 0c.85.493 1.509 1.333 1.509 2.316V18" />
            </svg>
            힌트
          </button>
        )}
      </div>
      {showTapGuide && (
        <p className="mt-5 text-sm text-text-secondary">
          탭하여 정답 보기
        </p>
      )}
    </>
  );

  const backContent = (
    <>
      {badgeRow}
      <div className="flex flex-col items-center gap-3 mt-4">
        <p className="text-lg text-text-secondary leading-relaxed">
          {card.meaning}
        </p>
        <p className="text-2xl font-bold text-primary-600 leading-relaxed">
          {card.expression}
        </p>
        {card.hint && (
          <p className="text-sm text-text-secondary mt-1">{card.hint}</p>
        )}
      </div>
    </>
  );

  return (
    <div className="w-full">
      {/* Hint toast */}
      {hintToast && card.hint && (
        <div className="fixed left-1/2 -translate-x-1/2 bottom-32 z-50 px-4 py-2.5 rounded-xl bg-neutral-800 text-white text-sm shadow-lg max-w-xs text-center animate-fade-in">
          💡 {card.hint}
        </div>
      )}

      <QuizFlipCard
        ref={flipCardRef}
        cardKey={card.sentence_id}
        frontContent={frontContent}
        backContent={backContent}
        onRevealChange={handleRevealChange}
        onCheck={handleCheck}
        className="w-full"
      />

      {/* Review badge */}
      {card.is_review && (
        <div className="flex items-center justify-center mt-2">
          <span className="text-xs bg-warning/20 text-warning px-2 py-0.5 rounded-full font-medium">
            복습
          </span>
        </div>
      )}
    </div>
  );
});

export default FlipCard;
