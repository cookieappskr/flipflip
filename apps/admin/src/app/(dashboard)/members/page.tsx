'use client';

import React, { useState } from 'react';
import MemberSearch from '@/components/members/MemberSearch';
import MemberTable from '@/components/members/MemberTable';
import Pagination from '@/components/core/Pagination';
import { useMembers } from '@/lib/hooks/useMembers';

type SearchField = 'nickname' | 'phone' | 'email';

export default function MembersPage() {
  const [search, setSearch] = useState('');
  const [searchField, setSearchField] = useState<SearchField>('nickname');
  const [page, setPage] = useState(1);
  const pageSize = 20;

  const { members, totalCount, loading } = useMembers({
    page: page - 1, // hook uses 0-based page
    pageSize,
    search: search || undefined,
    searchField: search ? searchField : undefined,
  });

  const totalPages = Math.ceil(totalCount / pageSize);

  const handleSearchChange = (value: string) => {
    setSearch(value);
    setPage(1);
  };

  const handleFieldChange = (field: SearchField) => {
    setSearchField(field);
    setPage(1);
  };

  return (
    <div>
      <h1 className="text-2xl font-bold text-text-primary mb-6">
        회원관리
      </h1>

      <div className="space-y-4">
        <MemberSearch
          value={search}
          searchField={searchField}
          onSearchChange={handleSearchChange}
          onFieldChange={handleFieldChange}
        />

        <MemberTable
          members={members}
          loading={loading}
          offset={(page - 1) * pageSize}
        />

        <div className="flex justify-center">
          <Pagination
            currentPage={page}
            totalPages={totalPages}
            onPageChange={setPage}
          />
        </div>
      </div>
    </div>
  );
}
