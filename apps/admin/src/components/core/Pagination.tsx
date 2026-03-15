'use client';

import React from 'react';

interface PaginationProps {
  currentPage: number;
  totalPages: number;
  onPageChange: (page: number) => void;
}

function getPageNumbers(current: number, total: number): (number | 'ellipsis')[] {
  if (total <= 5) {
    return Array.from({ length: total }, (_, i) => i + 1);
  }

  const pages: (number | 'ellipsis')[] = [];

  if (current <= 3) {
    pages.push(1, 2, 3, 4, 'ellipsis', total);
  } else if (current >= total - 2) {
    pages.push(1, 'ellipsis', total - 3, total - 2, total - 1, total);
  } else {
    pages.push(1, 'ellipsis', current - 1, current, current + 1, 'ellipsis', total);
  }

  return pages;
}

export default function Pagination({
  currentPage,
  totalPages,
  onPageChange,
}: PaginationProps) {
  if (totalPages <= 1) return null;

  const pages = getPageNumbers(currentPage, totalPages);

  const buttonBase =
    'inline-flex items-center justify-center rounded-lg px-3 py-2 text-sm font-medium transition-colors';

  return (
    <nav className="flex items-center gap-1" aria-label="Pagination">
      {/* Previous */}
      <button
        type="button"
        disabled={currentPage <= 1}
        onClick={() => onPageChange(currentPage - 1)}
        className={[
          buttonBase,
          'text-text-secondary hover:bg-surface-secondary',
          currentPage <= 1 ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer',
        ].join(' ')}
      >
        Previous
      </button>

      {/* Page numbers */}
      {pages.map((page, idx) =>
        page === 'ellipsis' ? (
          <span
            key={`ellipsis-${idx}`}
            className="px-2 text-text-secondary select-none"
          >
            ...
          </span>
        ) : (
          <button
            key={page}
            type="button"
            onClick={() => onPageChange(page)}
            className={[
              buttonBase,
              page === currentPage
                ? 'bg-primary-600 text-white'
                : 'text-text-primary hover:bg-surface-secondary cursor-pointer',
            ].join(' ')}
          >
            {page}
          </button>
        )
      )}

      {/* Next */}
      <button
        type="button"
        disabled={currentPage >= totalPages}
        onClick={() => onPageChange(currentPage + 1)}
        className={[
          buttonBase,
          'text-text-secondary hover:bg-surface-secondary',
          currentPage >= totalPages
            ? 'opacity-50 cursor-not-allowed'
            : 'cursor-pointer',
        ].join(' ')}
      >
        Next
      </button>
    </nav>
  );
}
