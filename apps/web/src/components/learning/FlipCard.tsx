'use client';

import { useCallback, useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence, useMotionValue, useTransform, PanInfo } from 'framer-motion';
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

const MASTERY_LABELS: Record<string, { label: string; color: string }> = {
  NEW: { label: '신규', color: 'bg-sky-50 text-sky-500 border-sky-200' },
  FIRST_MEMORIZE: { label: '첫암기', color: 'bg-neutral-100 text-neutral-500 border-neutral-200' },
  WEAK: { label: '미비', color: 'bg-orange-50 text-orange-500 border-orange-200' },
  FAMILIAR: { label: '익숙', color: 'bg-blue-50 text-blue-500 border-blue-200' },
  VERY_FAMILIAR: { label: '매우익숙', color: 'bg-emerald-50 text-emerald-500 border-emerald-200' },
  PERFECT_MASTERY: { label: '완벽', color: 'bg-purple-50 text-purple-500 border-purple-200' },
};

function shouldShowTapGuide(): boolean {
  const key = `tap_guide_${new Date().toISOString().split('T')[0]}`;
  if (typeof window === 'undefined') return false;
  if (localStorage.getItem(key)) return false;
  localStorage.setItem(key, 'true');
  return true;
}

export default function FlipCard({ card, onReveal, revealed, onSwipeCheck, tenseTypeName, patternTypeName }: FlipCardProps) {
  const [showHint, setShowHint] = useState(false);
  const [showTapGuide, setShowTapGuide] = useState(false);
  const hintClickedRef = useRef(false);

  useEffect(() => {
    setShowTapGuide(shouldShowTapGuide());
  }, []);

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
    // Skip reveal if hint button was just clicked
    if (hintClickedRef.current) {
      hintClickedRef.current = false;
      return;
    }
    setShowHint(false);
    setShowTapGuide(false);
    onReveal();
  }, [onReveal]);

  const masteryCode = card.mastery_level_code || 'NEW';
  const mastery = MASTERY_LABELS[masteryCode] || MASTERY_LABELS['NEW'];

  return (
    <div className="w-full">
      <AnimatePresence mode="wait">
        <motion.div
          key={card.sentence_id + (revealed ? '-back' : '-front')}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -20 }}
          transition={{ duration: 0.25, ease: 'easeInOut' }}
          style={revealed ? { x, y, rotateZ, opacity } : undefined}
          drag={revealed ? true : false}
          dragConstraints={{ top: 0, bottom: 0, left: 0, right: 0 }}
          dragElastic={0.7}
          onDragEnd={handlePanEnd}
          onTap={handleTap}
          whileTap={!revealed ? { scale: 0.98 } : undefined}
          className={`relative rounded-2xl shadow-lg px-6 py-8 min-h-[260px] flex flex-col items-center justify-center text-center select-none touch-none border ${
            revealed
              ? 'bg-primary-50 border-primary-500/30'
              : 'bg-surface-secondary border-border'
          }`}
          role="button"
          aria-label={revealed ? `의미: ${card.meaning}, 표현: ${card.expression}` : `의미: ${card.meaning}, 탭하여 정답 보기`}
          tabIndex={0}
        >
          {/* Top row: type badges (left) + mastery badge (right) */}
          <div className="absolute top-3 left-4 right-4 flex items-start justify-between">
            <div>
              {(tenseTypeName || patternTypeName) && (
                <SkillTags tenseTypeName={tenseTypeName} patternTypeName={patternTypeName} />
              )}
            </div>
            <div>
              <span className={`inline-flex items-center text-[10px] px-1.5 py-0.5 rounded border font-medium ${mastery.color}`}>
                {mastery.label}
              </span>
            </div>
          </div>

          {/* Meaning — larger font + bold */}
          <div className="flex flex-col items-center gap-3 mt-4">
            <p className="text-2xl font-bold text-text-primary leading-relaxed">
              {card.meaning}
            </p>
            {/* Hint icon button below meaning (front side only, when hint exists) */}
            {!revealed && card.hint && (
              <button
                onClick={(e) => { e.stopPropagation(); hintClickedRef.current = true; setShowHint(!showHint); }}
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

          {/* Hint text (when toggled on front side) */}
          {!revealed && showHint && card.hint && (
            <p className="text-sm text-info leading-relaxed mt-2">{card.hint}</p>
          )}

          {revealed ? (
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 0.2 }}
              className="mt-5"
            >
              <p className="text-2xl font-bold text-primary-600 leading-relaxed">
                {card.expression}
              </p>
              {card.hint && (
                <p className="text-sm text-text-secondary mt-3">{card.hint}</p>
              )}
            </motion.div>
          ) : (
            showTapGuide && (
              <p className="mt-5 text-sm text-text-secondary">
                탭하여 정답 보기
              </p>
            )
          )}
        </motion.div>
      </AnimatePresence>

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
