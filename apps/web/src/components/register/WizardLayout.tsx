'use client';

import React from 'react';

interface WizardLayoutProps {
  step: number;
  totalSteps: number;
  title: string;
  subtitle?: string;
  children: React.ReactNode;
}

export default function WizardLayout({
  step,
  totalSteps,
  title,
  subtitle,
  children,
}: WizardLayoutProps) {
  return (
    <div className="min-h-screen bg-neutral-50 flex flex-col">
      {/* Progress bar */}
      <div className="w-full h-1 bg-neutral-200">
        <div
          className="h-full bg-primary-600 transition-all duration-300"
          style={{ width: `${(step / totalSteps) * 100}%` }}
        />
      </div>

      <div className="flex-1 flex flex-col items-center px-4 py-8">
        <div className="w-full max-w-sm">
          <p className="text-xs text-text-secondary mb-2">
            {step} / {totalSteps}
          </p>
          <h1 className="text-2xl font-bold text-text-primary mb-1">{title}</h1>
          {subtitle && (
            <p className="text-sm text-text-secondary mb-6">{subtitle}</p>
          )}
          <div className="mt-4">{children}</div>
        </div>
      </div>
    </div>
  );
}
