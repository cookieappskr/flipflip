'use client';

import React from 'react';
import DataTable from '@/components/core/DataTable';
import Badge from '@/components/core/Badge';
import type { Member } from '@/types/database';

interface MemberTableProps {
  members: Member[];
  loading: boolean;
  offset?: number;
}

export default function MemberTable({
  members,
  loading,
  offset = 0,
}: MemberTableProps) {
  if (loading) {
    return (
      <div className="flex items-center justify-center h-64 text-text-secondary text-sm">
        Loading members...
      </div>
    );
  }

  // Embed row index into data for NO column rendering
  const dataWithIndex = members.map((member, idx) => ({
    ...member,
    _rowNo: idx + 1 + offset,
  }));

  const columns = [
    {
      key: '_rowNo',
      header: 'NO',
      width: '60px',
    },
    {
      key: 'subscription_status',
      header: '유/무료',
      width: '100px',
      render: (row: Record<string, unknown>) => {
        const isActive = row.subscription_status === 'active';
        return (
          <Badge variant={isActive ? 'success' : 'default'}>
            {isActive ? '유료' : '무료'}
          </Badge>
        );
      },
    },
    {
      key: 'nickname',
      header: '닉네임',
      render: (row: Record<string, unknown>) => (
        <span>{(row.nickname as string) ?? '-'}</span>
      ),
    },
    {
      key: 'email',
      header: '이메일',
      width: '280px',
      render: (row: Record<string, unknown>) => (
        <span className="text-text-secondary">
          {(row.email as string) ?? (row.auth_email as string) ?? '-'}
        </span>
      ),
    },
  ];

  return (
    <DataTable
      columns={columns}
      data={dataWithIndex}
      emptyMessage="No members found."
    />
  );
}
