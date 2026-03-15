'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import Button from '@/components/core/Button';

const slides = [
  {
    title: '카드를 넘기며 학습해요',
    description: '모국어 의미를 보고, 학습 언어로 표현해보세요.\n간단한 카드 플립으로 쉽게 학습합니다.',
    emoji: '🃏',
  },
  {
    title: '스마트한 복습 시스템',
    description: '망각곡선 이론에 기반한 최적의 복습 시점을\n자동으로 계산하여 알려드립니다.',
    emoji: '🧠',
  },
  {
    title: '체계적인 레벨 시스템',
    description: '1~100 레벨, 스킬 단위의 학습으로\n단계적으로 실력을 쌓아가세요.',
    emoji: '📈',
  },
  {
    title: '하루 5분이면 충분해요',
    description: '짧은 시간으로도 효과적인 학습!\n꾸준히 하면 놀라운 변화가 찾아옵니다.',
    emoji: '⏰',
  },
];

export default function OnboardingPage() {
  const router = useRouter();
  const [currentSlide, setCurrentSlide] = useState(0);

  const handleComplete = () => {
    localStorage.setItem('onboarding_seen', 'true');
    router.push('/login');
  };

  const isLast = currentSlide === slides.length - 1;

  return (
    <div className="min-h-screen bg-neutral-50 flex flex-col items-center justify-center px-4">
      <div className="w-full max-w-sm">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentSlide}
            initial={{ opacity: 0, x: 50 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: -50 }}
            transition={{ duration: 0.25 }}
            className="text-center py-8"
          >
            <div className="text-6xl mb-6">{slides[currentSlide].emoji}</div>
            <h2 className="text-2xl font-bold text-text-primary mb-3">
              {slides[currentSlide].title}
            </h2>
            <p className="text-sm text-text-secondary whitespace-pre-line leading-relaxed">
              {slides[currentSlide].description}
            </p>
          </motion.div>
        </AnimatePresence>

        {/* Dots */}
        <div className="flex justify-center gap-2 mb-8">
          {slides.map((_, i) => (
            <div
              key={i}
              className={[
                'w-2 h-2 rounded-full transition-colors',
                i === currentSlide ? 'bg-primary-600' : 'bg-neutral-300',
              ].join(' ')}
            />
          ))}
        </div>

        <Button className="w-full" size="lg" onClick={isLast ? handleComplete : () => setCurrentSlide(currentSlide + 1)}>
          {isLast ? '시작하기' : '다음'}
        </Button>

        {!isLast && (
          <button
            onClick={handleComplete}
            className="w-full mt-3 text-sm text-text-secondary text-center hover:text-text-primary"
          >
            건너뛰기
          </button>
        )}
      </div>
    </div>
  );
}
