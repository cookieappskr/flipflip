'use client';

interface SkillGaugeProps {
  skillName: string;
  achievementScore: number;
  totalScore: number;
  skillUpRatio?: number; // e.g. 80 means skill-up at 80% of totalScore
}

export default function SkillGauge({ skillName, achievementScore, totalScore, skillUpRatio = 80 }: SkillGaugeProps) {
  // The gauge target is the skill-up threshold, not the absolute total
  const skillUpTarget = totalScore * (skillUpRatio / 100);
  const percentage = skillUpTarget > 0 ? Math.min(100, (achievementScore / skillUpTarget) * 100) : 0;
  const achievementInt = Math.round(achievementScore);
  const targetInt = Math.round(skillUpTarget);

  return (
    <div className="w-full">
      <div className="flex items-center justify-between mb-1">
        <span className="text-xs font-medium text-text-primary">{skillName} 스킬</span>
        <span className="text-xs text-text-secondary">
          {Math.round(percentage)}%
          <span className="ml-1 text-text-secondary/70">({achievementInt}/{targetInt})</span>
        </span>
      </div>
      <div className="w-full h-2 bg-neutral-200 rounded-full overflow-hidden">
        <div
          className="h-full bg-primary-600 rounded-full transition-all duration-500 ease-out"
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}
