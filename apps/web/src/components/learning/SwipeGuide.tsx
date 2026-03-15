'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import Button from '@/components/core/Button';

interface SwipeGuideProps {
  isOpen: boolean;
  onClose: () => void;
}

function useIsTouchDevice() {
  const [isTouch, setIsTouch] = useState(false);
  useEffect(() => {
    setIsTouch('ontouchstart' in window || navigator.maxTouchPoints > 0);
  }, []);
  return isTouch;
}

export default function SwipeGuide({ isOpen, onClose }: SwipeGuideProps) {
  const isTouch = useIsTouchDevice();

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-50 flex items-center justify-center p-6 bg-black/60"
          onClick={onClose}
        >
          <motion.div
            initial={{ scale: 0.9, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            exit={{ scale: 0.9, opacity: 0 }}
            className="bg-surface rounded-2xl shadow-xl p-6 w-full max-w-xs text-center"
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="text-lg font-bold text-text-primary mb-4">
              {isTouch ? '학습 제스처 안내' : '학습 키보드 안내'}
            </h2>

            {isTouch ? (
              <>
                {/* Mobile: Swipe illustration */}
                <div className="relative w-40 h-48 mx-auto mb-4 bg-neutral-100 rounded-xl border-2 border-dashed border-neutral-300 flex items-center justify-center">
                  <span className="text-sm text-text-secondary font-medium">카드</span>

                  {/* Tap */}
                  <div className="absolute -top-2 left-1/2 -translate-x-1/2 -translate-y-full pt-1">
                    <span className="text-[10px] text-text-secondary bg-surface px-1.5 py-0.5 rounded border border-border">
                      탭 = 뒤집기
                    </span>
                  </div>

                  {/* Right arrow — perfect */}
                  <div className="absolute top-1/2 -right-2 translate-x-full -translate-y-1/2">
                    <svg className="w-5 h-5 text-success" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                    </svg>
                  </div>

                  {/* Left arrow — missed */}
                  <div className="absolute top-1/2 -left-2 -translate-x-full -translate-y-1/2">
                    <svg className="w-5 h-5 text-error" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                  </div>

                  {/* Down arrow — mostly */}
                  <div className="absolute -bottom-2 left-1/2 -translate-x-1/2 translate-y-full">
                    <svg className="w-5 h-5 text-warning" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
                    </svg>
                  </div>
                </div>

                {/* Mobile legend */}
                <div className="space-y-2 text-sm text-left mb-5">
                  <div className="flex items-center gap-3">
                    <span className="w-2 h-2 rounded-full bg-text-secondary flex-shrink-0" />
                    <span className="text-text-primary"><strong>탭</strong> — 앞/뒷면 바꾸기</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <span className="w-2 h-2 rounded-full bg-error flex-shrink-0" />
                    <span className="text-text-primary"><strong>왼쪽으로 쓸기</strong> — 못 맞춤</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <span className="w-2 h-2 rounded-full bg-warning flex-shrink-0" />
                    <span className="text-text-primary"><strong>아래로 쓸기</strong> — 대부분 맞춤</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <span className="w-2 h-2 rounded-full bg-success flex-shrink-0" />
                    <span className="text-text-primary"><strong>오른쪽으로 쓸기</strong> — 완벽히 맞춤</span>
                  </div>
                </div>
              </>
            ) : (
              <>
                {/* PC: Keyboard shortcut guide */}
                <div className="space-y-3 text-sm text-left mb-5">
                  <div className="flex items-center gap-3">
                    <kbd className="inline-flex items-center justify-center w-8 h-8 rounded-lg border border-border bg-neutral-100 text-xs font-mono font-bold text-text-primary flex-shrink-0">↑</kbd>
                    <span className="text-text-primary">앞/뒷면 바꾸기 (토글)</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <kbd className="inline-flex items-center justify-center w-8 h-8 rounded-lg border border-border bg-neutral-100 text-xs font-mono font-bold text-text-primary flex-shrink-0">Enter</kbd>
                    <span className="text-text-primary">앞/뒷면 바꾸기 (토글)</span>
                  </div>
                  <hr className="border-border" />
                  <div className="flex items-center gap-3">
                    <kbd className="inline-flex items-center justify-center w-8 h-8 rounded-lg border border-border bg-error/10 text-xs font-mono font-bold text-error flex-shrink-0">←</kbd>
                    <span className="text-text-primary">못 맞춤</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <kbd className="inline-flex items-center justify-center w-8 h-8 rounded-lg border border-border bg-warning/10 text-xs font-mono font-bold text-warning flex-shrink-0">↓</kbd>
                    <span className="text-text-primary">대부분 맞춤</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <kbd className="inline-flex items-center justify-center w-8 h-8 rounded-lg border border-border bg-success/10 text-xs font-mono font-bold text-success flex-shrink-0">→</kbd>
                    <span className="text-text-primary">완벽히 맞춤</span>
                  </div>
                </div>
              </>
            )}

            <Button className="w-full" onClick={onClose}>
              알겠습니다
            </Button>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
