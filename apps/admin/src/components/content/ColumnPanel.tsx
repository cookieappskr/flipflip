'use client';

import React from 'react';

interface ColumnPanelProps {
  title: string;
  count?: number;
  onAdd?: () => void;
  children: React.ReactNode;
  loading?: boolean;
}

export default function ColumnPanel({
  title,
  count,
  onAdd,
  children,
  loading = false,
}: ColumnPanelProps) {
  return (
    <div className="flex flex-col h-full border-r border-border last:border-r-0">
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-3 border-b border-border bg-surface-secondary">
        <div className="flex items-center gap-2">
          <h3 className="text-sm font-semibold text-text-primary">{title}</h3>
          {count !== undefined && (
            <span className="inline-flex items-center rounded-full bg-neutral-100 px-2 py-0.5 text-xs font-medium text-neutral-700">
              {count}
            </span>
          )}
        </div>
        {onAdd && (
          <button
            type="button"
            onClick={onAdd}
            className="rounded-lg p-1 text-text-secondary hover:bg-neutral-100 hover:text-text-primary transition-colors"
          >
            <svg
              className="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M12 4.5v15m7.5-7.5h-15"
              />
            </svg>
          </button>
        )}
      </div>

      {/* Content */}
      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="flex items-center justify-center py-12">
            <svg
              className="animate-spin h-6 w-6 text-text-secondary"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
            >
              <circle
                className="opacity-25"
                cx="12"
                cy="12"
                r="10"
                stroke="currentColor"
                strokeWidth="4"
              />
              <path
                className="opacity-75"
                fill="currentColor"
                d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"
              />
            </svg>
          </div>
        ) : (
          children
        )}
      </div>
    </div>
  );
}
