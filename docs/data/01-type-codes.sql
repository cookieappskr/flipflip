-- ============================================================
-- FlipFlip Type Codes INSERT Statements
-- Generated: 2026-03-15
-- Table: types
-- Safe to run multiple times (uses WHERE NOT EXISTS)
-- ============================================================

BEGIN;

-- ============================================================
-- 1. TENSE (시제) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '시제', 'TENSE', 1, 'Tense - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'TENSE' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, true
FROM (VALUES
  ('현재', 'T-PRES', 1, 'Present'),
  ('과거', 'T-PAST', 2, 'Past'),
  ('미래', 'T-FUT', 3, 'Future'),
  ('현재완료', 'T-PPERF', 4, 'Present Perfect'),
  ('과거완료', 'T-PAPERF', 5, 'Past Perfect'),
  ('미래완료', 'T-FPERF', 6, 'Future Perfect'),
  ('현재진행', 'T-PCONT', 7, 'Present Continuous'),
  ('과거진행', 'T-PACONT', 8, 'Past Continuous'),
  ('미래진행', 'T-FCONT', 9, 'Future Continuous'),
  ('현재완료진행', 'T-PPCON', 10, 'Present Perfect Continuous'),
  ('혼합시제', 'T-MIX', 11, 'Mixed Tenses'),
  ('시제 무관', 'T-NA', 12, 'Tense N/A')
) AS v(type_name, type_code, display_order, description)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'TENSE' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 2. SENT_PATTERN (문형) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '문형', 'SENT_PATTERN', 2, 'Sentence Pattern - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'SENT_PATTERN' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, true
FROM (VALUES
  ('단어', 'SP-WORD', 1, 'Single Word'),
  ('주어+동사', 'SP-SV', 2, 'Subject+Verb'),
  ('주어+동사+목적어', 'SP-SVO', 3, 'Subject+Verb+Object'),
  ('주어+동사+간접목적어+직접목적어', 'SP-SVOO', 4, 'S+V+IO+DO'),
  ('주어+동사+목적어+보어', 'SP-SVOC', 5, 'S+V+O+Complement'),
  ('부정문', 'SP-NEG', 6, 'Negative'),
  ('의문문', 'SP-QUES', 7, 'Question'),
  ('명령/청유문', 'SP-IMP', 8, 'Imperative'),
  ('수동태', 'SP-PASS', 9, 'Passive Voice'),
  ('조건문', 'SP-COND', 10, 'Conditional'),
  ('관계절', 'SP-REL', 11, 'Relative Clause'),
  ('복합문', 'SP-COMP', 12, 'Compound Sentence'),
  ('복문', 'SP-CPLX', 13, 'Complex Sentence'),
  ('가정법', 'SP-SUBJ', 14, 'Subjunctive'),
  ('간접화법', 'SP-IND', 15, 'Indirect Speech'),
  ('강조구문', 'SP-EMPH', 16, 'Emphatic Structure'),
  ('도치구문', 'SP-INV', 17, 'Inverted Structure'),
  ('분사구문', 'SP-PAR', 18, 'Participial Phrase'),
  ('혼합문형', 'SP-MIX', 19, 'Mixed Patterns')
) AS v(type_name, type_code, display_order, description)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'SENT_PATTERN' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 3. PURPOSE (용도) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '용도', 'PURPOSE', 3, 'Purpose - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'PURPOSE' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, icon, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, v.icon, true
FROM (VALUES
  ('서술/진술', 'P-STATE', 1, 'Statement', 'chat-bubble'),
  ('질문', 'P-QUEST', 2, 'Question', 'question-mark'),
  ('요청', 'P-REQ', 3, 'Request', 'hands-pray'),
  ('명령', 'P-CMD', 4, 'Command', 'lightning'),
  ('제안/권고', 'P-SUG', 5, 'Suggestion', 'lightbulb'),
  ('설득', 'P-PERS', 6, 'Persuasion', 'target'),
  ('설명', 'P-EXPL', 7, 'Explanation', 'book-open'),
  ('인사', 'P-GREET', 8, 'Greeting', 'hand-wave'),
  ('감사', 'P-THANK', 9, 'Gratitude', 'smile'),
  ('사과', 'P-APOL', 10, 'Apology', 'face-sad'),
  ('동의/반대', 'P-AGREE', 11, 'Agreement/Disagreement', 'thumb-up'),
  ('비교', 'P-COMP', 12, 'Comparison', 'scale'),
  ('의견 표현', 'P-OPIN', 13, 'Opinion', 'megaphone'),
  ('감정 표현', 'P-EMOT', 14, 'Emotion', 'heart'),
  ('경고/주의', 'P-WARN', 15, 'Warning', 'alert-triangle'),
  ('약속', 'P-PROM', 16, 'Promise', 'handshake'),
  ('서사/이야기', 'P-NARR', 17, 'Narration', 'pencil')
) AS v(type_name, type_code, display_order, description, icon)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'PURPOSE' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 4. TONE (톤) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '톤', 'TONE', 4, 'Tone - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'TONE' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, color, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, v.color, true
FROM (VALUES
  ('비격식 (반말/일상)', 'TN-CASU', 1, 'Casual/Informal', '#4CAF50'),
  ('중립 (일반)', 'TN-NEUT', 2, 'Neutral', '#2196F3'),
  ('격식 (존대/공식)', 'TN-FORM', 3, 'Formal/Polite', '#9C27B0'),
  ('전문/비즈니스', 'TN-PROF', 4, 'Professional/Business', '#FF9800')
) AS v(type_name, type_code, display_order, description, color)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'TONE' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 5. SITUATION (상황) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '상황', 'SITUATION', 5, 'Situation - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'SITUATION' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, icon, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, v.icon, true
FROM (VALUES
  ('집/가정', 'S-HOME', 1, 'Home/Family', 'home'),
  ('직장/사무실', 'S-WORK', 2, 'Workplace/Office', 'briefcase'),
  ('학교/교육', 'S-SCHOOL', 3, 'School/Education', 'graduation-cap'),
  ('여행/교통', 'S-TRAVEL', 4, 'Travel/Transportation', 'airplane'),
  ('쇼핑/상점', 'S-SHOP', 5, 'Shopping/Store', 'shopping-cart'),
  ('식당/카페', 'S-REST', 6, 'Restaurant/Cafe', 'utensils'),
  ('병원/의료', 'S-HOSP', 7, 'Hospital/Medical', 'hospital'),
  ('사교/모임', 'S-SOCIAL', 8, 'Social Gathering', 'party'),
  ('전화/온라인', 'S-PHONE', 9, 'Phone/Online', 'phone'),
  ('은행/관공서', 'S-BANK', 10, 'Bank/Government Office', 'bank'),
  ('운동/레저', 'S-SPORT', 11, 'Sports/Leisure', 'soccer'),
  ('미디어/문화', 'S-MEDIA', 12, 'Media/Culture', 'film'),
  ('자연/날씨', 'S-NATURE', 13, 'Nature/Weather', 'leaf'),
  ('일반/기타', 'S-GENERAL', 14, 'General/Others', 'pin')
) AS v(type_name, type_code, display_order, description, icon)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'SITUATION' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 6. CHECK_TYPE (점검유형) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '점검유형', 'CHECK_TYPE', 6, 'Check Type - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'CHECK_TYPE' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, value, description, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.value, v.description, true
FROM (VALUES
  ('완벽', 'PERFECT', 1, '2', 'Perfect - full score'),
  ('대체로 맞음', 'MOSTLY', 2, '0.5', 'Mostly correct - partial score'),
  ('놓침', 'MISSED', 3, '-1', 'Missed - penalty score')
) AS v(type_name, type_code, display_order, value, description)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'CHECK_TYPE' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 7. MASTERY_LEVEL (익힘수준) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '익힘수준', 'MASTERY_LEVEL', 7, 'Mastery Level - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'MASTERY_LEVEL' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, value, description, extra_attr_1, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.value, v.description, v.extra_attr_1, true
FROM (VALUES
  ('완전 익힘', 'MASTERED', 1, '10', 'Mastered - review interval 30 days', '43200'),
  ('매우 익숙', 'VERY_FAMILIAR', 2, '5', 'Very Familiar - review interval 7 days', '10080'),
  ('익숙', 'FAMILIAR', 3, '3', 'Familiar - review interval 1 day', '1440'),
  ('약함', 'WEAK', 4, '1', 'Weak - review interval 4 hours', '240'),
  ('처음', 'FIRST', 5, '0', 'First encounter - review interval 30 min', '30')
) AS v(type_name, type_code, display_order, value, description, extra_attr_1)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'MASTERY_LEVEL' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 8. DAILY_GOAL (일일 목표) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '일일 목표', 'DAILY_GOAL', 8, 'Daily Goal - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'DAILY_GOAL' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, extra_attr_1, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, v.extra_attr_1, true
FROM (VALUES
  ('5분', '5MIN', 1, '5 minutes daily goal', '5'),
  ('15분', '15MIN', 2, '15 minutes daily goal', '15'),
  ('30분', '30MIN', 3, '30 minutes daily goal', '30'),
  ('1시간', '1HOUR', 4, '1 hour daily goal', '60'),
  ('2시간', '2HOUR', 5, '2 hours daily goal', '120'),
  ('2시간 이상', '2HOUR_PLUS', 6, '2+ hours daily goal', '150')
) AS v(type_name, type_code, display_order, description, extra_attr_1)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'DAILY_GOAL' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

-- ============================================================
-- 9. LANGUAGE (언어) — Parent & Children
-- ============================================================
INSERT INTO types (type_name, type_code, display_order, description, is_active)
SELECT '언어', 'LANGUAGE', 9, 'Language - parent category', true
WHERE NOT EXISTS (SELECT 1 FROM types WHERE type_code = 'LANGUAGE' AND parent_id IS NULL);

INSERT INTO types (parent_id, type_name, type_code, display_order, description, is_active)
SELECT p.id, v.type_name, v.type_code, v.display_order, v.description, true
FROM (VALUES
  ('English', 'EN', 1, 'English'),
  ('Espanol', 'ES', 2, 'Spanish'),
  ('中文', 'ZH', 3, 'Chinese'),
  ('日本語', 'JA', 4, 'Japanese'),
  ('한국어', 'KO', 5, 'Korean')
) AS v(type_name, type_code, display_order, description)
CROSS JOIN (SELECT id FROM types WHERE type_code = 'LANGUAGE' AND parent_id IS NULL) p
WHERE NOT EXISTS (SELECT 1 FROM types t WHERE t.type_code = v.type_code AND t.parent_id = p.id);

COMMIT;
