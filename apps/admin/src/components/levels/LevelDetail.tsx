'use client';

import React, { useState, useEffect } from 'react';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';
import Select from '@/components/core/Select';
import type { Level, LevelUpdate, Type } from '@/types/database';

interface LevelDetailProps {
  level: Level | null;
  onSave: (id: string, data: LevelUpdate) => void;
  nativeLevelTypes: Type[];
}

export default function LevelDetail({
  level,
  onSave,
  nativeLevelTypes,
}: LevelDetailProps) {
  const [summary, setSummary] = useState('');
  const [description, setDescription] = useState('');
  const [nativeLevelTypeId, setNativeLevelTypeId] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (level) {
      setSummary(level.summary ?? '');
      setDescription(level.description ?? '');
      setNativeLevelTypeId(level.native_level_type_id ?? '');
    }
  }, [level]);

  if (!level) {
    return (
      <div className="flex items-center justify-center h-full text-text-secondary text-sm">
        Select a level from the list.
      </div>
    );
  }

  const handleSave = async () => {
    setSaving(true);
    try {
      await onSave(level.id, {
        summary: summary || null,
        description: description || null,
        native_level_type_id: nativeLevelTypeId || null,
      });
    } finally {
      setSaving(false);
    }
  };

  const typeOptions = nativeLevelTypes.map((t) => ({
    value: t.id,
    label: t.type_name,
  }));

  return (
    <div className="space-y-4 p-4">
      <Input
        label="Level Number"
        value={level.level_number}
        disabled
        readOnly
      />

      <Input
        label="Summary"
        value={summary}
        onChange={(e) => setSummary(e.target.value)}
        maxLength={100}
        placeholder="Enter summary (max 100 chars)"
      />

      <div className="w-full">
        <label className="block text-sm font-medium text-text-primary mb-1">
          Description
        </label>
        <textarea
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows={4}
          className="block w-full rounded-lg border border-border bg-surface px-3 py-2 text-sm text-text-primary placeholder:text-text-secondary focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
          placeholder="Enter description"
        />
      </div>

      <Select
        label="Native Level Type"
        options={typeOptions}
        value={nativeLevelTypeId}
        onChange={(e) => setNativeLevelTypeId(e.target.value)}
        placeholder="Select native level type"
      />

      <div className="pt-2">
        <Button onClick={handleSave} loading={saving}>
          Save
        </Button>
      </div>
    </div>
  );
}
