'use client';

import { motion, AnimatePresence } from 'framer-motion';
import Button from '@/components/core/Button';

interface SkillUpPopupProps {
  isOpen: boolean;
  skillName: string;
  onClose: () => void;
}

export default function SkillUpPopup({ isOpen, skillName, onClose }: SkillUpPopupProps) {
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
            <div className="w-16 h-16 mx-auto bg-success/20 rounded-full flex items-center justify-center mb-4">
              <svg className="w-8 h-8 text-success" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <h2 className="text-xl font-bold text-text-primary mb-2">스킬 완료!</h2>
            <p className="text-text-secondary text-sm mb-6">
              <span className="font-medium text-primary-600">{skillName}</span> 스킬을 마스터했습니다!
            </p>
            <Button className="w-full" onClick={onClose}>
              계속하기
            </Button>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
