import { truncate, formatDate } from '../format';

describe('format utils', () => {
  describe('truncate', () => {
    it('returns original if within limit', () => {
      expect(truncate('hello', 10)).toBe('hello');
    });
    it('truncates with ellipsis', () => {
      expect(truncate('hello world', 5)).toBe('hello...');
    });
    it('handles exact length', () => {
      expect(truncate('hello', 5)).toBe('hello');
    });
  });

  describe('formatDate', () => {
    it('formats date string', () => {
      const result = formatDate('2026-03-15T12:00:00Z');
      expect(result).toContain('2026');
    });
    it('returns dash for null', () => {
      expect(formatDate(null)).toBe('-');
    });
  });
});
