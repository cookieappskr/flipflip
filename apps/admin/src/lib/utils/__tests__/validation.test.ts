import { isValidHexColor, isNotEmpty, isValidVersion, maxLength } from '../validation';

describe('validation utils', () => {
  describe('isValidHexColor', () => {
    it('accepts valid 6-digit hex', () => {
      expect(isValidHexColor('#FF0000')).toBe(true);
      expect(isValidHexColor('#abc123')).toBe(true);
    });
    it('accepts valid 3-digit hex', () => {
      expect(isValidHexColor('#FFF')).toBe(true);
    });
    it('rejects invalid hex', () => {
      expect(isValidHexColor('FF0000')).toBe(false);
      expect(isValidHexColor('#GG0000')).toBe(false);
      expect(isValidHexColor('#12345')).toBe(false);
      expect(isValidHexColor('')).toBe(false);
    });
  });

  describe('isNotEmpty', () => {
    it('returns true for non-empty strings', () => {
      expect(isNotEmpty('hello')).toBe(true);
    });
    it('returns false for empty/null/undefined', () => {
      expect(isNotEmpty('')).toBe(false);
      expect(isNotEmpty('   ')).toBe(false);
      expect(isNotEmpty(null)).toBe(false);
      expect(isNotEmpty(undefined)).toBe(false);
    });
  });

  describe('isValidVersion', () => {
    it('accepts valid versions', () => {
      expect(isValidVersion('1.0')).toBe(true);
      expect(isValidVersion('2.1')).toBe(true);
    });
    it('rejects invalid versions', () => {
      expect(isValidVersion('1')).toBe(false);
      expect(isValidVersion('1.0.0')).toBe(false);
      expect(isValidVersion('v1.0')).toBe(false);
    });
  });

  describe('maxLength', () => {
    it('checks string length', () => {
      expect(maxLength('hello', 5)).toBe(true);
      expect(maxLength('hello', 4)).toBe(false);
      expect(maxLength('', 0)).toBe(true);
    });
  });
});
