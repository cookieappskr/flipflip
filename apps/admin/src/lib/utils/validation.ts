export function isValidHexColor(value: string): boolean {
  return /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$/.test(value);
}

export function isNotEmpty(value: string | null | undefined): boolean {
  return value != null && value.trim().length > 0;
}

export function isValidVersion(value: string): boolean {
  return /^\d+\.\d+$/.test(value);
}

export function maxLength(value: string, max: number): boolean {
  return value.length <= max;
}
