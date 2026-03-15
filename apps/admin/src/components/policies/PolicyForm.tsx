'use client';

import React, { useState, useEffect, useMemo } from 'react';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';
import { usePolicies } from '@/lib/hooks/usePolicies';
import type { PolicySetting } from '@/types/database';

function categorize(key: string): string {
  if (key.toLowerCase().includes('skill')) return 'skill';
  if (key.toLowerCase().includes('mileage') || key.toLowerCase().includes('point')) return 'mileage';
  return 'general';
}

const categoryLabels: Record<string, string> = {
  skill: 'Skill Settings',
  mileage: 'Mileage Settings',
  general: 'General Settings',
};

export default function PolicyForm() {
  const { policies, loading, error, updatePolicy } = usePolicies();
  const [formValues, setFormValues] = useState<Record<string, string>>({});
  const [saving, setSaving] = useState(false);
  const [showSuccess, setShowSuccess] = useState(false);

  // Initialize form values when policies load
  useEffect(() => {
    const values: Record<string, string> = {};
    policies.forEach((p) => {
      values[p.id] = p.value;
    });
    setFormValues(values);
  }, [policies]);

  // Group policies by category
  const grouped = useMemo(() => {
    const groups: Record<string, PolicySetting[]> = {};
    policies.forEach((p) => {
      const cat = categorize(p.key);
      if (!groups[cat]) groups[cat] = [];
      groups[cat].push(p);
    });
    return groups;
  }, [policies]);

  const handleValueChange = (id: string, value: string) => {
    setFormValues((prev) => ({ ...prev, [id]: value }));
  };

  const handleSave = async () => {
    setSaving(true);
    setShowSuccess(false);
    try {
      // Find changed values and update them
      const updates: Promise<void>[] = [];
      policies.forEach((p) => {
        const newValue = formValues[p.id];
        if (newValue !== undefined && newValue !== p.value) {
          updates.push(updatePolicy(p.id, newValue));
        }
      });

      if (updates.length === 0) {
        setShowSuccess(true);
        setTimeout(() => setShowSuccess(false), 3000);
        return;
      }

      await Promise.all(updates);
      setShowSuccess(true);
      setTimeout(() => setShowSuccess(false), 3000);
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64 text-text-secondary text-sm">
        Loading policy settings...
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-64 text-error text-sm">
        {error}
      </div>
    );
  }

  if (policies.length === 0) {
    return (
      <div className="flex items-center justify-center h-64 text-text-secondary text-sm">
        No policy settings found.
      </div>
    );
  }

  const categoryOrder = ['skill', 'mileage', 'general'];

  return (
    <div className="space-y-8">
      {categoryOrder.map((cat) => {
        const items = grouped[cat];
        if (!items || items.length === 0) return null;

        return (
          <div key={cat}>
            <h3 className="text-base font-semibold text-text-primary mb-4 border-b border-border pb-2">
              {categoryLabels[cat]}
            </h3>
            <div className="space-y-4">
              {items.map((policy) => (
                <Input
                  key={policy.id}
                  label={policy.description || policy.key}
                  value={formValues[policy.id] ?? policy.value}
                  onChange={(e) =>
                    handleValueChange(policy.id, e.target.value)
                  }
                />
              ))}
            </div>
          </div>
        );
      })}

      <div className="flex items-center gap-4 pt-4">
        <Button onClick={handleSave} loading={saving}>
          Save
        </Button>

        {showSuccess && (
          <div className="px-4 py-2 rounded-lg bg-green-100 text-green-700 text-sm font-medium">
            Settings saved successfully.
          </div>
        )}
      </div>
    </div>
  );
}
