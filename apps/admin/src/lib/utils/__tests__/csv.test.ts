import { validateSkillsCsv, validateSentencesCsv, validateExpressionsCsv } from '../csv';

describe('csv validators', () => {
  describe('validateSkillsCsv', () => {
    it('passes valid data', () => {
      const data = [{ name: 'Skill 1', summary: 'Test' }];
      expect(validateSkillsCsv(data)).toHaveLength(0);
    });
    it('catches missing name', () => {
      const data = [{ name: '', summary: 'Test' }];
      expect(validateSkillsCsv(data)).toHaveLength(1);
      expect(validateSkillsCsv(data)[0].field).toBe('name');
    });
  });

  describe('validateSentencesCsv', () => {
    it('passes valid data', () => {
      const data = [{ summary: '안녕하세요', summary_en: 'Hello' }];
      expect(validateSentencesCsv(data)).toHaveLength(0);
    });
    it('catches missing summary', () => {
      const data = [{ summary: '', summary_en: 'Hello' }];
      expect(validateSentencesCsv(data)).toHaveLength(1);
    });
  });

  describe('validateExpressionsCsv', () => {
    it('passes valid data', () => {
      const data = [{ language_code: 'en', expression_text: 'Hello', hint: '' }];
      expect(validateExpressionsCsv(data)).toHaveLength(0);
    });
    it('catches invalid language code', () => {
      const data = [{ language_code: 'fr', expression_text: 'Bonjour', hint: '' }];
      const errors = validateExpressionsCsv(data);
      expect(errors.length).toBeGreaterThan(0);
    });
    it('catches missing expression text', () => {
      const data = [{ language_code: 'en', expression_text: '', hint: '' }];
      expect(validateExpressionsCsv(data)).toHaveLength(1);
    });
  });
});
