'use client';

interface SkillTagsProps {
  tenseTypeName?: string | null;
  patternTypeName?: string | null;
}

export default function SkillTags({ tenseTypeName, patternTypeName }: SkillTagsProps) {
  const tags = [
    tenseTypeName ? { label: tenseTypeName, key: 'tense', color: 'bg-blue-100 text-blue-700 border-blue-200' } : null,
    patternTypeName ? { label: patternTypeName, key: 'pattern', color: 'bg-purple-100 text-purple-700 border-purple-200' } : null,
  ].filter(Boolean) as { label: string; key: string; color: string }[];

  if (tags.length === 0) return null;

  return (
    <div className="flex flex-wrap gap-1.5">
      {tags.map((tag) => (
        <span
          key={tag.key}
          className={`inline-flex items-center text-[11px] px-2 py-0.5 rounded-md border font-medium ${tag.color}`}
        >
          {tag.label}
        </span>
      ))}
    </div>
  );
}
