# FlipFlip Expressions Data Format (CSV)

> **Created**: 2026-03-15
> **Total Records**: 13,400 (2,680 sentences x 5 languages)
> **Split**: 10 CSV files by level batch (L01-L10, L11-L20, ..., L91-L100)
> **Encoding**: UTF-8 with BOM (recommended for multilingual data)

---

## Table Schema

```sql
CREATE TABLE IF NOT EXISTS expressions (
    id          SERIAL PRIMARY KEY,
    sentence_id INT NOT NULL REFERENCES sentences(id),
    language_code VARCHAR(5) NOT NULL REFERENCES types(type_code),
    expression  VARCHAR(150) NOT NULL,
    hint        VARCHAR(300),
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(sentence_id, language_code)
);

-- Index for fast lookup by sentence
CREATE INDEX idx_expressions_sentence_id ON expressions(sentence_id);

-- Index for language-based queries
CREATE INDEX idx_expressions_language_code ON expressions(language_code);

-- Composite index for common query pattern
CREATE INDEX idx_expressions_sentence_lang ON expressions(sentence_id, language_code);
```

---

## CSV Format

### Columns

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `sentence_id` | INT | Foreign key to `sentences` table | `1` |
| `language_code` | VARCHAR(5) | Language code (EN/ES/ZH/JA/KO) | `EN` |
| `expression` | VARCHAR(150) | The expression text | `Hello` |
| `hint` | VARCHAR(300) | Learning hint for the expression | `Common greeting used any time of day` |

### Language Codes

| Code | Language | Description |
|------|----------|-------------|
| `EN` | English | |
| `ES` | Spanish (Espanol) | |
| `ZH` | Chinese (Mandarin) | Simplified characters |
| `JA` | Japanese | Hiragana/Katakana/Kanji |
| `KO` | Korean | Hangul |

### CSV Rules

1. **Header row**: First row is `sentence_id,language_code,expression,hint`
2. **Delimiter**: Comma (`,`)
3. **Quoting**: Fields containing commas, quotes, or newlines are enclosed in double quotes (`"`)
4. **Escaping**: Double quotes within quoted fields are escaped as `""` (RFC 4180)
5. **Line ending**: LF (`\n`)
6. **No trailing comma**
7. **`id` column is omitted**: The `SERIAL` primary key is auto-generated on import

### Sample Rows

```csv
sentence_id,language_code,expression,hint
1,EN,Hello,Common greeting used any time of day
1,ES,Hola,"Saludo comun para cualquier momento del dia"
1,ZH,你好,"ni hao - 最常用的问候语 (가장 흔한 인사말)"
1,JA,こんにちは,"こんにちは(konnichiwa) - 日中の挨拶 (낮 인사)"
1,KO,안녕하세요,"가장 기본적인 한국어 인사말. 격식체. annyeonghaseyo"
```

---

## File Naming Convention

```
04-expressions-L{start}-L{end}.csv
```

| File | Levels | Sentence IDs | Rows |
|------|--------|-------------|------|
| `04-expressions-L01-L10.csv` | 1-10 | 1-400 | 2,000 |
| `04-expressions-L11-L20.csv` | 11-20 | 401-800 | 2,000 |
| `04-expressions-L21-L30.csv` | 21-30 | 801-... | ~2,000 |
| ... | ... | ... | ... |

---

## Import Instructions

### Step 1: Create the table (if not exists)

Run the `CREATE TABLE` SQL above.

### Step 2: Import CSV using COPY

```sql
-- Import L01-L10 expressions
COPY expressions (sentence_id, language_code, expression, hint)
FROM '/path/to/04-expressions-L01-L10.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
```

### Step 3: Import remaining batches

```sql
-- Import L11-L20 expressions
COPY expressions (sentence_id, language_code, expression, hint)
FROM '/path/to/04-expressions-L11-L20.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Repeat for each batch...
```

### Supabase Import (via psql)

```bash
# Connect to Supabase
psql "postgresql://postgres:[PASSWORD]@[HOST]:5432/postgres"

# Import each CSV file
\copy expressions (sentence_id, language_code, expression, hint) FROM '04-expressions-L01-L10.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
\copy expressions (sentence_id, language_code, expression, hint) FROM '04-expressions-L11-L20.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
```

### Verification Query

```sql
-- Verify row count per level batch
SELECT
    s.level_id,
    COUNT(e.id) AS expression_count
FROM expressions e
JOIN sentences s ON e.sentence_id = s.id
GROUP BY s.level_id
ORDER BY s.level_id;

-- Verify all 5 languages per sentence
SELECT sentence_id, COUNT(*) AS lang_count
FROM expressions
GROUP BY sentence_id
HAVING COUNT(*) != 5;
-- Should return 0 rows if data is complete
```

---

## Notes

- Data should be imported in 10-level batches to avoid timeout issues with large imports
- The `id` (SERIAL) column auto-increments; do NOT include it in CSV
- Ensure `sentences` and `types` tables are populated before importing expressions (foreign key constraints)
- For Supabase, use `\copy` (client-side) instead of `COPY` (server-side)
