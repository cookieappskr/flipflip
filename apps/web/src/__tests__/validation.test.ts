import { validateNickname, validateEmail, isAdult, validatePhone } from '@/lib/utils/validation';

describe('validateNickname', () => {
  it('rejects empty nickname', () => {
    expect(validateNickname('')).toEqual({ valid: false, error: '닉네임은 2자 이상이어야 합니다.' });
  });

  it('rejects too short nickname', () => {
    expect(validateNickname('a')).toEqual({ valid: false, error: '닉네임은 2자 이상이어야 합니다.' });
  });

  it('rejects too long nickname', () => {
    expect(validateNickname('a'.repeat(17))).toEqual({ valid: false, error: '닉네임은 16자 이하여야 합니다.' });
  });

  it('rejects special characters', () => {
    expect(validateNickname('test!@#')).toEqual({ valid: false, error: '한글, 영문, 숫자만 사용할 수 있습니다.' });
  });

  it('rejects spaces', () => {
    expect(validateNickname('te st')).toEqual({ valid: false, error: '한글, 영문, 숫자만 사용할 수 있습니다.' });
  });

  it('rejects banned words', () => {
    expect(validateNickname('admin123')).toEqual({ valid: false, error: '사용할 수 없는 닉네임입니다.' });
    expect(validateNickname('관리자test')).toEqual({ valid: false, error: '사용할 수 없는 닉네임입니다.' });
  });

  it('accepts valid Korean nickname', () => {
    expect(validateNickname('테스트')).toEqual({ valid: true });
  });

  it('accepts valid English nickname', () => {
    expect(validateNickname('testuser')).toEqual({ valid: true });
  });

  it('accepts valid mixed nickname', () => {
    expect(validateNickname('테스트123')).toEqual({ valid: true });
  });

  it('accepts 16 character nickname', () => {
    expect(validateNickname('a'.repeat(16))).toEqual({ valid: true });
  });
});

describe('validateEmail', () => {
  it('accepts valid email', () => {
    expect(validateEmail('test@example.com')).toBe(true);
  });

  it('rejects invalid email', () => {
    expect(validateEmail('notanemail')).toBe(false);
    expect(validateEmail('@no.com')).toBe(false);
    expect(validateEmail('test@')).toBe(false);
  });
});

describe('isAdult', () => {
  it('returns true for adult (KR, 19+)', () => {
    const birth = new Date();
    birth.setFullYear(birth.getFullYear() - 20);
    expect(isAdult(birth.toISOString().split('T')[0], 'KR')).toBe(true);
  });

  it('returns false for minor (KR, <19)', () => {
    const birth = new Date();
    birth.setFullYear(birth.getFullYear() - 18);
    expect(isAdult(birth.toISOString().split('T')[0], 'KR')).toBe(false);
  });

  it('returns true for adult (US, 18+)', () => {
    const birth = new Date();
    birth.setFullYear(birth.getFullYear() - 18);
    expect(isAdult(birth.toISOString().split('T')[0], 'US')).toBe(true);
  });

  it('returns false for minor (US, <18)', () => {
    const birth = new Date();
    birth.setFullYear(birth.getFullYear() - 17);
    expect(isAdult(birth.toISOString().split('T')[0], 'US')).toBe(false);
  });
});

describe('validatePhone', () => {
  it('accepts Korean phone number', () => {
    expect(validatePhone('010-1234-5678')).toBe(true);
  });

  it('accepts international format', () => {
    expect(validatePhone('+82-10-1234-5678')).toBe(true);
  });

  it('rejects too short', () => {
    expect(validatePhone('123')).toBe(false);
  });
});
