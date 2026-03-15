'use client';

import { motion, AnimatePresence } from 'framer-motion';
import Button from '@/components/core/Button';

interface LevelUpPopupProps {
  isOpen: boolean;
  newLevel: number;
  onClose: () => void;
}

export default function LevelUpPopup({ isOpen, newLevel, onClose }: LevelUpPopupProps) {
  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50"
        >
          <motion.div
            initial={{ scale: 0.8, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            exit={{ scale: 0.8, opacity: 0 }}
            transition={{ type: 'spring', damping: 20 }}
            className="bg-surface rounded-2xl shadow-xl p-8 w-full max-w-xs text-center"
          >
            <div className="w-16 h-16 mx-auto bg-primary-100 rounded-full flex items-center justify-center mb-4">
              <span className="text-2xl font-bold text-primary-600">{newLevel}</span>
            </div>
            <h2 className="text-xl font-bold text-text-primary mb-2">레벨 업!</h2>
            <p className="text-text-secondary text-sm mb-6">
              레벨 <span className="font-bold text-primary-600">{newLevel}</span>로 올라갔습니다!
            </p>
            <Button className="w-full" onClick={onClose}>
              새로운 학습 시작
            </Button>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
