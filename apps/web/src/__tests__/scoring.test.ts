import {
  calculateAccumulatedScore,
  determineMasteryLevel,
  calculateNextReviewAt,
  calculateSkillAchievement,
  calculateSkillTotalScore,
  checkSkillUp,
  checkLevelUp,
  type MasteryLevel,
} from '@/lib/utils/scoring';

const masteryLevels: MasteryLevel[] = [
  { type_id: '1', code: 'FIRST_MEMORIZE', base_score: 0, interval_minutes: 30, display_order: 1 },
  { type_id: '2', code: 'WEAK', base_score: 1, interval_minutes: 240, display_order: 2 },
  { type_id: '3', code: 'FAMILIAR', base_score: 3, interval_minutes: 1440, display_order: 3 },
  { type_id: '4', code: 'VERY_FAMILIAR', base_score: 5, interval_minutes: 10080, display_order: 4 },
  { type_id: '5', code: 'PERFECT_MASTERY', base_score: 8, interval_minutes: 43200, display_order: 5 },
];

describe('calculateAccumulatedScore', () => {
  it('adds positive score', () => {
    expect(calculateAccumulatedScore(3, 2)).toBe(5);
  });

  it('adds fractional score', () => {
    expect(calculateAccumulatedScore(2, 0.5)).toBe(2.5);
  });

  it('subtracts negative score', () => {
    expect(calculateAccumulatedScore(3, -1)).toBe(2);
  });

  it('floors at 0', () => {
    expect(calculateAccumulatedScore(0, -1)).toBe(0);
    expect(calculateAccumulatedScore(0.5, -1)).toBe(0);
  });
});

describe('determineMasteryLevel', () => {
  it('returns FIRST_MEMORIZE for score 0', () => {
    const level = determineMasteryLevel(0, masteryLevels);
    expect(level.code).toBe('FIRST_MEMORIZE');
  });

  it('returns WEAK for score 1', () => {
    const level = determineMasteryLevel(1, masteryLevels);
    expect(level.code).toBe('WEAK');
  });

  it('returns FAMILIAR for score 3', () => {
    const level = determineMasteryLevel(3, masteryLevels);
    expect(level.code).toBe('FAMILIAR');
  });

  it('returns VERY_FAMILIAR for score 5', () => {
    const level = determineMasteryLevel(5, masteryLevels);
    expect(level.code).toBe('VERY_FAMILIAR');
  });

  it('returns PERFECT_MASTERY for score 8+', () => {
    const level = determineMasteryLevel(8, masteryLevels);
    expect(level.code).toBe('PERFECT_MASTERY');
    expect(determineMasteryLevel(10, masteryLevels).code).toBe('PERFECT_MASTERY');
  });

  it('returns correct level for intermediate scores', () => {
    expect(determineMasteryLevel(2.5, masteryLevels).code).toBe('WEAK');
    expect(determineMasteryLevel(4, masteryLevels).code).toBe('FAMILIAR');
    expect(determineMasteryLevel(7, masteryLevels).code).toBe('VERY_FAMILIAR');
  });
});

describe('calculateNextReviewAt', () => {
  it('adds interval minutes to date', () => {
    const baseDate = new Date('2026-03-15T10:00:00Z');
    const result = calculateNextReviewAt(30, baseDate);
    expect(result.toISOString()).toBe('2026-03-15T10:30:00.000Z');
  });

  it('handles large intervals', () => {
    const baseDate = new Date('2026-03-15T10:00:00Z');
    const result = calculateNextReviewAt(1440, baseDate); // 1 day
    expect(result.toISOString()).toBe('2026-03-16T10:00:00.000Z');
  });
});

describe('calculateSkillAchievement', () => {
  it('sums mastery scores', () => {
    expect(
      calculateSkillAchievement([
        { mastery_score: 3 },
        { mastery_score: 5 },
        { mastery_score: 1 },
      ])
    ).toBe(9);
  });

  it('returns 0 for empty array', () => {
    expect(calculateSkillAchievement([])).toBe(0);
  });
});

describe('calculateSkillTotalScore', () => {
  it('multiplies sentence count by perfect score', () => {
    expect(calculateSkillTotalScore(5)).toBe(40);
    expect(calculateSkillTotalScore(10)).toBe(80);
  });

  it('uses custom perfect score', () => {
    expect(calculateSkillTotalScore(5, 10)).toBe(50);
  });
});

describe('checkSkillUp', () => {
  it('returns true when achievement >= 80% of total', () => {
    expect(checkSkillUp(32, 40)).toBe(true); // 80%
    expect(checkSkillUp(35, 40)).toBe(true); // 87.5%
  });

  it('returns false when achievement < 80% of total', () => {
    expect(checkSkillUp(31, 40)).toBe(false); // 77.5%
    expect(checkSkillUp(0, 40)).toBe(false);
  });

  it('handles custom ratio', () => {
    expect(checkSkillUp(30, 40, 70)).toBe(true); // 75% >= 70%
    expect(checkSkillUp(30, 40, 80)).toBe(false); // 75% < 80%
  });

  it('returns false for zero total', () => {
    expect(checkSkillUp(0, 0)).toBe(false);
  });
});

describe('checkLevelUp', () => {
  it('returns true when all skills are cleared', () => {
    expect(
      checkLevelUp([
        { is_cleared: true },
        { is_cleared: true },
        { is_cleared: true },
      ])
    ).toBe(true);
  });

  it('returns false when any skill is not cleared', () => {
    expect(
      checkLevelUp([
        { is_cleared: true },
        { is_cleared: false },
        { is_cleared: true },
      ])
    ).toBe(false);
  });

  it('returns false for empty skills', () => {
    expect(checkLevelUp([])).toBe(false);
  });
});
