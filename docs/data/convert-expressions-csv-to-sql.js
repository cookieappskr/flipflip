#!/usr/bin/env node
/**
 * Convert expressions CSV → SQL INSERT statements
 *
 * Usage: node convert-expressions-csv-to-sql.js <sentences-sql> <expressions-csv> <output-sql>
 * Example: node convert-expressions-csv-to-sql.js 03-sentences-L01-L50.sql 04-expressions-L01-L10.csv 04-expressions-L01-L10.sql
 */

const fs = require('fs');
const path = require('path');

const [,, sentencesSqlFile, expressionsCsvFile, outputFile] = process.argv;

if (!sentencesSqlFile || !expressionsCsvFile || !outputFile) {
  console.error('Usage: node convert-expressions-csv-to-sql.js <sentences-sql> <expressions-csv> <output-sql>');
  process.exit(1);
}

// Step 1: Parse sentences SQL to extract (sequential_id → { meaning, level_number, display_order })
const sentencesSql = fs.readFileSync(sentencesSqlFile, 'utf8');
const sentencePattern = /WHERE l\.level_number = (\d+) AND s\.display_order = (\d+)\),\s*'([^']*(?:''[^']*)*)'/g;

const sentenceMap = []; // index = sequential sentence_id (0-based)
let match;
while ((match = sentencePattern.exec(sentencesSql)) !== null) {
  sentenceMap.push({
    level: parseInt(match[1]),
    displayOrder: parseInt(match[2]),
    meaning: match[3].replace(/''/g, "'"),
  });
}

console.log(`Parsed ${sentenceMap.length} sentences from SQL`);

// Step 2: Parse CSV
const csvContent = fs.readFileSync(expressionsCsvFile, 'utf8');
const lines = csvContent.split('\n').filter(l => l.trim());
const header = lines[0]; // skip header

// Simple CSV parser handling quoted fields
function parseCSVLine(line) {
  const fields = [];
  let current = '';
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (inQuotes) {
      if (ch === '"') {
        if (i + 1 < line.length && line[i + 1] === '"') {
          current += '"';
          i++;
        } else {
          inQuotes = false;
        }
      } else {
        current += ch;
      }
    } else {
      if (ch === '"') {
        inQuotes = true;
      } else if (ch === ',') {
        fields.push(current);
        current = '';
      } else {
        current += ch;
      }
    }
  }
  fields.push(current);
  return fields;
}

// Group CSV rows by sentence_id
const expressionsBySentence = new Map();
for (let i = 1; i < lines.length; i++) {
  const fields = parseCSVLine(lines[i]);
  if (fields.length < 3) continue;

  const sentenceId = parseInt(fields[0]);
  const languageCode = fields[1];
  const expression = fields[2];
  const hint = fields[3] || '';

  if (!expressionsBySentence.has(sentenceId)) {
    expressionsBySentence.set(sentenceId, []);
  }
  expressionsBySentence.get(sentenceId).push({ languageCode, expression, hint });
}

console.log(`Parsed ${expressionsBySentence.size} sentences with expressions from CSV`);

// Step 3: Generate SQL
function escapeSql(str) {
  return str.replace(/'/g, "''");
}

const sqlLines = [];
const csvFileName = path.basename(expressionsCsvFile, '.csv');
const levelRange = csvFileName.match(/L(\d+)-L(\d+)/);
const startLevel = levelRange ? levelRange[1] : '?';
const endLevel = levelRange ? levelRange[2] : '?';

sqlLines.push(`-- =============================================================`);
sqlLines.push(`-- FlipFlip Expression Data: Level ${startLevel}-${endLevel}`);
sqlLines.push(`-- Converted from: ${path.basename(expressionsCsvFile)}`);
sqlLines.push(`-- Total: ${(lines.length - 1)} expressions (${expressionsBySentence.size} sentences x 5 languages)`);
sqlLines.push(`-- Generated: ${new Date().toISOString().split('T')[0]}`);
sqlLines.push(`-- =============================================================`);
sqlLines.push('');
sqlLines.push('BEGIN;');
sqlLines.push('');

let lastSkillKey = '';
for (const [sentenceId, expressions] of expressionsBySentence) {
  const idx = sentenceId - 1; // 0-based index
  if (idx >= sentenceMap.length) {
    console.warn(`Warning: sentence_id ${sentenceId} exceeds parsed sentences (${sentenceMap.length})`);
    continue;
  }

  const { level, displayOrder, meaning } = sentenceMap[idx];
  const skillKey = `L${level}-S${displayOrder}`;

  if (skillKey !== lastSkillKey) {
    sqlLines.push(`-- Level ${level}, Skill ${displayOrder}`);
    lastSkillKey = skillKey;
  }

  // Generate INSERT with subquery-based sentence lookup
  const valueRows = expressions.map(e =>
    `  ('${escapeSql(e.languageCode)}', '${escapeSql(e.expression)}', '${escapeSql(e.hint)}')`
  ).join(',\n');

  sqlLines.push(`INSERT INTO expressions (sentence_id, language_code, expression_text, hint)`);
  sqlLines.push(`SELECT s.id, v.lang, v.expr, v.hint`);
  sqlLines.push(`FROM sentences s`);
  sqlLines.push(`JOIN skills sk ON s.skill_id = sk.id`);
  sqlLines.push(`JOIN levels l ON sk.level_id = l.id`);
  sqlLines.push(`CROSS JOIN (VALUES`);
  sqlLines.push(valueRows);
  sqlLines.push(`) AS v(lang, expr, hint)`);
  sqlLines.push(`WHERE s.meaning = '${escapeSql(meaning)}' AND l.level_number = ${level} AND sk.display_order = ${displayOrder};`);
  sqlLines.push('');
}

sqlLines.push('COMMIT;');

fs.writeFileSync(outputFile, sqlLines.join('\n'), 'utf8');
console.log(`Generated: ${outputFile} (${sqlLines.length} lines)`);
