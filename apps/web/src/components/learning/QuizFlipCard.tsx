'use client';

import { useCallback, useState, useEffect, useImperativeHandle, forwardRef, useRef } from 'react';
import { motion, useMotionValue, useTransform, AnimatePresence, type PanInfo } from 'framer-motion';
import type { CheckType } from '@/types/database';

const SWIPE_THRESHOLD = 60;

export interface QuizFlipCardRef {
  /** Trigger a check — fires onCheck immediately, next card flips in */
  triggerCheck: (type: CheckType) => void;
  /** Toggle flip (reveal/unreveal) programmatically */
  flip: () => void;
}

interface QuizFlipCardProps {
  /** Unique key per card — triggers enter animation on change */
  cardKey: string;
  /** Content rendered on the front face (question) */
  frontContent: React.ReactNode;
  /** Content rendered on the back face (answer) */
  backContent: React.ReactNode;
  /** Called when the revealed state changes via tap toggle */
  onRevealChange?: (revealed: boolean) => void;
  /** Called immediately when check triggers */
  onCheck?: (type: CheckType) => void;
  /** Additional class for the outer wrapper */
  className?: string;
}

const QuizFlipCard = forwardRef<QuizFlipCardRef, QuizFlipCardProps>(
  function QuizFlipCard({ cardKey, frontContent, backContent, onRevealChange, onCheck, className }, ref) {
    // flipCount tracks total flips: even = front, odd = back
    // Tap reveal: +1 (forward), tap toggle back: -1 (backward)
    // Check: fires onCheck immediately, next card enters fresh
    const [flipCount, setFlipCount] = useState(0);
    const [prevCardKey, setPrevCardKey] = useState(cardKey);
    const revealed = flipCount % 2 === 1;

    // Reset state SYNCHRONOUSLY when card changes (avoid stale rotation in AnimatePresence)
    if (cardKey !== prevCardKey) {
      setPrevCardKey(cardKey);
      setFlipCount(0);
    }

    // Notify parent of reveal changes
    useEffect(() => {
      onRevealChange?.(revealed);
    }, [revealed]);

    // Swipe motion values
    const x = useMotionValue(0);
    const y = useMotionValue(0);
    const rotateZ = useTransform(x, [-200, 0, 200], [-8, 0, 8]);
    const motionOpacity = useTransform(
      [x, y],
      ([latestX, latestY]: number[]) => {
        const dist = Math.max(Math.abs(latestX), Math.abs(latestY));
        return dist > SWIPE_THRESHOLD ? 0.7 : 1;
      }
    );

    const doCheck = useCallback((type: CheckType) => {
      // Fire immediately — parent advances to next card, new cardKey triggers fresh mount
      onCheck?.(type);
    }, [onCheck]);

    const handleTap = useCallback(() => {
      if (revealed) {
        // Toggle back: opposite direction (decrement)
        setFlipCount((c) => c - 1);
      } else {
        // Reveal: forward direction (increment)
        setFlipCount((c) => c + 1);
      }
    }, [revealed]);

    // Expose triggerCheck and flip to parent via ref
    useImperativeHandle(ref, () => ({
      triggerCheck: doCheck,
      flip: handleTap,
    }), [doCheck, handleTap]);

    const handlePanEnd = useCallback(
      (_: any, info: PanInfo) => {
        if (!revealed) return;
        const { offset } = info;
        if (offset.x > SWIPE_THRESHOLD && Math.abs(offset.y) < SWIPE_THRESHOLD) {
          doCheck('PERFECT');
          return;
        }
        if (offset.y > SWIPE_THRESHOLD && Math.abs(offset.x) < SWIPE_THRESHOLD) {
          doCheck('MOSTLY');
          return;
        }
        if (offset.x < -SWIPE_THRESHOLD) {
          doCheck('MISSED');
          return;
        }
      },
      [revealed, doCheck]
    );

    const rotation = flipCount * 180;

    return (
      <div className={className} style={{ perspective: '1000px' }}>
        <AnimatePresence mode="wait">
          <motion.div
            key={cardKey}
            initial={{ rotateY: rotation - 90, opacity: 0 }}
            animate={{ rotateY: rotation, opacity: 1 }}
            exit={{ rotateY: rotation + 90, opacity: 0 }}
            transition={{ duration: revealed ? 0.5 : 0.25, ease: [0.23, 1, 0.32, 1] }}
            style={{
              transformStyle: 'preserve-3d',
              ...(revealed ? { x, y, rotateZ, opacity: motionOpacity } : {}),
            }}
            drag={revealed}
            dragConstraints={{ top: 0, bottom: 0, left: 0, right: 0 }}
            dragElastic={0.7}
            onDragEnd={handlePanEnd}
            onTap={handleTap}
            whileTap={!revealed ? { scale: 0.98 } : undefined}
            className="relative rounded-2xl shadow-lg min-h-[260px] select-none touch-none cursor-pointer"
            role="button"
            tabIndex={0}
          >
            {/* Front face */}
            <div
              className="absolute inset-0 rounded-2xl px-6 py-8 flex flex-col items-center justify-center text-center border bg-surface-secondary border-border"
              style={{ backfaceVisibility: 'hidden' }}
            >
              {frontContent}
            </div>

            {/* Back face */}
            <div
              className="absolute inset-0 rounded-2xl px-6 py-8 flex flex-col items-center justify-center text-center border bg-primary-50 border-primary-500/30"
              style={{ backfaceVisibility: 'hidden', transform: 'rotateY(180deg)' }}
            >
              {backContent}
            </div>
          </motion.div>
        </AnimatePresence>
      </div>
    );
  }
);

export default QuizFlipCard;
