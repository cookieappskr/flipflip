import Papa from 'papaparse';

export interface CsvValidationError {
  row: number;
  field: string;
  message: string;
}

export function parseCsvFile<T>(file: File): Promise<{ data: T[]; errors: CsvValidationError[] }> {
  return new Promise((resolve) => {
    Papa.parse(file, {
      header: true,
      skipEmptyLines: true,
      complete: (results) => {
        const errors: CsvValidationError[] = results.errors.map((e, i) => ({
          row: e.row ?? i,
          field: '',
          message: e.message,
        }));
        resolve({ data: results.data as T[], errors });
      },
    });
  });
}

export function downloadCsv(data: Record<string, unknown>[], filename: string) {
  const csv = Papa.unparse(data);
  const blob = new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = filename;
  link.click();
  URL.revokeObjectURL(url);
}

export function validateSkillsCsv(data: Record<string, string>[]): CsvValidationError[] {
  const errors: CsvValidationError[] = [];
  data.forEach((row, i) => {
    if (!row.name?.trim()) errors.push({ row: i, field: 'name', message: '스킬명은 필수입니다' });
  });
  return errors;
}

export function validateSentencesCsv(data: Record<string, string>[]): CsvValidationError[] {
  const errors: CsvValidationError[] = [];
  data.forEach((row, i) => {
    if (!row.summary?.trim()) errors.push({ row: i, field: 'summary', message: '문장개요(국문)는 필수입니다' });
  });
  return errors;
}

export function validateExpressionsCsv(data: Record<string, string>[]): CsvValidationError[] {
  const errors: CsvValidationError[] = [];
  const validLangs = ['en', 'es', 'zh', 'ja'];
  data.forEach((row, i) => {
    if (!row.language_code?.trim()) {
      errors.push({ row: i, field: 'language_code', message: '언어코드는 필수입니다' });
    } else if (!validLangs.includes(row.language_code)) {
      errors.push({ row: i, field: 'language_code', message: `유효한 언어코드: ${validLangs.join(', ')}` });
    }
    if (!row.expression_text?.trim()) {
      errors.push({ row: i, field: 'expression_text', message: '표현 텍스트는 필수입니다' });
    }
  });
  return errors;
}
