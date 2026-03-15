'use client';

import { useRef, useCallback, useState } from 'react';
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

export default function FlipCard({ card, onReveal, revealed, onSwipeCheck, tenseTypeName, patternTypeName }: FlipCardProps) {
  const [showHint, setShowHint] = useState(false);
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

      // Right swipe = perfect (완벽히맞춤)
      if (offset.x > SWIPE_THRESHOLD && Math.abs(offset.y) < SWIPE_THRESHOLD) {
        onSwipeCheck('PERFECT');
        return;
      }
      // Down swipe = mostly (대부분맞춤)
      if (offset.y > SWIPE_THRESHOLD && Math.abs(offset.x) < SWIPE_THRESHOLD) {
        onSwipeCheck('MOSTLY');
        return;
      }
      // Left swipe = missed (못맞춤)
      if (offset.x < -SWIPE_THRESHOLD) {
        onSwipeCheck('MISSED');
        return;
      }
    },
    [revealed, onSwipeCheck]
  );

  const handleTap = useCallback(() => {
    setShowHint(false);
    onReveal(); // toggle front/back
  }, [onReveal]);

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
          className={`rounded-2xl shadow-lg p-8 min-h-[240px] flex flex-col items-center justify-center text-center select-none touch-none border ${
            revealed
              ? 'bg-primary-50 border-primary-500/30'
              : 'bg-surface-secondary border-border'
          }`}
          role="button"
          aria-label={revealed ? `의미: ${card.meaning}, 표현: ${card.expression}` : `의미: ${card.meaning}, 탭하여 정답 보기`}
          tabIndex={0}
        >
          {/* Type badges (inside card) */}
          {(tenseTypeName || patternTypeName) && (
            <div className="mb-3">
              <SkillTags tenseTypeName={tenseTypeName} patternTypeName={patternTypeName} />
            </div>
          )}

          {/* Meaning (always shown) */}
          <p className="text-lg font-medium text-text-primary leading-relaxed">
            {card.meaning}
          </p>

          {revealed ? (
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 0.2 }}
              className="mt-6"
            >
              <p className="text-2xl font-bold text-primary-600 leading-relaxed">
                {card.expression}
              </p>
              {card.hint && (
                <p className="text-sm text-text-secondary mt-3">{card.hint}</p>
              )}
            </motion.div>
          ) : (
            <div className="mt-6 flex flex-col items-center gap-2">
              {/* Hint toggle (front side only) */}
              {card.hint && (
                showHint ? (
                  <p className="text-sm text-info leading-relaxed">{card.hint}</p>
                ) : (
                  <button
                    onClick={(e) => { e.stopPropagation(); setShowHint(true); }}
                    className="text-xs text-text-secondary hover:text-info transition-colors underline"
                  >
                    힌트 보기
                  </button>
                )
              )}
              <p className="text-sm text-text-secondary">
                탭하여 정답 보기
              </p>
            </div>
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
