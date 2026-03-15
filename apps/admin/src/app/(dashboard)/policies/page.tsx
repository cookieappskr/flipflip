'use client';

import React from 'react';
import PolicyForm from '@/components/policies/PolicyForm';

export default function PoliciesPage() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-text-primary mb-6">
        정책관리
      </h1>

      <div className="max-w-2xl">
        <div className="rounded-lg border border-border bg-surface p-6">
          <PolicyForm />
        </div>
      </div>
    </div>
  );
}
