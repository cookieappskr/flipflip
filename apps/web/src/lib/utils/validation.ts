// Validation utilities for FlipFlip

const BANNED_WORDS = ['admin', 'flipflip', '관리자', '운영자', '섹스', '시발', '씨발'];

export function validateNickname(nickname: string): { valid: boolean; error?: string } {
  if (!nickname || nickname.length < 2) {
    return { valid: false, error: '닉네임은 2자 이상이어야 합니다.' };
  }
  if (nickname.length > 16) {
    return { valid: false, error: '닉네임은 16자 이하여야 합니다.' };
  }
  if (!/^[가-힣a-zA-Z0-9]+$/.test(nickname)) {
    return { valid: false, error: '한글, 영문, 숫자만 사용할 수 있습니다.' };
  }
  const lower = nickname.toLowerCase();
  if (BANNED_WORDS.some((word) => lower.includes(word))) {
    return { valid: false, error: '사용할 수 없는 닉네임입니다.' };
  }
  return { valid: true };
}

export function validateEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

export function isAdult(birthDate: string, countryCode: string = 'KR'): boolean {
  const adultAge = countryCode === 'KR' ? 19 : 18;
  const birth = new Date(birthDate);
  const today = new Date();
  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();
  if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
    age--;
  }
  return age >= adultAge;
}

export function validatePhone(phone: string): boolean {
  // Accept various phone formats
  const cleaned = phone.replace(/[\s\-\(\)]/g, '');
  return /^\+?\d{10,15}$/.test(cleaned);
}
