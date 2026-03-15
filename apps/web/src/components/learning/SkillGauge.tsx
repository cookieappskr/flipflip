'use client';

interface SkillGaugeProps {
  skillName: string;
  achievementScore: number;
  totalScore: number;
}

export default function SkillGauge({ skillName, achievementScore, totalScore }: SkillGaugeProps) {
  const percentage = totalScore > 0 ? Math.min(100, (achievementScore / totalScore) * 100) : 0;
  const achievementInt = Math.round(achievementScore);
  const totalInt = Math.round(totalScore);

  return (
    <div className="w-full">
      <div className="flex items-center justify-between mb-1">
        <span className="text-xs font-medium text-text-primary">{skillName}</span>
        <span className="text-xs text-text-secondary">
          {Math.round(percentage)}%
          <span className="ml-1 text-text-secondary/70">({achievementInt}/{totalInt})</span>
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
