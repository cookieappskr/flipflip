'use client';

import { useCallback, useState, useEffect, useRef } from 'react';
import { motion, useMotionValue, useTransform, PanInfo } from 'framer-motion';
import type { LearningCard, CheckType } from '@/types/database';
import SkillTags from './SkillTags';

interface FlipCardProps {
  card: LearningCard;
  onReveal: () => void;
  revealed: boolean;
  onSwipeCheck?: (type: CheckType) => void;
  tenseTypeName?: string | null;
  patternTypeName?: string | null;
}

const SWIPE_THRESHOLD = 60;

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

// Fallback for cards with no mastery yet — uses "처음" (FIRST) as the lowest level
const DEFAULT_MASTERY_COLOR = 'bg-neutral-100 text-neutral-500 border-neutral-200';

function shouldShowTapGuide(): boolean {
  const key = `tap_guide_${new Date().toISOString().split('T')[0]}`;
  if (typeof window === 'undefined') return false;
  if (localStorage.getItem(key)) return false;
  localStorage.setItem(key, 'true');
  return true;
}

export default function FlipCard({ card, onReveal, revealed, onSwipeCheck, tenseTypeName, patternTypeName }: FlipCardProps) {
  const [showTapGuide, setShowTapGuide] = useState(false);
  const [hintToast, setHintToast] = useState(false);
  const hintClickedRef = useRef(false);
  const hintTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    setShowTapGuide(shouldShowTapGuide());
  }, []);

  // Clear hint toast on card change
  useEffect(() => {
    setHintToast(false);
    if (hintTimerRef.current) clearTimeout(hintTimerRef.current);
  }, [card.sentence_id]);

  const x = useMotionValue(0);
  const y = useMotionValue(0);
  const rotateZ = useTransform(x, [-200, 0, 200], [-8, 0, 8]);
  const opacity = useTransform(
    [x, y],
    ([latestX, latestY]: number[]) => {
      const dist = Math.max(Math.abs(latestX), Math.abs(latestY));
      return dist > SWIPE_THRESHOLD ? 0.7 : 1;
    }
  );

  const handlePanEnd = useCallback(
    (_: any, info: PanInfo) => {
      if (!revealed || !onSwipeCheck) return;
      const { offset } = info;
      if (offset.x > SWIPE_THRESHOLD && Math.abs(offset.y) < SWIPE_THRESHOLD) {
        onSwipeCheck('PERFECT');
        return;
      }
      if (offset.y > SWIPE_THRESHOLD && Math.abs(offset.x) < SWIPE_THRESHOLD) {
        onSwipeCheck('MOSTLY');
        return;
      }
      if (offset.x < -SWIPE_THRESHOLD) {
        onSwipeCheck('MISSED');
        return;
      }
    },
    [revealed, onSwipeCheck]
  );

  const handleTap = useCallback(() => {
    if (hintClickedRef.current) {
      hintClickedRef.current = false;
      return;
    }
    setHintToast(false);
    setShowTapGuide(false);
    onReveal();
  }, [onReveal]);

  const showHintToast = useCallback(() => {
    hintClickedRef.current = true;
    setHintToast(true);
    if (hintTimerRef.current) clearTimeout(hintTimerRef.current);
    hintTimerRef.current = setTimeout(() => setHintToast(false), 3000);
  }, []);

  // Mastery badge: use DB type_name, fallback to "처음" for new cards
  const masteryDisplay = card.mastery_level_name || '처음';
  const masteryColor = card.mastery_level_code
    ? MASTERY_COLORS[card.mastery_level_code] || DEFAULT_MASTERY_COLOR
    : DEFAULT_MASTERY_COLOR;

  return (
    <div className="w-full" style={{ perspective: '1000px' }}>
      {/* Hint toast */}
      {hintToast && card.hint && (
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: 10 }}
          className="fixed left-1/2 -translate-x-1/2 bottom-32 z-50 px-4 py-2.5 rounded-xl bg-neutral-800 text-white text-sm shadow-lg max-w-xs text-center"
        >
          💡 {card.hint}
        </motion.div>
      )}

      {/* 3D Flip Card */}
      <motion.div
        animate={{ rotateY: revealed ? 180 : 0 }}
        transition={{ duration: 0.5, ease: [0.23, 1, 0.32, 1] }}
        style={{
          transformStyle: 'preserve-3d',
          ...(revealed ? { x, y, rotateZ, opacity } : {}),
        }}
        drag={revealed ? true : false}
        dragConstraints={{ top: 0, bottom: 0, left: 0, right: 0 }}
        dragElastic={0.7}
        onDragEnd={handlePanEnd}
        onTap={handleTap}
        whileTap={!revealed ? { scale: 0.98 } : undefined}
        className="relative rounded-2xl shadow-lg min-h-[260px] select-none touch-none cursor-pointer"
        role="button"
        aria-label={revealed ? `의미: ${card.meaning}, 표현: ${card.expression}` : `의미: ${card.meaning}, 탭하여 정답 보기`}
        tabIndex={0}
      >
        {/* Front face */}
        <div
          className="absolute inset-0 rounded-2xl px-6 py-8 flex flex-col items-center justify-center text-center border bg-surface-secondary border-border"
          style={{ backfaceVisibility: 'hidden' }}
        >
          {/* Top row: type badges (left) + mastery badge (right) */}
          <div className="absolute top-3 left-4 right-4 flex items-start justify-between">
            <div>
              {(tenseTypeName || patternTypeName) && (
                <SkillTags tenseTypeName={tenseTypeName} patternTypeName={patternTypeName} />
              )}
            </div>
            <div>
              <span className={`inline-flex items-center text-[10px] px-1.5 py-0.5 rounded border font-medium ${masteryColor}`}>
                {masteryDisplay}
              </span>
            </div>
          </div>

          <div className="flex flex-col items-center gap-3 mt-4">
            <p className="text-2xl font-bold text-text-primary leading-relaxed">
              {card.meaning}
            </p>
            {card.hint && (
              <button
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
        </div>

        {/* Back face */}
        <div
          className="absolute inset-0 rounded-2xl px-6 py-8 flex flex-col items-center justify-center text-center border bg-primary-50 border-primary-500/30"
          style={{ backfaceVisibility: 'hidden', transform: 'rotateY(180deg)' }}
        >
          {/* Top row: same badges on back */}
          <div className="absolute top-3 left-4 right-4 flex items-start justify-between">
            <div>
              {(tenseTypeName || patternTypeName) && (
                <SkillTags tenseTypeName={tenseTypeName} patternTypeName={patternTypeName} />
              )}
            </div>
            <div>
              <span className={`inline-flex items-center text-[10px] px-1.5 py-0.5 rounded border font-medium ${masteryColor}`}>
                {masteryDisplay}
              </span>
            </div>
          </div>

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
        </div>
      </motion.div>

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
}
