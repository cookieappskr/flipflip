'use client';

const designTokens = {
  colors: {
    primary: {
      '50': { value: '#EEF2FF' },
      '100': { value: '#E0E7FF' },
      '500': { value: '#6366F1' },
      '600': { value: '#4F46E5' },
      '700': { value: '#4338CA' },
      '900': { value: '#312E81' },
    },
    neutral: {
      '50': { value: '#F9FAFB' },
      '100': { value: '#F3F4F6' },
      '200': { value: '#E5E7EB' },
      '500': { value: '#6B7280' },
      '700': { value: '#374151' },
      '900': { value: '#111827' },
    },
    success: { value: '#10B981' },
    warning: { value: '#F59E0B' },
    error: { value: '#EF4444' },
    info: { value: '#3B82F6' },
  },
  spacing: {
    xs: { value: '4px' },
    sm: { value: '8px' },
    md: { value: '16px' },
    lg: { value: '24px' },
    xl: { value: '32px' },
    '2xl': { value: '48px' },
    '3xl': { value: '64px' },
  },
  typography: {
    fontFamily: {
      sans: { value: 'Inter, system-ui, sans-serif' },
      mono: { value: 'JetBrains Mono, monospace' },
    },
    fontSize: {
      xs: { value: '12px' },
      sm: { value: '14px' },
      base: { value: '16px' },
      lg: { value: '18px' },
      xl: { value: '20px' },
      '2xl': { value: '24px' },
      '3xl': { value: '30px' },
    },
  },
  borderRadius: {
    sm: { value: '4px' },
    md: { value: '8px' },
    lg: { value: '12px' },
    full: { value: '9999px' },
  },
  shadow: {
    sm: { value: '0 1px 2px rgba(0,0,0,0.05)' },
    md: { value: '0 4px 6px rgba(0,0,0,0.1)' },
    lg: { value: '0 10px 15px rgba(0,0,0,0.1)' },
  },
};

function isShadeGroup(
  val: unknown
): val is Record<string, { value: string }> {
  return typeof val === 'object' && val !== null && !('value' in val);
}

export default function DesignSystemPage() {
  const { colors, spacing, typography, borderRadius, shadow } = designTokens;

  return (
    <div className="space-y-12">
      {/* Page Header */}
      <div>
        <h1 className="text-2xl font-bold text-gray-900">디자인시스템</h1>
        <p className="text-sm text-gray-500 mt-1">
          FlipFlip Design Token Reference
        </p>
      </div>

      {/* Section 1: Color Palette */}
      <section>
        <h2 className="text-lg font-semibold text-gray-800 mb-4">
          컬러 팔레트
        </h2>

        {/* Primary */}
        <div className="mb-6">
          <h3 className="text-sm font-medium text-gray-600 mb-2">Primary</h3>
          <div className="flex flex-wrap gap-3">
            {Object.entries(colors.primary).map(([shade, token]) => (
              <div key={shade} className="text-center">
                <div
                  className="w-16 h-16 rounded-md border border-gray-200"
                  style={{ backgroundColor: token.value }}
                />
                <p className="text-xs font-medium text-gray-700 mt-1">
                  {shade}
                </p>
                <p className="text-xs text-gray-400">{token.value}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Neutral */}
        <div className="mb-6">
          <h3 className="text-sm font-medium text-gray-600 mb-2">Neutral</h3>
          <div className="flex flex-wrap gap-3">
            {Object.entries(colors.neutral).map(([shade, token]) => (
              <div key={shade} className="text-center">
                <div
                  className="w-16 h-16 rounded-md border border-gray-200"
                  style={{ backgroundColor: token.value }}
                />
                <p className="text-xs font-medium text-gray-700 mt-1">
                  {shade}
                </p>
                <p className="text-xs text-gray-400">{token.value}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Status Colors */}
        <div>
          <h3 className="text-sm font-medium text-gray-600 mb-2">
            Status Colors
          </h3>
          <div className="flex flex-wrap gap-3">
            {(['success', 'warning', 'error', 'info'] as const).map((name) => {
              const token = colors[name];
              return (
                <div key={name} className="text-center">
                  <div
                    className="w-16 h-16 rounded-md border border-gray-200"
                    style={{ backgroundColor: token.value }}
                  />
                  <p className="text-xs font-medium text-gray-700 mt-1">
                    {name}
                  </p>
                  <p className="text-xs text-gray-400">{token.value}</p>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* Section 2: Typography */}
      <section>
        <h2 className="text-lg font-semibold text-gray-800 mb-4">
          타이포그래피
        </h2>

        {/* Font Families */}
        <div className="mb-6">
          <h3 className="text-sm font-medium text-gray-600 mb-2">
            Font Families
          </h3>
          <div className="space-y-3">
            {Object.entries(typography.fontFamily).map(([name, token]) => (
              <div
                key={name}
                className="p-4 bg-white border border-gray-200 rounded-md"
              >
                <p className="text-xs text-gray-400 mb-1">
                  {name} — {token.value}
                </p>
                <p
                  className="text-lg text-gray-900"
                  style={{ fontFamily: token.value }}
                >
                  The quick brown fox jumps over the lazy dog. 빠른 갈색 여우가
                  게으른 개를 뛰어넘습니다.
                </p>
              </div>
            ))}
          </div>
        </div>

        {/* Font Sizes */}
        <div>
          <h3 className="text-sm font-medium text-gray-600 mb-2">
            Font Sizes
          </h3>
          <div className="space-y-2">
            {Object.entries(typography.fontSize).map(([name, token]) => (
              <div
                key={name}
                className="flex items-baseline gap-4 p-3 bg-white border border-gray-200 rounded-md"
              >
                <span className="text-xs text-gray-400 w-16 shrink-0">
                  {name} ({token.value})
                </span>
                <span
                  className="text-gray-900"
                  style={{ fontSize: token.value }}
                >
                  FlipFlip Design System
                </span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Section 3: Spacing Scale */}
      <section>
        <h2 className="text-lg font-semibold text-gray-800 mb-4">스페이싱</h2>
        <div className="space-y-2">
          {Object.entries(spacing).map(([name, token]) => (
            <div key={name} className="flex items-center gap-4">
              <span className="text-xs text-gray-500 w-16 shrink-0 text-right">
                {name} ({token.value})
              </span>
              <div
                className="h-6 rounded-sm"
                style={{
                  width: token.value,
                  backgroundColor: colors.primary['500'].value,
                }}
              />
            </div>
          ))}
        </div>
      </section>

      {/* Section 4: Component Showcase */}
      <section>
        <h2 className="text-lg font-semibold text-gray-800 mb-4">
          컴포넌트 쇼케이스
        </h2>

        {/* Border Radius */}
        <div className="mb-6">
          <h3 className="text-sm font-medium text-gray-600 mb-2">
            Border Radius
          </h3>
          <div className="flex flex-wrap gap-4">
            {Object.entries(borderRadius).map(([name, token]) => (
              <div key={name} className="text-center">
                <div
                  className="w-20 h-20 border-2 border-gray-300 bg-gray-50"
                  style={{ borderRadius: token.value }}
                />
                <p className="text-xs font-medium text-gray-700 mt-1">
                  {name}
                </p>
                <p className="text-xs text-gray-400">{token.value}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Shadows */}
        <div className="mb-6">
          <h3 className="text-sm font-medium text-gray-600 mb-2">Shadow</h3>
          <div className="flex flex-wrap gap-6">
            {Object.entries(shadow).map(([name, token]) => (
              <div key={name} className="text-center">
                <div
                  className="w-24 h-24 bg-white rounded-lg"
                  style={{ boxShadow: token.value }}
                />
                <p className="text-xs font-medium text-gray-700 mt-2">
                  {name}
                </p>
              </div>
            ))}
          </div>
        </div>

        {/* Button Variants */}
        <div>
          <h3 className="text-sm font-medium text-gray-600 mb-2">
            Button Variants
          </h3>
          <div className="flex flex-wrap gap-3">
            <button
              className="px-4 py-2 text-sm font-medium text-white rounded-md transition-opacity hover:opacity-90"
              style={{ backgroundColor: colors.primary['600'].value }}
            >
              Primary
            </button>
            <button
              className="px-4 py-2 text-sm font-medium text-white rounded-md transition-opacity hover:opacity-90"
              style={{ backgroundColor: colors.success.value }}
            >
              Success
            </button>
            <button
              className="px-4 py-2 text-sm font-medium text-white rounded-md transition-opacity hover:opacity-90"
              style={{ backgroundColor: colors.error.value }}
            >
              Danger
            </button>
          </div>
        </div>
      </section>
    </div>
  );
}
