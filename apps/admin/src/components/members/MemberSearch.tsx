'use client';

import React from 'react';
import SearchInput from '@/components/core/SearchInput';

type SearchField = 'nickname' | 'phone' | 'email';

interface MemberSearchProps {
  value: string;
  searchField: SearchField;
  onSearchChange: (value: string) => void;
  onFieldChange: (field: SearchField) => void;
}

const fieldOptions: { value: SearchField; label: string }[] = [
  { value: 'nickname', label: '닉네임' },
  { value: 'phone', label: '전화번호' },
  { value: 'email', label: '이메일' },
];

export default function MemberSearch({
  value,
  searchField,
  onSearchChange,
  onFieldChange,
}: MemberSearchProps) {
  return (
    <div className="flex items-center gap-4">
      <div className="flex items-center gap-2">
        {fieldOptions.map((opt) => (
          <label
            key={opt.value}
            className="inline-flex items-center gap-1.5 cursor-pointer"
          >
            <input
              type="radio"
              name="searchField"
              value={opt.value}
              checked={searchField === opt.value}
              onChange={() => onFieldChange(opt.value)}
              className="text-primary-600 focus:ring-primary-500"
            />
            <span className="text-sm text-text-primary">{opt.label}</span>
          </label>
        ))}
      </div>

      <div className="flex-1">
        <SearchInput
          value={value}
          onChange={onSearchChange}
          placeholder={`Search by ${searchField}...`}
        />
      </div>
    </div>
  );
}
