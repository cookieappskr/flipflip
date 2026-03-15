-- =============================================================
-- FlipFlip Expression Data: Level 01-10
-- Converted from: 04-expressions-L01-L10.csv
-- Total: 2000 expressions (400 sentences x 5 languages)
-- Generated: 2026-03-15
-- =============================================================

BEGIN;

-- Level 1, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hello', 'Common greeting used any time of day'),
  ('ES', 'Hola', 'Saludo común para cualquier momento del día'),
  ('ZH', '你好', 'nǐ hǎo - 最常用的问候语 (가장 흔한 인사말)'),
  ('JA', 'こんにちは', 'こんにちは(konnichiwa) - 日中の挨拶 (낮 인사)'),
  ('KO', '안녕하세요', '가장 기본적인 한국어 인사말. 격식체. annyeonghaseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '안녕하세요' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Goodbye', 'Said to the person who is leaving'),
  ('ES', 'Adiós', 'Se dice a la persona que se va'),
  ('ZH', '再见', 'zài jiàn - 告别用语 (작별 인사)'),
  ('JA', 'さようなら', 'さようなら(sayōnara) - 別れの挨拶 (작별 인사)'),
  ('KO', '안녕히 가세요', '떠나는 사람에게 하는 인사. annyeonghi gaseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '안녕히 가세요' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Goodbye', 'Said to the person who is staying behind'),
  ('ES', 'Adiós', 'Se dice a la persona que se queda'),
  ('ZH', '再见', 'zài jiàn - 对留下的人说的告别语 (남는 사람에게 하는 작별 인사)'),
  ('JA', 'さようなら', 'さようなら(sayōnara) - 残る人への挨拶 (남는 사람에게 하는 인사)'),
  ('KO', '안녕히 계세요', '남아 있는 사람에게 하는 인사. annyeonghi gyeseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '안녕히 계세요' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Thank you', 'Formal expression of gratitude'),
  ('ES', 'Gracias', 'Expresión formal de agradecimiento'),
  ('ZH', '谢谢', 'xiè xiè - 表示感谢 (감사 표현)'),
  ('JA', 'ありがとうございます', 'ありがとうございます(arigatō gozaimasu) - 丁寧な感謝 (정중한 감사)'),
  ('KO', '감사합니다', '정중한 감사 표현. 격식체. gamsahamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '감사합니다' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Thank you', 'Slightly softer than 감사합니다 but still polite'),
  ('ES', 'Gracias', 'Un poco menos formal que 감사합니다, pero cortés'),
  ('ZH', '谢谢', 'xiè xiè - 感谢（稍随意）(약간 부드러운 감사)'),
  ('JA', 'ありがとう', 'ありがとう(arigatō) - やや親しい感謝 (친근한 감사)'),
  ('KO', '고맙습니다', '감사합니다보다 약간 부드러운 감사 표현. gomapseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '고맙습니다' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I''m sorry', 'Apology, slightly casual but polite'),
  ('ES', 'Lo siento', 'Disculpa cortés'),
  ('ZH', '对不起', 'duì bu qǐ - 道歉用语 (사과 표현)'),
  ('JA', 'すみません', 'すみません(sumimasen) - 謝罪表現 (사과 표현)'),
  ('KO', '미안합니다', '사과 표현. 죄송합니다보다 약간 가벼운 느낌. mianhamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '미안합니다' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I''m very sorry', 'Very formal apology'),
  ('ES', 'Lo siento mucho', 'Disculpa muy formal'),
  ('ZH', '非常抱歉', 'fēi cháng bào qiàn - 正式道歉 (격식 사과)'),
  ('JA', '申し訳ありません', 'もうしわけありません(mōshiwake arimasen) - 正式な謝罪 (격식 사과)'),
  ('KO', '죄송합니다', '매우 정중한 사과 표현. 격식체. joesonghamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '죄송합니다' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Yes', 'Affirmative response'),
  ('ES', 'Sí', 'Respuesta afirmativa'),
  ('ZH', '是', 'shì - 肯定回答 (긍정 대답)'),
  ('JA', 'はい', 'はい(hai) - 肯定の返事 (긍정 대답)'),
  ('KO', '네', '긍정의 대답. 격식체. ne')
) AS v(lang, expr, hint)
WHERE s.meaning = '네' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'No', 'Negative response'),
  ('ES', 'No', 'Respuesta negativa'),
  ('ZH', '不是', 'bú shì - 否定回答 (부정 대답)'),
  ('JA', 'いいえ', 'いいえ(iie) - 否定の返事 (부정 대답)'),
  ('KO', '아니요', '부정의 대답. 격식체. aniyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '아니요' AND l.level_number = 1 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Excuse me', 'Used to get attention or apologize for interrupting'),
  ('ES', 'Disculpe', 'Se usa para llamar la atención o pedir permiso'),
  ('ZH', '打扰一下', 'dǎ rǎo yí xià - 打扰时用语 (실례할 때 쓰는 말)'),
  ('JA', 'すみません', 'すみません(sumimasen) - 注意を引く表現 (주의를 끌 때)'),
  ('KO', '실례합니다', '다른 사람에게 말을 걸 때 쓰는 정중한 표현. sillyehamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '실례합니다' AND l.level_number = 1 AND sk.display_order = 1;

-- Level 1, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I', 'First person pronoun, informal'),
  ('ES', 'Yo', 'Pronombre de primera persona'),
  ('ZH', '我', 'wǒ - 第一人称代词 (1인칭 대명사)'),
  ('JA', '私', 'わたし(watashi) - 一人称代名詞 (1인칭 대명사)'),
  ('KO', '나', '1인칭 대명사. 비격식. 친구나 아랫사람에게 사용. na')
) AS v(lang, expr, hint)
WHERE s.meaning = '나' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I', 'First person pronoun, humble/formal'),
  ('ES', 'Yo', 'Pronombre de primera persona, formal'),
  ('ZH', '我', 'wǒ - 第一人称（正式）(1인칭, 격식)'),
  ('JA', '私', 'わたくし(watakushi) - 一人称（謙譲）(1인칭, 겸양)'),
  ('KO', '저', '1인칭 대명사. 격식체. 윗사람에게 사용. jeo')
) AS v(lang, expr, hint)
WHERE s.meaning = '저' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'You', 'Second person pronoun, informal'),
  ('ES', 'Tú', 'Pronombre de segunda persona, informal'),
  ('ZH', '你', 'nǐ - 第二人称代词 (2인칭 대명사)'),
  ('JA', '君', 'きみ(kimi) - 二人称（親しい）(2인칭, 친근)'),
  ('KO', '너', '2인칭 대명사. 비격식. 친구나 아랫사람에게 사용. neo')
) AS v(lang, expr, hint)
WHERE s.meaning = '너' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'You', 'Second person pronoun, formal'),
  ('ES', 'Usted', 'Pronombre de segunda persona, formal'),
  ('ZH', '您', 'nín - 第二人称（尊敬）(2인칭, 존경)'),
  ('JA', 'あなた', 'あなた(anata) - 二人称（丁寧）(2인칭, 정중)'),
  ('KO', '당신', '2인칭 대명사. 격식체. 실제 대화에서는 잘 안 씀. dangsin')
) AS v(lang, expr, hint)
WHERE s.meaning = '당신' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'He', 'Third person masculine pronoun'),
  ('ES', 'Él', 'Pronombre de tercera persona masculino'),
  ('ZH', '他', 'tā - 第三人称（男）(3인칭 남성)'),
  ('JA', '彼', 'かれ(kare) - 三人称（男性）(3인칭 남성)'),
  ('KO', '그', '3인칭 남성 대명사. geu')
) AS v(lang, expr, hint)
WHERE s.meaning = '그' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'She', 'Third person feminine pronoun'),
  ('ES', 'Ella', 'Pronombre de tercera persona femenino'),
  ('ZH', '她', 'tā - 第三人称（女）(3인칭 여성)'),
  ('JA', '彼女', 'かのじょ(kanojo) - 三人称（女性）(3인칭 여성)'),
  ('KO', '그녀', '3인칭 여성 대명사. geunyeo')
) AS v(lang, expr, hint)
WHERE s.meaning = '그녀' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'It', 'Third person pronoun for things'),
  ('ES', 'Eso', 'Pronombre para cosas'),
  ('ZH', '它', 'tā - 第三人称（物）(3인칭 사물)'),
  ('JA', 'それ', 'それ(sore) - 物を指す代名詞 (사물 대명사)'),
  ('KO', '그것', '3인칭 사물 대명사. geugeot')
) AS v(lang, expr, hint)
WHERE s.meaning = '그것' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'We', 'First person plural pronoun'),
  ('ES', 'Nosotros', 'Pronombre de primera persona plural'),
  ('ZH', '我们', 'wǒ men - 第一人称复数 (1인칭 복수)'),
  ('JA', '私たち', 'わたしたち(watashitachi) - 一人称複数 (1인칭 복수)'),
  ('KO', '우리', '1인칭 복수 대명사. ''우리 가족'' 등으로 많이 사용. uri')
) AS v(lang, expr, hint)
WHERE s.meaning = '우리' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'They', 'Third person plural pronoun'),
  ('ES', 'Ellos', 'Pronombre de tercera persona plural'),
  ('ZH', '他们', 'tā men - 第三人称复数 (3인칭 복수)'),
  ('JA', '彼ら', 'かれら(karera) - 三人称複数 (3인칭 복수)'),
  ('KO', '그들', '3인칭 복수 대명사. geudeul')
) AS v(lang, expr, hint)
WHERE s.meaning = '그들' AND l.level_number = 1 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Everyone', 'Addressing a group of people'),
  ('ES', 'Todos ustedes', 'Dirigirse a un grupo de personas'),
  ('ZH', '大家', 'dà jiā - 对大家说 (여러 사람에게)'),
  ('JA', '皆さん', 'みなさん(minasan) - 皆様 (여러분)'),
  ('KO', '여러분', '여러 사람을 가리키는 2인칭 복수. yeoreobun')
) AS v(lang, expr, hint)
WHERE s.meaning = '여러분' AND l.level_number = 1 AND sk.display_order = 2;

-- Level 1, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This', 'Demonstrative for something near the speaker'),
  ('ES', 'Esto', 'Demostrativo para algo cerca del hablante'),
  ('ZH', '这个', 'zhè ge - 指示代词（近）(지시대명사, 가까운 것)'),
  ('JA', 'これ', 'これ(kore) - 近くの物を指す (가까운 것)'),
  ('KO', '이것', '말하는 사람 가까이에 있는 것을 가리킴. igeot')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That', 'Demonstrative for something near the listener'),
  ('ES', 'Eso', 'Demostrativo para algo cerca del oyente'),
  ('ZH', '那个', 'nà ge - 指示代词（中距离）(지시대명사, 중간 거리)'),
  ('JA', 'それ', 'それ(sore) - 聞き手の近くの物 (듣는 사람 근처)'),
  ('KO', '그것', '듣는 사람 가까이에 있는 것을 가리킴. geugeot')
) AS v(lang, expr, hint)
WHERE s.meaning = '그것' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That over there', 'Demonstrative for something far from both speakers'),
  ('ES', 'Aquello', 'Demostrativo para algo lejos de ambos'),
  ('ZH', '那个', 'nà ge - 指示代词（远）(지시대명사, 먼 것)'),
  ('JA', 'あれ', 'あれ(are) - 遠くの物を指す (먼 것)'),
  ('KO', '저것', '말하는 사람과 듣는 사람 모두에게서 먼 것. jeogeot')
) AS v(lang, expr, hint)
WHERE s.meaning = '저것' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Here', 'Place near the speaker'),
  ('ES', 'Aquí', 'Lugar cerca del hablante'),
  ('ZH', '这里', 'zhè lǐ - 这里（近处）(여기, 가까운 곳)'),
  ('JA', 'ここ', 'ここ(koko) - 近い場所 (가까운 장소)'),
  ('KO', '여기', '말하는 사람 가까이의 장소. yeogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '여기' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There', 'Place near the listener'),
  ('ES', 'Ahí', 'Lugar cerca del oyente'),
  ('ZH', '那里', 'nà lǐ - 那里（中距离）(거기, 중간 거리)'),
  ('JA', 'そこ', 'そこ(soko) - 聞き手の近くの場所 (듣는 사람 근처)'),
  ('KO', '거기', '듣는 사람 가까이의 장소. geogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '거기' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Over there', 'Place far from both speakers'),
  ('ES', 'Allá', 'Lugar lejos de ambos hablantes'),
  ('ZH', '那边', 'nà biān - 那边（远处）(저기, 먼 곳)'),
  ('JA', 'あそこ', 'あそこ(asoko) - 遠い場所 (먼 장소)'),
  ('KO', '저기', '말하는 사람과 듣는 사람 모두에게서 먼 장소. jeogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '저기' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This way', 'Direction near the speaker'),
  ('ES', 'Por aquí', 'Dirección cerca del hablante'),
  ('ZH', '这边', 'zhè biān - 这边（方向）(이쪽, 방향)'),
  ('JA', 'こちら', 'こちら(kochira) - こちらの方 (이쪽 방향)'),
  ('KO', '이쪽', '말하는 사람 쪽의 방향. ijjok')
) AS v(lang, expr, hint)
WHERE s.meaning = '이쪽' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That way', 'Direction far from both speakers'),
  ('ES', 'Por allá', 'Dirección lejos de ambos hablantes'),
  ('ZH', '那边', 'nà biān - 那边（方向）(저쪽, 방향)'),
  ('JA', 'あちら', 'あちら(achira) - あちらの方 (저쪽 방향)'),
  ('KO', '저쪽', '먼 쪽의 방향. jeojjok')
) AS v(lang, expr, hint)
WHERE s.meaning = '저쪽' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This place', 'Formal way to say ''here'''),
  ('ES', 'Este lugar', 'Forma formal de decir ''aquí'''),
  ('ZH', '这个地方', 'zhè ge dì fāng - 这个地方 (이 장소)'),
  ('JA', 'この場所', 'このばしょ(kono basho) - この場所 (이 장소)'),
  ('KO', '이곳', '''여기''의 격식체 표현. igot')
) AS v(lang, expr, hint)
WHERE s.meaning = '이곳' AND l.level_number = 1 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That place', 'Formal way to say ''over there'''),
  ('ES', 'Aquel lugar', 'Forma formal de decir ''allá'''),
  ('ZH', '那个地方', 'nà ge dì fāng - 那个地方 (저 장소)'),
  ('JA', 'あの場所', 'あのばしょ(ano basho) - あの場所 (저 장소)'),
  ('KO', '저곳', '''저기''의 격식체 표현. jeogot')
) AS v(lang, expr, hint)
WHERE s.meaning = '저곳' AND l.level_number = 1 AND sk.display_order = 3;

-- Level 1, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Good', 'Adjective meaning good, fine'),
  ('ES', 'Bueno', 'Adjetivo que significa bueno'),
  ('ZH', '好', 'hǎo - 形容词，好的 (형용사, 좋은)'),
  ('JA', 'いい', 'いい(ii) - 良い、形容詞 (좋은, 형용사)'),
  ('KO', '좋다', '기본 형용사. 상태가 좋음. 반대말: 나쁘다. jota')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bad', 'Adjective meaning bad'),
  ('ES', 'Malo', 'Adjetivo que significa malo'),
  ('ZH', '坏', 'huài - 形容词，坏的 (형용사, 나쁜)'),
  ('JA', '悪い', 'わるい(warui) - 悪い、形容詞 (나쁜, 형용사)'),
  ('KO', '나쁘다', '기본 형용사. 상태가 나쁨. 반대말: 좋다. nappeuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '나쁘다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Happy', 'Adjective meaning happy'),
  ('ES', 'Feliz', 'Adjetivo que significa feliz'),
  ('ZH', '幸福', 'xìng fú - 形容词，幸福的 (형용사, 행복한)'),
  ('JA', '幸せ', 'しあわせ(shiawase) - 幸せ、形容詞 (행복한)'),
  ('KO', '행복하다', '감정 형용사. 행복한 상태. haengbokada')
) AS v(lang, expr, hint)
WHERE s.meaning = '행복하다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Sad', 'Adjective meaning sad'),
  ('ES', 'Triste', 'Adjetivo que significa triste'),
  ('ZH', '难过', 'nán guò - 形容词，难过的 (형용사, 슬픈)'),
  ('JA', '悲しい', 'かなしい(kanashii) - 悲しい、形容詞 (슬픈)'),
  ('KO', '슬프다', '감정 형용사. 슬픈 상태. 반대말: 기쁘다. seulpeuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '슬프다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hungry', 'Adjective meaning hungry'),
  ('ES', 'Hambriento', 'Adjetivo que significa hambriento'),
  ('ZH', '饿', 'è - 形容词，饿的 (형용사, 배고픈)'),
  ('JA', 'お腹がすいた', 'おなかがすいた(onaka ga suita) - お腹が空いた (배고프다)'),
  ('KO', '배고프다', '신체 상태 형용사. 배가 고픈 상태. baegeopeuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '배고프다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tired', 'Adjective meaning tired'),
  ('ES', 'Cansado', 'Adjetivo que significa cansado'),
  ('ZH', '累', 'lèi - 形容词，累的 (형용사, 피곤한)'),
  ('JA', '疲れた', 'つかれた(tsukareta) - 疲れた、形容詞 (피곤한)'),
  ('KO', '피곤하다', '신체 상태 형용사. 피곤한 상태. pigonhada')
) AS v(lang, expr, hint)
WHERE s.meaning = '피곤하다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Glad', 'Adjective meaning glad, pleased'),
  ('ES', 'Contento', 'Adjetivo que significa contento'),
  ('ZH', '高兴', 'gāo xìng - 形容词，高兴的 (형용사, 기쁜)'),
  ('JA', '嬉しい', 'うれしい(ureshii) - 嬉しい、形容詞 (기쁜)'),
  ('KO', '기쁘다', '감정 형용사. 기쁜 상태. 행복하다보다 순간적. gippeuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '기쁘다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Angry', 'Adjective meaning angry'),
  ('ES', 'Enojado', 'Adjetivo que significa enojado'),
  ('ZH', '生气', 'shēng qì - 形容词，生气的 (형용사, 화난)'),
  ('JA', '怒った', 'おこった(okotta) - 怒った、形容詞 (화난)'),
  ('KO', '화나다', '감정 형용사. 화가 난 상태. hwanada')
) AS v(lang, expr, hint)
WHERE s.meaning = '화나다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Scary', 'Adjective meaning scary or frightened'),
  ('ES', 'Asustado', 'Adjetivo que significa asustado o aterrador'),
  ('ZH', '害怕', 'hài pà - 形容词，害怕的 (형용사, 무서운)'),
  ('JA', '怖い', 'こわい(kowai) - 怖い、形容詞 (무서운)'),
  ('KO', '무섭다', '감정 형용사. 무서운 상태 또는 대상. museopda')
) AS v(lang, expr, hint)
WHERE s.meaning = '무섭다' AND l.level_number = 1 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Okay', 'Adjective meaning okay, alright'),
  ('ES', 'Está bien', 'Expresión que significa estar bien'),
  ('ZH', '没关系', 'méi guān xi - 没关系 (괜찮다, 상관없다)'),
  ('JA', '大丈夫', 'だいじょうぶ(daijōbu) - 大丈夫 (괜찮다)'),
  ('KO', '괜찮다', '상태가 괜찮음을 나타냄. 위로할 때도 사용. gwaenchanta')
) AS v(lang, expr, hint)
WHERE s.meaning = '괜찮다' AND l.level_number = 1 AND sk.display_order = 4;

-- Level 2, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'One', 'Cardinal number 1'),
  ('ES', 'Uno', 'Número cardinal 1'),
  ('ZH', '一', 'yī - 数字1 (숫자 1)'),
  ('JA', '一つ', 'ひとつ(hitotsu) - 数字1 (숫자 1, 고유 수사)'),
  ('KO', '하나', '고유어 숫자 1. 물건을 셀 때 사용. hana')
) AS v(lang, expr, hint)
WHERE s.meaning = '하나' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Two', 'Cardinal number 2'),
  ('ES', 'Dos', 'Número cardinal 2'),
  ('ZH', '二', 'èr - 数字2 (숫자 2)'),
  ('JA', '二つ', 'ふたつ(futatsu) - 数字2 (숫자 2, 고유 수사)'),
  ('KO', '둘', '고유어 숫자 2. dul')
) AS v(lang, expr, hint)
WHERE s.meaning = '둘' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Three', 'Cardinal number 3'),
  ('ES', 'Tres', 'Número cardinal 3'),
  ('ZH', '三', 'sān - 数字3 (숫자 3)'),
  ('JA', '三つ', 'みっつ(mittsu) - 数字3 (숫자 3, 고유 수사)'),
  ('KO', '셋', '고유어 숫자 3. set')
) AS v(lang, expr, hint)
WHERE s.meaning = '셋' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Four', 'Cardinal number 4'),
  ('ES', 'Cuatro', 'Número cardinal 4'),
  ('ZH', '四', 'sì - 数字4 (숫자 4)'),
  ('JA', '四つ', 'よっつ(yottsu) - 数字4 (숫자 4, 고유 수사)'),
  ('KO', '넷', '고유어 숫자 4. net')
) AS v(lang, expr, hint)
WHERE s.meaning = '넷' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Five', 'Cardinal number 5'),
  ('ES', 'Cinco', 'Número cardinal 5'),
  ('ZH', '五', 'wǔ - 数字5 (숫자 5)'),
  ('JA', '五つ', 'いつつ(itsutsu) - 数字5 (숫자 5, 고유 수사)'),
  ('KO', '다섯', '고유어 숫자 5. daseot')
) AS v(lang, expr, hint)
WHERE s.meaning = '다섯' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Six', 'Cardinal number 6'),
  ('ES', 'Seis', 'Número cardinal 6'),
  ('ZH', '六', 'liù - 数字6 (숫자 6)'),
  ('JA', '六つ', 'むっつ(muttsu) - 数字6 (숫자 6, 고유 수사)'),
  ('KO', '여섯', '고유어 숫자 6. yeoseot')
) AS v(lang, expr, hint)
WHERE s.meaning = '여섯' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Seven', 'Cardinal number 7'),
  ('ES', 'Siete', 'Número cardinal 7'),
  ('ZH', '七', 'qī - 数字7 (숫자 7)'),
  ('JA', '七つ', 'ななつ(nanatsu) - 数字7 (숫자 7, 고유 수사)'),
  ('KO', '일곱', '고유어 숫자 7. ilgop')
) AS v(lang, expr, hint)
WHERE s.meaning = '일곱' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Eight', 'Cardinal number 8'),
  ('ES', 'Ocho', 'Número cardinal 8'),
  ('ZH', '八', 'bā - 数字8 (숫자 8)'),
  ('JA', '八つ', 'やっつ(yattsu) - 数字8 (숫자 8, 고유 수사)'),
  ('KO', '여덟', '고유어 숫자 8. yeodeol')
) AS v(lang, expr, hint)
WHERE s.meaning = '여덟' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Nine', 'Cardinal number 9'),
  ('ES', 'Nueve', 'Número cardinal 9'),
  ('ZH', '九', 'jiǔ - 数字9 (숫자 9)'),
  ('JA', '九つ', 'ここのつ(kokonotsu) - 数字9 (숫자 9, 고유 수사)'),
  ('KO', '아홉', '고유어 숫자 9. ahop')
) AS v(lang, expr, hint)
WHERE s.meaning = '아홉' AND l.level_number = 2 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Ten', 'Cardinal number 10'),
  ('ES', 'Diez', 'Número cardinal 10'),
  ('ZH', '十', 'shí - 数字10 (숫자 10)'),
  ('JA', '十', 'じゅう(jū) - 数字10 (숫자 10)'),
  ('KO', '열', '고유어 숫자 10. yeol')
) AS v(lang, expr, hint)
WHERE s.meaning = '열' AND l.level_number = 2 AND sk.display_order = 1;

-- Level 2, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Mom', 'Informal word for mother'),
  ('ES', 'Mamá', 'Palabra informal para madre'),
  ('ZH', '妈妈', 'mā ma - 妈妈（非正式）(엄마, 비격식)'),
  ('JA', 'お母さん', 'おかあさん(okāsan) - お母さん (어머니)'),
  ('KO', '엄마', '어머니의 비격식 표현. 가족 호칭. eomma')
) AS v(lang, expr, hint)
WHERE s.meaning = '엄마' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Dad', 'Informal word for father'),
  ('ES', 'Papá', 'Palabra informal para padre'),
  ('ZH', '爸爸', 'bà ba - 爸爸（非正式）(아빠, 비격식)'),
  ('JA', 'お父さん', 'おとうさん(otōsan) - お父さん (아버지)'),
  ('KO', '아빠', '아버지의 비격식 표현. 가족 호칭. appa')
) AS v(lang, expr, hint)
WHERE s.meaning = '아빠' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Older brother', 'Used by males for their older brother'),
  ('ES', 'Hermano mayor', 'Usado por hombres para su hermano mayor'),
  ('ZH', '哥哥', 'gē ge - 哥哥（男性用）(형, 남성이 사용)'),
  ('JA', 'お兄さん', 'おにいさん(oniisan) - お兄さん (형/오빠)'),
  ('KO', '형', '남자가 손위 남자 형제를 부르는 호칭. hyeong')
) AS v(lang, expr, hint)
WHERE s.meaning = '형' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Older sister', 'Used by males for their older sister'),
  ('ES', 'Hermana mayor', 'Usado por hombres para su hermana mayor'),
  ('ZH', '姐姐', 'jiě jie - 姐姐（男性用）(누나, 남성이 사용)'),
  ('JA', 'お姉さん', 'おねえさん(onēsan) - お姉さん (누나/언니)'),
  ('KO', '누나', '남자가 손위 여자 형제를 부르는 호칭. nuna')
) AS v(lang, expr, hint)
WHERE s.meaning = '누나' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Younger sibling', 'Younger brother or sister'),
  ('ES', 'Hermano/a menor', 'Hermano o hermana menor'),
  ('ZH', '弟弟/妹妹', 'dì di/mèi mei - 弟弟或妹妹 (남동생 또는 여동생)'),
  ('JA', '弟/妹', 'おとうと/いもうと(otōto/imōto) - 弟または妹 (동생)'),
  ('KO', '동생', '손아래 형제자매를 부르는 호칭. 성별 무관. dongsaeng')
) AS v(lang, expr, hint)
WHERE s.meaning = '동생' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Grandmother', 'Grandma'),
  ('ES', 'Abuela', 'Abuelita'),
  ('ZH', '奶奶', 'nǎi nai - 奶奶/外婆 (할머니)'),
  ('JA', 'おばあさん', 'おばあさん(obāsan) - おばあさん (할머니)'),
  ('KO', '할머니', '아버지 또는 어머니의 어머니. halmeoni')
) AS v(lang, expr, hint)
WHERE s.meaning = '할머니' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Grandfather', 'Grandpa'),
  ('ES', 'Abuelo', 'Abuelito'),
  ('ZH', '爷爷', 'yé ye - 爷爷/外公 (할아버지)'),
  ('JA', 'おじいさん', 'おじいさん(ojiisan) - おじいさん (할아버지)'),
  ('KO', '할아버지', '아버지 또는 어머니의 아버지. harabeoji')
) AS v(lang, expr, hint)
WHERE s.meaning = '할아버지' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Family', 'Noun meaning family'),
  ('ES', 'Familia', 'Sustantivo que significa familia'),
  ('ZH', '家人', 'jiā rén - 家人，家庭 (가족, 가정)'),
  ('JA', '家族', 'かぞく(kazoku) - 家族 (가족)'),
  ('KO', '가족', '함께 사는 혈연관계의 사람들. gajok')
) AS v(lang, expr, hint)
WHERE s.meaning = '가족' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Parents', 'Father and mother'),
  ('ES', 'Padres', 'Padre y madre'),
  ('ZH', '父母', 'fù mǔ - 父母 (부모)'),
  ('JA', '両親', 'りょうしん(ryōshin) - 両親 (양친, 부모)'),
  ('KO', '부모님', '아버지와 어머니를 함께 부르는 존칭. bumonim')
) AS v(lang, expr, hint)
WHERE s.meaning = '부모님' AND l.level_number = 2 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Child', 'A young person, kid'),
  ('ES', 'Niño', 'Persona joven, chico'),
  ('ZH', '孩子', 'hái zi - 孩子，小孩 (아이, 어린이)'),
  ('JA', '子ども', 'こども(kodomo) - 子供 (아이)'),
  ('KO', '아이', '어린 사람. 자녀를 뜻하기도 함. ai')
) AS v(lang, expr, hint)
WHERE s.meaning = '아이' AND l.level_number = 2 AND sk.display_order = 2;

-- Level 2, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Head', 'Body part, top of the body'),
  ('ES', 'Cabeza', 'Parte del cuerpo, parte superior'),
  ('ZH', '头', 'tóu - 身体部位，头部 (신체 부위, 머리)'),
  ('JA', '頭', 'あたま(atama) - 頭、体の部位 (머리, 신체 부위)'),
  ('KO', '머리', '신체 부위. 머리카락을 뜻하기도 함. meori')
) AS v(lang, expr, hint)
WHERE s.meaning = '머리' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Eye', 'Body part, organ of sight'),
  ('ES', 'Ojo', 'Parte del cuerpo, órgano de la vista'),
  ('ZH', '眼睛', 'yǎn jīng - 身体部位，眼睛 (신체 부위, 눈)'),
  ('JA', '目', 'め(me) - 目、体の部位 (눈, 신체 부위)'),
  ('KO', '눈', '신체 부위. ''눈(snow)''과 같은 형태. nun')
) AS v(lang, expr, hint)
WHERE s.meaning = '눈' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Nose', 'Body part, organ of smell'),
  ('ES', 'Nariz', 'Parte del cuerpo, órgano del olfato'),
  ('ZH', '鼻子', 'bí zi - 身体部位，鼻子 (신체 부위, 코)'),
  ('JA', '鼻', 'はな(hana) - 鼻、体の部位 (코, 신체 부위)'),
  ('KO', '코', '신체 부위. 냄새를 맡는 기관. ko')
) AS v(lang, expr, hint)
WHERE s.meaning = '코' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Mouth', 'Body part used for eating and speaking'),
  ('ES', 'Boca', 'Parte del cuerpo para comer y hablar'),
  ('ZH', '嘴', 'zuǐ - 身体部位，嘴巴 (신체 부위, 입)'),
  ('JA', '口', 'くち(kuchi) - 口、体の部位 (입, 신체 부위)'),
  ('KO', '입', '신체 부위. 먹고 말하는 기관. ip')
) AS v(lang, expr, hint)
WHERE s.meaning = '입' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Ear', 'Body part, organ of hearing'),
  ('ES', 'Oreja', 'Parte del cuerpo, órgano del oído'),
  ('ZH', '耳朵', 'ěr duo - 身体部位，耳朵 (신체 부위, 귀)'),
  ('JA', '耳', 'みみ(mimi) - 耳、体の部位 (귀, 신체 부위)'),
  ('KO', '귀', '신체 부위. 소리를 듣는 기관. gwi')
) AS v(lang, expr, hint)
WHERE s.meaning = '귀' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hand', 'Body part at the end of the arm'),
  ('ES', 'Mano', 'Parte del cuerpo al final del brazo'),
  ('ZH', '手', 'shǒu - 身体部位，手 (신체 부위, 손)'),
  ('JA', '手', 'て(te) - 手、体の部位 (손, 신체 부위)'),
  ('KO', '손', '신체 부위. 물건을 잡는 부분. son')
) AS v(lang, expr, hint)
WHERE s.meaning = '손' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Foot', 'Body part at the end of the leg'),
  ('ES', 'Pie', 'Parte del cuerpo al final de la pierna'),
  ('ZH', '脚', 'jiǎo - 身体部位，脚 (신체 부위, 발)'),
  ('JA', '足', 'あし(ashi) - 足、体の部位 (발, 신체 부위)'),
  ('KO', '발', '신체 부위. 걸을 때 사용하는 부분. bal')
) AS v(lang, expr, hint)
WHERE s.meaning = '발' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Arm', 'Body part between shoulder and hand'),
  ('ES', 'Brazo', 'Parte del cuerpo entre hombro y mano'),
  ('ZH', '胳膊', 'gē bo - 身体部位，胳膊 (신체 부위, 팔)'),
  ('JA', '腕', 'うで(ude) - 腕、体の部位 (팔, 신체 부위)'),
  ('KO', '팔', '신체 부위. 어깨와 손 사이. 숫자 8과 동음. pal')
) AS v(lang, expr, hint)
WHERE s.meaning = '팔' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Leg', 'Body part used for walking'),
  ('ES', 'Pierna', 'Parte del cuerpo para caminar'),
  ('ZH', '腿', 'tuǐ - 身体部位，腿 (신체 부위, 다리)'),
  ('JA', '脚', 'あし(ashi) - 脚、体の部位 (다리, 신체 부위)'),
  ('KO', '다리', '신체 부위. 걷기에 사용. 다리(bridge)와 동음. dari')
) AS v(lang, expr, hint)
WHERE s.meaning = '다리' AND l.level_number = 2 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Face', 'Front part of the head'),
  ('ES', 'Cara', 'Parte frontal de la cabeza'),
  ('ZH', '脸', 'liǎn - 身体部位，脸 (신체 부위, 얼굴)'),
  ('JA', '顔', 'かお(kao) - 顔、体の部位 (얼굴, 신체 부위)'),
  ('KO', '얼굴', '신체 부위. 머리의 앞부분. eolgul')
) AS v(lang, expr, hint)
WHERE s.meaning = '얼굴' AND l.level_number = 2 AND sk.display_order = 3;

-- Level 2, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Red', 'Color of fire, blood'),
  ('ES', 'Rojo', 'Color del fuego, la sangre'),
  ('ZH', '红色', 'hóng sè - 颜色，红色 (색상, 빨간색)'),
  ('JA', '赤', 'あか(aka) - 赤い色 (빨간색)'),
  ('KO', '빨간색', '기본 색상. 불, 피의 색. ppalgansaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '빨간색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Blue', 'Color of sky, ocean'),
  ('ES', 'Azul', 'Color del cielo, océano'),
  ('ZH', '蓝色', 'lán sè - 颜色，蓝色 (색상, 파란색)'),
  ('JA', '青', 'あお(ao) - 青い色 (파란색)'),
  ('KO', '파란색', '기본 색상. 하늘, 바다의 색. paransaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '파란색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Yellow', 'Color of the sun, bananas'),
  ('ES', 'Amarillo', 'Color del sol, plátanos'),
  ('ZH', '黄色', 'huáng sè - 颜色，黄色 (색상, 노란색)'),
  ('JA', '黄色', 'きいろ(kiiro) - 黄色い色 (노란색)'),
  ('KO', '노란색', '기본 색상. 태양, 바나나의 색. noransaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '노란색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Green', 'Color of grass, leaves'),
  ('ES', 'Verde', 'Color del pasto, hojas'),
  ('ZH', '绿色', 'lǜ sè - 颜色，绿色 (색상, 초록색)'),
  ('JA', '緑', 'みどり(midori) - 緑色 (초록색)'),
  ('KO', '초록색', '기본 색상. 풀, 잎의 색. choroksaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '초록색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'White', 'Color of snow, milk'),
  ('ES', 'Blanco', 'Color de la nieve, leche'),
  ('ZH', '白色', 'bái sè - 颜色，白色 (색상, 하얀색)'),
  ('JA', '白', 'しろ(shiro) - 白い色 (하얀색)'),
  ('KO', '하얀색', '기본 색상. 눈, 우유의 색. hayansaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '하얀색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Black', 'Color of night, coal'),
  ('ES', 'Negro', 'Color de la noche, carbón'),
  ('ZH', '黑色', 'hēi sè - 颜色，黑色 (색상, 검은색)'),
  ('JA', '黒', 'くろ(kuro) - 黒い色 (검은색)'),
  ('KO', '검은색', '기본 색상. 밤, 석탄의 색. geomeunsaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '검은색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Orange', 'Color between red and yellow'),
  ('ES', 'Naranja', 'Color entre rojo y amarillo'),
  ('ZH', '橙色', 'chéng sè - 颜色，橙色 (색상, 주황색)'),
  ('JA', 'オレンジ', 'オレンジ(orenji) - オレンジ色 (주황색)'),
  ('KO', '주황색', '기본 색상. 빨간색과 노란색의 중간. juhwangsaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '주황색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Purple', 'Color between red and blue'),
  ('ES', 'Morado', 'Color entre rojo y azul'),
  ('ZH', '紫色', 'zǐ sè - 颜色，紫色 (색상, 보라색)'),
  ('JA', '紫', 'むらさき(murasaki) - 紫色 (보라색)'),
  ('KO', '보라색', '기본 색상. 빨간색과 파란색의 중간. borasaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '보라색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Pink', 'Light red color'),
  ('ES', 'Rosa', 'Color rojo claro'),
  ('ZH', '粉红色', 'fěn hóng sè - 颜色，粉红色 (색상, 분홍색)'),
  ('JA', 'ピンク', 'ピンク(pinku) - ピンク色 (분홍색)'),
  ('KO', '분홍색', '기본 색상. 연한 빨간색. bunhongsaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '분홍색' AND l.level_number = 2 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Brown', 'Color of earth, chocolate'),
  ('ES', 'Marrón', 'Color de la tierra, chocolate'),
  ('ZH', '棕色', 'zōng sè - 颜色，棕色 (색상, 갈색)'),
  ('JA', '茶色', 'ちゃいろ(chairo) - 茶色 (갈색)'),
  ('KO', '갈색', '기본 색상. 흙, 초콜릿의 색. galsaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '갈색' AND l.level_number = 2 AND sk.display_order = 4;

-- Level 3, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'House', 'A building where people live'),
  ('ES', 'Casa', 'Edificio donde vive la gente'),
  ('ZH', '家', 'jiā - 房子，住所 (집, 거주지)'),
  ('JA', '家', 'いえ(ie) - 家、住む場所 (집, 사는 곳)'),
  ('KO', '집', '사람이 사는 건물. 가정을 뜻하기도 함. jip')
) AS v(lang, expr, hint)
WHERE s.meaning = '집' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Door', 'Opening in a wall for entry'),
  ('ES', 'Puerta', 'Abertura en la pared para entrar'),
  ('ZH', '门', 'mén - 门，出入口 (문, 출입구)'),
  ('JA', 'ドア', 'ドア(doa) - 出入り口 (출입구)'),
  ('KO', '문', '출입구에 설치된 것. 열고 닫을 수 있음. mun')
) AS v(lang, expr, hint)
WHERE s.meaning = '문' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Window', 'Opening in a wall for light and air'),
  ('ES', 'Ventana', 'Abertura en la pared para luz y aire'),
  ('ZH', '窗户', 'chuāng hu - 窗户 (창문)'),
  ('JA', '窓', 'まど(mado) - 窓 (창문)'),
  ('KO', '창문', '벽에 있는 빛과 공기를 위한 개구부. changmun')
) AS v(lang, expr, hint)
WHERE s.meaning = '창문' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Table', 'Flat surface with legs for placing things'),
  ('ES', 'Mesa', 'Superficie plana con patas para poner cosas'),
  ('ZH', '桌子', 'zhuō zi - 桌子 (탁자)'),
  ('JA', 'テーブル', 'テーブル(tēburu) - テーブル (탁자)'),
  ('KO', '탁자', '물건을 올려놓는 가구. ''테이블''이라고도 함. takja')
) AS v(lang, expr, hint)
WHERE s.meaning = '탁자' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Chair', 'Seat with a back for one person'),
  ('ES', 'Silla', 'Asiento con respaldo para una persona'),
  ('ZH', '椅子', 'yǐ zi - 椅子 (의자)'),
  ('JA', '椅子', 'いす(isu) - 椅子 (의자)'),
  ('KO', '의자', '앉기 위한 가구. uija')
) AS v(lang, expr, hint)
WHERE s.meaning = '의자' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bed', 'Furniture for sleeping'),
  ('ES', 'Cama', 'Mueble para dormir'),
  ('ZH', '床', 'chuáng - 床，睡觉的家具 (침대, 잠자는 가구)'),
  ('JA', 'ベッド', 'ベッド(beddo) - ベッド (침대)'),
  ('KO', '침대', '잠을 자기 위한 가구. chimdae')
) AS v(lang, expr, hint)
WHERE s.meaning = '침대' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Room', 'A space within a building'),
  ('ES', 'Habitación', 'Un espacio dentro de un edificio'),
  ('ZH', '房间', 'fáng jiān - 房间 (방)'),
  ('JA', '部屋', 'へや(heya) - 部屋 (방)'),
  ('KO', '방', '건물 안의 공간. bang')
) AS v(lang, expr, hint)
WHERE s.meaning = '방' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Kitchen', 'Room where food is prepared'),
  ('ES', 'Cocina', 'Habitación donde se prepara la comida'),
  ('ZH', '厨房', 'chú fáng - 厨房 (부엌)'),
  ('JA', '台所', 'だいどころ(daidokoro) - 台所 (부엌)'),
  ('KO', '부엌', '음식을 만드는 방. bueok')
) AS v(lang, expr, hint)
WHERE s.meaning = '부엌' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bathroom', 'Room with toilet and sink'),
  ('ES', 'Baño', 'Habitación con inodoro y lavabo'),
  ('ZH', '卫生间', 'wèi shēng jiān - 卫生间，厕所 (화장실)'),
  ('JA', 'トイレ', 'トイレ(toire) - トイレ (화장실)'),
  ('KO', '화장실', '용변을 보는 방. hwajangshil')
) AS v(lang, expr, hint)
WHERE s.meaning = '화장실' AND l.level_number = 3 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Mirror', 'Reflective surface to see yourself'),
  ('ES', 'Espejo', 'Superficie reflectante para verse'),
  ('ZH', '镜子', 'jìng zi - 镜子 (거울)'),
  ('JA', '鏡', 'かがみ(kagami) - 鏡 (거울)'),
  ('KO', '거울', '모습을 비추는 물건. geoul')
) AS v(lang, expr, hint)
WHERE s.meaning = '거울' AND l.level_number = 3 AND sk.display_order = 1;

-- Level 3, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Water', 'Clear liquid for drinking'),
  ('ES', 'Agua', 'Líquido transparente para beber'),
  ('ZH', '水', 'shuǐ - 水，饮用液体 (물, 마시는 액체)'),
  ('JA', '水', 'みず(mizu) - 水 (물)'),
  ('KO', '물', '마시는 투명한 액체. mul')
) AS v(lang, expr, hint)
WHERE s.meaning = '물' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Rice / Meal', 'Cooked rice; also means ''meal'' in Korean'),
  ('ES', 'Arroz / Comida', 'Arroz cocido; también significa ''comida'''),
  ('ZH', '米饭', 'mǐ fàn - 米饭，也指饭食 (쌀밥, 식사를 뜻하기도 함)'),
  ('JA', 'ご飯', 'ごはん(gohan) - ご飯、食事 (밥, 식사)'),
  ('KO', '밥', '쌀로 지은 음식. 식사를 뜻하기도 함. bap')
) AS v(lang, expr, hint)
WHERE s.meaning = '밥' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bread', 'Baked food made from flour'),
  ('ES', 'Pan', 'Alimento horneado hecho de harina'),
  ('ZH', '面包', 'miàn bāo - 面包 (빵)'),
  ('JA', 'パン', 'パン(pan) - パン (빵)'),
  ('KO', '빵', '밀가루로 만든 구운 음식. ppang')
) AS v(lang, expr, hint)
WHERE s.meaning = '빵' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Meat', 'Animal flesh used as food'),
  ('ES', 'Carne', 'Carne de animal usada como alimento'),
  ('ZH', '肉', 'ròu - 肉 (고기)'),
  ('JA', '肉', 'にく(niku) - 肉 (고기)'),
  ('KO', '고기', '동물의 살. 식용 육류. gogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '고기' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Fruit', 'Sweet food from plants'),
  ('ES', 'Fruta', 'Alimento dulce de las plantas'),
  ('ZH', '水果', 'shuǐ guǒ - 水果 (과일)'),
  ('JA', '果物', 'くだもの(kudamono) - 果物 (과일)'),
  ('KO', '과일', '식물에서 나는 달콤한 식품. gwail')
) AS v(lang, expr, hint)
WHERE s.meaning = '과일' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Milk', 'White liquid from cows'),
  ('ES', 'Leche', 'Líquido blanco de las vacas'),
  ('ZH', '牛奶', 'niú nǎi - 牛奶 (우유)'),
  ('JA', '牛乳', 'ぎゅうにゅう(gyūnyū) - 牛乳 (우유)'),
  ('KO', '우유', '소에서 나는 흰 음료. uyu')
) AS v(lang, expr, hint)
WHERE s.meaning = '우유' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Egg', 'Oval food from chickens'),
  ('ES', 'Huevo', 'Alimento ovalado de las gallinas'),
  ('ZH', '鸡蛋', 'jī dàn - 鸡蛋 (달걀)'),
  ('JA', '卵', 'たまご(tamago) - 卵 (달걀)'),
  ('KO', '달걀', '닭이 낳는 알. ''계란''이라고도 함. dalgyal')
) AS v(lang, expr, hint)
WHERE s.meaning = '달걀' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Vegetable', 'Edible plant or part of a plant'),
  ('ES', 'Verdura', 'Planta comestible o parte de una planta'),
  ('ZH', '蔬菜', 'shū cài - 蔬菜 (채소)'),
  ('JA', '野菜', 'やさい(yasai) - 野菜 (채소)'),
  ('KO', '채소', '먹을 수 있는 식물. ''야채''라고도 함. chaeso')
) AS v(lang, expr, hint)
WHERE s.meaning = '채소' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Soup', 'Liquid food made by boiling'),
  ('ES', 'Sopa', 'Alimento líquido hecho al hervir'),
  ('ZH', '汤', 'tāng - 汤 (국, 탕)'),
  ('JA', 'スープ', 'スープ(sūpu) - スープ (수프, 국)'),
  ('KO', '국', '물에 재료를 넣고 끓인 음식. guk')
) AS v(lang, expr, hint)
WHERE s.meaning = '국' AND l.level_number = 3 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tea', 'Hot beverage made from leaves'),
  ('ES', 'Té', 'Bebida caliente hecha con hojas'),
  ('ZH', '茶', 'chá - 茶 (차)'),
  ('JA', 'お茶', 'おちゃ(ocha) - お茶 (차)'),
  ('KO', '차', '잎을 우린 뜨거운 음료. 자동차(car)와 동음. cha')
) AS v(lang, expr, hint)
WHERE s.meaning = '차' AND l.level_number = 3 AND sk.display_order = 2;

-- Level 3, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Dog', 'Common pet animal'),
  ('ES', 'Perro', 'Animal doméstico común'),
  ('ZH', '狗', 'gǒu - 狗 (개)'),
  ('JA', '犬', 'いぬ(inu) - 犬 (개)'),
  ('KO', '개', '흔한 반려동물. gae')
) AS v(lang, expr, hint)
WHERE s.meaning = '개' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cat', 'Common pet animal'),
  ('ES', 'Gato', 'Animal doméstico común'),
  ('ZH', '猫', 'māo - 猫 (고양이)'),
  ('JA', '猫', 'ねこ(neko) - 猫 (고양이)'),
  ('KO', '고양이', '흔한 반려동물. goyangi')
) AS v(lang, expr, hint)
WHERE s.meaning = '고양이' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bird', 'Animal with feathers and wings'),
  ('ES', 'Pájaro', 'Animal con plumas y alas'),
  ('ZH', '鸟', 'niǎo - 鸟 (새)'),
  ('JA', '鳥', 'とり(tori) - 鳥 (새)'),
  ('KO', '새', '깃털과 날개가 있는 동물. sae')
) AS v(lang, expr, hint)
WHERE s.meaning = '새' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Fish', 'Animal that lives in water'),
  ('ES', 'Pez', 'Animal que vive en el agua'),
  ('ZH', '鱼', 'yú - 鱼 (물고기)'),
  ('JA', '魚', 'さかな(sakana) - 魚 (물고기)'),
  ('KO', '물고기', '물에 사는 동물. mulgogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '물고기' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cow', 'Large farm animal for milk and meat'),
  ('ES', 'Vaca', 'Animal de granja grande para leche y carne'),
  ('ZH', '牛', 'niú - 牛 (소)'),
  ('JA', '牛', 'うし(ushi) - 牛 (소)'),
  ('KO', '소', '큰 가축. 우유와 고기를 얻음. so')
) AS v(lang, expr, hint)
WHERE s.meaning = '소' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Horse', 'Large animal used for riding'),
  ('ES', 'Caballo', 'Animal grande usado para montar'),
  ('ZH', '马', 'mǎ - 马 (말)'),
  ('JA', '馬', 'うま(uma) - 馬 (말)'),
  ('KO', '말', '큰 동물. 타고 다님. ''말(speech)''과 동음. mal')
) AS v(lang, expr, hint)
WHERE s.meaning = '말' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Pig', 'Farm animal raised for meat'),
  ('ES', 'Cerdo', 'Animal de granja criado para carne'),
  ('ZH', '猪', 'zhū - 猪 (돼지)'),
  ('JA', '豚', 'ぶた(buta) - 豚 (돼지)'),
  ('KO', '돼지', '가축. 돼지고기를 얻음. dwaeji')
) AS v(lang, expr, hint)
WHERE s.meaning = '돼지' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Chicken', 'Bird raised for eggs and meat'),
  ('ES', 'Pollo', 'Ave criada para huevos y carne'),
  ('ZH', '鸡', 'jī - 鸡 (닭)'),
  ('JA', '鶏', 'にわとり(niwatori) - 鶏 (닭)'),
  ('KO', '닭', '달걀과 고기를 얻는 새. dak')
) AS v(lang, expr, hint)
WHERE s.meaning = '닭' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Rabbit', 'Small animal with long ears'),
  ('ES', 'Conejo', 'Animal pequeño con orejas largas'),
  ('ZH', '兔子', 'tù zi - 兔子 (토끼)'),
  ('JA', 'うさぎ', 'うさぎ(usagi) - うさぎ (토끼)'),
  ('KO', '토끼', '귀가 긴 작은 동물. tokki')
) AS v(lang, expr, hint)
WHERE s.meaning = '토끼' AND l.level_number = 3 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Mouse', 'Small rodent'),
  ('ES', 'Ratón', 'Pequeño roedor'),
  ('ZH', '老鼠', 'lǎo shǔ - 老鼠 (쥐)'),
  ('JA', 'ネズミ', 'ネズミ(nezumi) - ネズミ (쥐)'),
  ('KO', '쥐', '작은 설치류 동물. jwi')
) AS v(lang, expr, hint)
WHERE s.meaning = '쥐' AND l.level_number = 3 AND sk.display_order = 3;

-- Level 3, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'School', 'Place for learning and education'),
  ('ES', 'Escuela', 'Lugar para aprender y educarse'),
  ('ZH', '学校', 'xué xiào - 学校 (학교)'),
  ('JA', '学校', 'がっこう(gakkō) - 学校 (학교)'),
  ('KO', '학교', '배우고 교육받는 곳. hakgyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '학교' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Store', 'Place where things are sold'),
  ('ES', 'Tienda', 'Lugar donde se venden cosas'),
  ('ZH', '商店', 'shāng diàn - 商店 (가게)'),
  ('JA', '店', 'みせ(mise) - 店 (가게)'),
  ('KO', '가게', '물건을 파는 곳. gage')
) AS v(lang, expr, hint)
WHERE s.meaning = '가게' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Park', 'Public green space for recreation'),
  ('ES', 'Parque', 'Espacio verde público para recreación'),
  ('ZH', '公园', 'gōng yuán - 公园 (공원)'),
  ('JA', '公園', 'こうえん(kōen) - 公園 (공원)'),
  ('KO', '공원', '쉬거나 운동하는 공공 녹지. gongwon')
) AS v(lang, expr, hint)
WHERE s.meaning = '공원' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hospital', 'Place for medical treatment'),
  ('ES', 'Hospital', 'Lugar para tratamiento médico'),
  ('ZH', '医院', 'yī yuàn - 医院 (병원)'),
  ('JA', '病院', 'びょういん(byōin) - 病院 (병원)'),
  ('KO', '병원', '아픈 사람을 치료하는 곳. byeongwon')
) AS v(lang, expr, hint)
WHERE s.meaning = '병원' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bank', 'Place for financial services'),
  ('ES', 'Banco', 'Lugar para servicios financieros'),
  ('ZH', '银行', 'yín háng - 银行 (은행)'),
  ('JA', '銀行', 'ぎんこう(ginkō) - 銀行 (은행)'),
  ('KO', '은행', '돈을 맡기거나 빌리는 곳. eunhaeng')
) AS v(lang, expr, hint)
WHERE s.meaning = '은행' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Station', 'Place where trains or buses stop'),
  ('ES', 'Estación', 'Lugar donde paran trenes o autobuses'),
  ('ZH', '车站', 'chē zhàn - 车站 (역, 정류장)'),
  ('JA', '駅', 'えき(eki) - 駅 (역)'),
  ('KO', '역', '기차나 지하철이 서는 곳. yeok')
) AS v(lang, expr, hint)
WHERE s.meaning = '역' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Restaurant', 'Place where meals are served'),
  ('ES', 'Restaurante', 'Lugar donde se sirven comidas'),
  ('ZH', '餐厅', 'cān tīng - 餐厅 (식당)'),
  ('JA', 'レストラン', 'レストラン(resutoran) - レストラン (식당)'),
  ('KO', '식당', '음식을 파는 곳. sikdang')
) AS v(lang, expr, hint)
WHERE s.meaning = '식당' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Library', 'Place with books for reading'),
  ('ES', 'Biblioteca', 'Lugar con libros para leer'),
  ('ZH', '图书馆', 'tú shū guǎn - 图书馆 (도서관)'),
  ('JA', '図書館', 'としょかん(toshokan) - 図書館 (도서관)'),
  ('KO', '도서관', '책을 읽거나 빌리는 곳. doseogwan')
) AS v(lang, expr, hint)
WHERE s.meaning = '도서관' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Post office', 'Place for sending mail'),
  ('ES', 'Oficina de correos', 'Lugar para enviar correo'),
  ('ZH', '邮局', 'yóu jú - 邮局 (우체국)'),
  ('JA', '郵便局', 'ゆうびんきょく(yūbinkyoku) - 郵便局 (우체국)'),
  ('KO', '우체국', '편지와 소포를 보내는 곳. ucheguk')
) AS v(lang, expr, hint)
WHERE s.meaning = '우체국' AND l.level_number = 3 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Market', 'Place where goods are bought and sold'),
  ('ES', 'Mercado', 'Lugar donde se compran y venden productos'),
  ('ZH', '市场', 'shì chǎng - 市场 (시장)'),
  ('JA', '市場', 'いちば(ichiba) - 市場 (시장)'),
  ('KO', '시장', '물건을 사고파는 곳. 전통시장. sijang')
) AS v(lang, expr, hint)
WHERE s.meaning = '시장' AND l.level_number = 3 AND sk.display_order = 4;

-- Level 4, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To go', 'Verb meaning to move to a place'),
  ('ES', 'Ir', 'Verbo que significa moverse a un lugar'),
  ('ZH', '去', 'qù - 动词，去 (동사, 가다)'),
  ('JA', '行く', 'いく(iku) - 行く、動詞 (가다, 동사)'),
  ('KO', '가다', '기본 동사. 어떤 장소로 이동함. gada')
) AS v(lang, expr, hint)
WHERE s.meaning = '가다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To come', 'Verb meaning to move toward the speaker'),
  ('ES', 'Venir', 'Verbo que significa moverse hacia el hablante'),
  ('ZH', '来', 'lái - 动词，来 (동사, 오다)'),
  ('JA', '来る', 'くる(kuru) - 来る、動詞 (오다, 동사)'),
  ('KO', '오다', '기본 동사. 말하는 사람 쪽으로 이동함. oda')
) AS v(lang, expr, hint)
WHERE s.meaning = '오다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To eat', 'Verb meaning to consume food'),
  ('ES', 'Comer', 'Verbo que significa consumir alimentos'),
  ('ZH', '吃', 'chī - 动词，吃 (동사, 먹다)'),
  ('JA', '食べる', 'たべる(taberu) - 食べる、動詞 (먹다, 동사)'),
  ('KO', '먹다', '기본 동사. 음식을 입에 넣고 삼킴. meokda')
) AS v(lang, expr, hint)
WHERE s.meaning = '먹다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To drink', 'Verb meaning to consume liquid'),
  ('ES', 'Beber', 'Verbo que significa consumir líquido'),
  ('ZH', '喝', 'hē - 动词，喝 (동사, 마시다)'),
  ('JA', '飲む', 'のむ(nomu) - 飲む、動詞 (마시다, 동사)'),
  ('KO', '마시다', '기본 동사. 액체를 삼킴. masida')
) AS v(lang, expr, hint)
WHERE s.meaning = '마시다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To sleep', 'Verb meaning to rest with eyes closed'),
  ('ES', 'Dormir', 'Verbo que significa descansar con los ojos cerrados'),
  ('ZH', '睡觉', 'shuì jiào - 动词，睡觉 (동사, 자다)'),
  ('JA', '寝る', 'ねる(neru) - 寝る、動詞 (자다, 동사)'),
  ('KO', '자다', '기본 동사. 눈을 감고 쉼. jada')
) AS v(lang, expr, hint)
WHERE s.meaning = '자다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To see / To watch', 'Verb meaning to look at or watch'),
  ('ES', 'Ver', 'Verbo que significa mirar u observar'),
  ('ZH', '看', 'kàn - 动词，看 (동사, 보다)'),
  ('JA', '見る', 'みる(miru) - 見る、動詞 (보다, 동사)'),
  ('KO', '보다', '기본 동사. 눈으로 봄. 영화를 ''보다''에도 사용. boda')
) AS v(lang, expr, hint)
WHERE s.meaning = '보다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Go to school', 'Phrase: destination + go'),
  ('ES', 'Ir a la escuela', 'Frase: destino + ir'),
  ('ZH', '去学校', 'qù xué xiào - 去+地点 (가다+장소)'),
  ('JA', '学校に行く', 'がっこうにいく(gakkō ni iku) - 場所+に+行く (장소+에+가다)'),
  ('KO', '학교에 가다', '장소+에+가다 패턴. ''에''는 방향 조사. hakgyoe gada')
) AS v(lang, expr, hint)
WHERE s.meaning = '학교에 가다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Drink water', 'Phrase: object + verb'),
  ('ES', 'Beber agua', 'Frase: objeto + verbo'),
  ('ZH', '喝水', 'hē shuǐ - 喝+水 (마시다+물)'),
  ('JA', '水を飲む', 'みずをのむ(mizu o nomu) - 水+を+飲む (물+을+마시다)'),
  ('KO', '물 마시다', '목적어+동사 패턴. mul masida')
) AS v(lang, expr, hint)
WHERE s.meaning = '물 마시다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Eat a meal', 'Phrase: object + verb'),
  ('ES', 'Comer', 'Frase: objeto + verbo'),
  ('ZH', '吃饭', 'chī fàn - 吃+饭 (먹다+밥)'),
  ('JA', 'ご飯を食べる', 'ごはんをたべる(gohan o taberu) - ご飯+を+食べる (밥+을+먹다)'),
  ('KO', '밥 먹다', '목적어+동사 패턴. 식사하다라는 뜻. bap meokda')
) AS v(lang, expr, hint)
WHERE s.meaning = '밥 먹다' AND l.level_number = 4 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Come here', 'Phrase: place + come'),
  ('ES', 'Ven aquí', 'Frase: lugar + venir'),
  ('ZH', '来这里', 'lái zhè lǐ - 来+这里 (오다+여기)'),
  ('JA', 'ここに来る', 'ここにくる(koko ni kuru) - ここ+に+来る (여기+에+오다)'),
  ('KO', '여기 오다', '장소+오다 패턴. yeogi oda')
) AS v(lang, expr, hint)
WHERE s.meaning = '여기 오다' AND l.level_number = 4 AND sk.display_order = 1;

-- Level 4, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To be', 'Copula verb, linking subject to noun'),
  ('ES', 'Ser', 'Verbo copulativo'),
  ('ZH', '是', 'shì - 动词，是 (동사, ~이다)'),
  ('JA', 'です', 'です(desu) - 〜です (〜이다, 정중)'),
  ('KO', '이다', '서술격 조사. 명사 뒤에 붙어 ''~이다''를 나타냄. ida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To exist / To have', 'Verb meaning there is, or to have'),
  ('ES', 'Haber / Tener', 'Verbo que significa existir o tener'),
  ('ZH', '有', 'yǒu - 动词，有/在 (동사, 있다/존재하다)'),
  ('JA', 'ある / いる', 'ある(aru)/いる(iru) - ある(物)/いる(人) (있다: 사물/사람)'),
  ('KO', '있다', '존재 또는 소유를 나타내는 동사. 반대말: 없다. itda')
) AS v(lang, expr, hint)
WHERE s.meaning = '있다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To not exist / To not have', 'Verb meaning there is not, or to not have'),
  ('ES', 'No haber / No tener', 'Verbo que significa no existir o no tener'),
  ('ZH', '没有', 'méi yǒu - 动词，没有 (동사, 없다)'),
  ('JA', 'ない', 'ない(nai) - ない (없다)'),
  ('KO', '없다', '존재하지 않거나 소유하지 않음. 반대말: 있다. eopda')
) AS v(lang, expr, hint)
WHERE s.meaning = '없다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To like', 'Verb meaning to be fond of'),
  ('ES', 'Gustar', 'Verbo que significa agradar'),
  ('ZH', '喜欢', 'xǐ huān - 动词，喜欢 (동사, 좋아하다)'),
  ('JA', '好き', 'すき(suki) - 好き (좋아하다)'),
  ('KO', '좋아하다', '감정 동사. 무엇을 좋게 여김. joahada')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋아하다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To dislike', 'Verb meaning to not be fond of'),
  ('ES', 'No gustar', 'Verbo que significa no agradar'),
  ('ZH', '讨厌', 'tǎo yàn - 动词，讨厌 (동사, 싫어하다)'),
  ('JA', '嫌い', 'きらい(kirai) - 嫌い (싫어하다)'),
  ('KO', '싫어하다', '감정 동사. 무엇을 싫게 여김. 반대말: 좋아하다. sireohada')
) AS v(lang, expr, hint)
WHERE s.meaning = '싫어하다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To want', 'Verb meaning to desire'),
  ('ES', 'Querer', 'Verbo que significa desear'),
  ('ZH', '想要', 'xiǎng yào - 动词，想要 (동사, 원하다)'),
  ('JA', '欲しい', 'ほしい(hoshii) - 欲しい (원하다, 갖고 싶다)'),
  ('KO', '원하다', '감정 동사. 무엇을 바람. wonhada')
) AS v(lang, expr, hint)
WHERE s.meaning = '원하다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is water', 'Phrase: noun + exist'),
  ('ES', 'Hay agua', 'Frase: sustantivo + existir'),
  ('ZH', '有水', 'yǒu shuǐ - 有+水 (있다+물)'),
  ('JA', '水がある', 'みずがある(mizu ga aru) - 水+が+ある (물+이+있다)'),
  ('KO', '물 있다', '명사+있다 패턴. 존재를 나타냄. mul itda')
) AS v(lang, expr, hint)
WHERE s.meaning = '물 있다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'To be at home', 'Phrase: place + exist'),
  ('ES', 'Estar en casa', 'Frase: lugar + estar'),
  ('ZH', '在家', 'zài jiā - 在+家 (있다+집)'),
  ('JA', '家にいる', 'いえにいる(ie ni iru) - 家+に+いる (집+에+있다)'),
  ('KO', '집에 있다', '장소+에+있다 패턴. 위치를 나타냄. jibe itda')
) AS v(lang, expr, hint)
WHERE s.meaning = '집에 있다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Like fruit', 'Phrase: object + like'),
  ('ES', 'Gustar la fruta', 'Frase: objeto + gustar'),
  ('ZH', '喜欢水果', 'xǐ huān shuǐ guǒ - 喜欢+水果 (좋아하다+과일)'),
  ('JA', '果物が好き', 'くだものがすき(kudamono ga suki) - 果物+が+好き (과일+을+좋아하다)'),
  ('KO', '과일 좋아하다', '목적어+좋아하다 패턴. gwail joahada')
) AS v(lang, expr, hint)
WHERE s.meaning = '과일 좋아하다' AND l.level_number = 4 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Want food', 'Phrase: object + want'),
  ('ES', 'Querer comida', 'Frase: objeto + querer'),
  ('ZH', '想要饭', 'xiǎng yào fàn - 想要+饭 (원하다+밥)'),
  ('JA', 'ご飯が欲しい', 'ごはんがほしい(gohan ga hoshii) - ご飯+が+欲しい (밥+을+원하다)'),
  ('KO', '밥 원하다', '목적어+원하다 패턴. bap wonhada')
) AS v(lang, expr, hint)
WHERE s.meaning = '밥 원하다' AND l.level_number = 4 AND sk.display_order = 2;

-- Level 4, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big', 'Adjective meaning large in size'),
  ('ES', 'Grande', 'Adjetivo que significa grande en tamaño'),
  ('ZH', '大', 'dà - 形容词，大 (형용사, 큰)'),
  ('JA', '大きい', 'おおきい(ōkii) - 大きい、形容詞 (큰, 형용사)'),
  ('KO', '크다', '크기 형용사. 반대말: 작다. keuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '크다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Small', 'Adjective meaning little in size'),
  ('ES', 'Pequeño', 'Adjetivo que significa pequeño en tamaño'),
  ('ZH', '小', 'xiǎo - 形容词，小 (형용사, 작은)'),
  ('JA', '小さい', 'ちいさい(chiisai) - 小さい、形容詞 (작은, 형용사)'),
  ('KO', '작다', '크기 형용사. 반대말: 크다. jakda')
) AS v(lang, expr, hint)
WHERE s.meaning = '작다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Many / Much', 'Adjective meaning a large amount'),
  ('ES', 'Mucho', 'Adjetivo que significa gran cantidad'),
  ('ZH', '多', 'duō - 形容词，多 (형용사, 많은)'),
  ('JA', '多い', 'おおい(ōi) - 多い、形容詞 (많은, 형용사)'),
  ('KO', '많다', '양 형용사. 수나 양이 큼. 반대말: 적다. manta')
) AS v(lang, expr, hint)
WHERE s.meaning = '많다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Few / Little', 'Adjective meaning a small amount'),
  ('ES', 'Poco', 'Adjetivo que significa poca cantidad'),
  ('ZH', '少', 'shǎo - 形容词，少 (형용사, 적은)'),
  ('JA', '少ない', 'すくない(sukunai) - 少ない、形容詞 (적은, 형용사)'),
  ('KO', '적다', '양 형용사. 수나 양이 작음. 반대말: 많다. jeokda')
) AS v(lang, expr, hint)
WHERE s.meaning = '적다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Long', 'Adjective meaning great in length'),
  ('ES', 'Largo', 'Adjetivo que significa largo'),
  ('ZH', '长', 'cháng - 形容词，长 (형용사, 긴)'),
  ('JA', '長い', 'ながい(nagai) - 長い、形容詞 (긴, 형용사)'),
  ('KO', '길다', '길이 형용사. 반대말: 짧다. gilda')
) AS v(lang, expr, hint)
WHERE s.meaning = '길다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Short', 'Adjective meaning small in length'),
  ('ES', 'Corto', 'Adjetivo que significa corto'),
  ('ZH', '短', 'duǎn - 形容词，短 (형용사, 짧은)'),
  ('JA', '短い', 'みじかい(mijikai) - 短い、形容詞 (짧은, 형용사)'),
  ('KO', '짧다', '길이 형용사. 반대말: 길다. jjalda')
) AS v(lang, expr, hint)
WHERE s.meaning = '짧다' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big house', 'Phrase: adjective + noun'),
  ('ES', 'Casa grande', 'Frase: adjetivo + sustantivo'),
  ('ZH', '大房子', 'dà fáng zi - 大+房子 (큰+집)'),
  ('JA', '大きい家', 'おおきいいえ(ōkii ie) - 大きい+家 (큰+집)'),
  ('KO', '큰 집', '관형사형+명사 패턴. 크다→큰(관형형). keun jip')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 집' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Small room', 'Phrase: adjective + noun'),
  ('ES', 'Habitación pequeña', 'Frase: adjetivo + sustantivo'),
  ('ZH', '小房间', 'xiǎo fáng jiān - 小+房间 (작은+방)'),
  ('JA', '小さい部屋', 'ちいさいへや(chiisai heya) - 小さい+部屋 (작은+방)'),
  ('KO', '작은 방', '관형사형+명사 패턴. 작다→작은(관형형). jageun bang')
) AS v(lang, expr, hint)
WHERE s.meaning = '작은 방' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Long legs', 'Phrase: adjective + noun'),
  ('ES', 'Piernas largas', 'Frase: adjetivo + sustantivo'),
  ('ZH', '长腿', 'cháng tuǐ - 长+腿 (긴+다리)'),
  ('JA', '長い脚', 'ながいあし(nagai ashi) - 長い+脚 (긴+다리)'),
  ('KO', '긴 다리', '관형사형+명사 패턴. 길다→긴(관형형). gin dari')
) AS v(lang, expr, hint)
WHERE s.meaning = '긴 다리' AND l.level_number = 4 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Short hair', 'Phrase: adjective + noun'),
  ('ES', 'Pelo corto', 'Frase: adjetivo + sustantivo'),
  ('ZH', '短头发', 'duǎn tóu fa - 短+头发 (짧은+머리)'),
  ('JA', '短い髪', 'みじかいかみ(mijikai kami) - 短い+髪 (짧은+머리)'),
  ('KO', '짧은 머리', '관형사형+명사 패턴. 짧다→짧은(관형형). jjalbeun meori')
) AS v(lang, expr, hint)
WHERE s.meaning = '짧은 머리' AND l.level_number = 4 AND sk.display_order = 3;

-- Level 4, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hot', 'Adjective meaning high temperature'),
  ('ES', 'Caliente', 'Adjetivo que significa temperatura alta'),
  ('ZH', '热', 'rè - 形容词，热 (형용사, 뜨거운)'),
  ('JA', '熱い', 'あつい(atsui) - 熱い、形容詞 (뜨거운, 형용사)'),
  ('KO', '뜨겁다', '감각 형용사. 온도가 높음. 반대말: 차갑다. tteugeopda')
) AS v(lang, expr, hint)
WHERE s.meaning = '뜨겁다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cold', 'Adjective meaning low temperature'),
  ('ES', 'Frío', 'Adjetivo que significa temperatura baja'),
  ('ZH', '冷', 'lěng - 形容词，冷 (형용사, 차가운)'),
  ('JA', '冷たい', 'つめたい(tsumetai) - 冷たい、形容詞 (차가운, 형용사)'),
  ('KO', '차갑다', '감각 형용사. 온도가 낮음. 반대말: 뜨겁다. chagapda')
) AS v(lang, expr, hint)
WHERE s.meaning = '차갑다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Sweet', 'Adjective meaning sweet taste'),
  ('ES', 'Dulce', 'Adjetivo que significa sabor dulce'),
  ('ZH', '甜', 'tián - 形容词，甜 (형용사, 단)'),
  ('JA', '甘い', 'あまい(amai) - 甘い、形容詞 (단, 형용사)'),
  ('KO', '달다', '맛 형용사. 설탕 같은 맛. dalda')
) AS v(lang, expr, hint)
WHERE s.meaning = '달다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Salty', 'Adjective meaning salty taste'),
  ('ES', 'Salado', 'Adjetivo que significa sabor salado'),
  ('ZH', '咸', 'xián - 形容词，咸 (형용사, 짠)'),
  ('JA', 'しょっぱい', 'しょっぱい(shoppai) - しょっぱい (짠, 형용사)'),
  ('KO', '짜다', '맛 형용사. 소금 같은 맛. jjada')
) AS v(lang, expr, hint)
WHERE s.meaning = '짜다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bright', 'Adjective meaning full of light'),
  ('ES', 'Brillante', 'Adjetivo que significa lleno de luz'),
  ('ZH', '亮', 'liàng - 形容词，亮 (형용사, 밝은)'),
  ('JA', '明るい', 'あかるい(akarui) - 明るい、形容詞 (밝은, 형용사)'),
  ('KO', '밝다', '감각 형용사. 빛이 많음. 반대말: 어둡다. balkda')
) AS v(lang, expr, hint)
WHERE s.meaning = '밝다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Dark', 'Adjective meaning lacking light'),
  ('ES', 'Oscuro', 'Adjetivo que significa falta de luz'),
  ('ZH', '暗', 'àn - 形容词，暗 (형용사, 어두운)'),
  ('JA', '暗い', 'くらい(kurai) - 暗い、形容詞 (어두운, 형용사)'),
  ('KO', '어둡다', '감각 형용사. 빛이 없음. 반대말: 밝다. eodupda')
) AS v(lang, expr, hint)
WHERE s.meaning = '어둡다' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hot water', 'Phrase: adjective + noun'),
  ('ES', 'Agua caliente', 'Frase: adjetivo + sustantivo'),
  ('ZH', '热水', 'rè shuǐ - 热+水 (뜨거운+물)'),
  ('JA', '熱いお湯', 'あついおゆ(atsui oyu) - 熱い+お湯 (뜨거운+물)'),
  ('KO', '뜨거운 물', '관형사형+명사. 뜨겁다→뜨거운(관형형). tteugeoun mul')
) AS v(lang, expr, hint)
WHERE s.meaning = '뜨거운 물' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cold milk', 'Phrase: adjective + noun'),
  ('ES', 'Leche fría', 'Frase: adjetivo + sustantivo'),
  ('ZH', '冷牛奶', 'lěng niú nǎi - 冷+牛奶 (차가운+우유)'),
  ('JA', '冷たい牛乳', 'つめたいぎゅうにゅう(tsumetai gyūnyū) - 冷たい+牛乳 (차가운+우유)'),
  ('KO', '차가운 우유', '관형사형+명사. 차갑다→차가운(관형형). chagaun uyu')
) AS v(lang, expr, hint)
WHERE s.meaning = '차가운 우유' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bright room', 'Phrase: adjective + noun'),
  ('ES', 'Habitación brillante', 'Frase: adjetivo + sustantivo'),
  ('ZH', '明亮的房间', 'míng liàng de fáng jiān - 明亮的+房间 (밝은+방)'),
  ('JA', '明るい部屋', 'あかるいへや(akarui heya) - 明るい+部屋 (밝은+방)'),
  ('KO', '밝은 방', '관형사형+명사. 밝다→밝은(관형형). balgeun bang')
) AS v(lang, expr, hint)
WHERE s.meaning = '밝은 방' AND l.level_number = 4 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Dark night', 'Phrase: adjective + noun'),
  ('ES', 'Noche oscura', 'Frase: adjetivo + sustantivo'),
  ('ZH', '黑暗的夜晚', 'hēi àn de yè wǎn - 黑暗的+夜晚 (어두운+밤)'),
  ('JA', '暗い夜', 'くらいよる(kurai yoru) - 暗い+夜 (어두운+밤)'),
  ('KO', '어두운 밤', '관형사형+명사. 어둡다→어두운(관형형). eoduun bam')
) AS v(lang, expr, hint)
WHERE s.meaning = '어두운 밤' AND l.level_number = 4 AND sk.display_order = 4;

-- Level 5, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Monday', 'First day of the work week'),
  ('ES', 'Lunes', 'Primer día de la semana laboral'),
  ('ZH', '星期一', 'xīng qī yī - 星期一 (월요일)'),
  ('JA', '月曜日', 'げつようび(getsuyōbi) - 月曜日 (월요일)'),
  ('KO', '월요일', '한 주의 첫 번째 날. woryoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '월요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tuesday', 'Second day of the work week'),
  ('ES', 'Martes', 'Segundo día de la semana laboral'),
  ('ZH', '星期二', 'xīng qī èr - 星期二 (화요일)'),
  ('JA', '火曜日', 'かようび(kayōbi) - 火曜日 (화요일)'),
  ('KO', '화요일', '한 주의 두 번째 날. hwayoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '화요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Wednesday', 'Third day of the work week'),
  ('ES', 'Miércoles', 'Tercer día de la semana laboral'),
  ('ZH', '星期三', 'xīng qī sān - 星期三 (수요일)'),
  ('JA', '水曜日', 'すいようび(suiyōbi) - 水曜日 (수요일)'),
  ('KO', '수요일', '한 주의 세 번째 날. suyoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '수요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Thursday', 'Fourth day of the work week'),
  ('ES', 'Jueves', 'Cuarto día de la semana laboral'),
  ('ZH', '星期四', 'xīng qī sì - 星期四 (목요일)'),
  ('JA', '木曜日', 'もくようび(mokuyōbi) - 木曜日 (목요일)'),
  ('KO', '목요일', '한 주의 네 번째 날. mogyoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '목요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Friday', 'Fifth day of the work week'),
  ('ES', 'Viernes', 'Quinto día de la semana laboral'),
  ('ZH', '星期五', 'xīng qī wǔ - 星期五 (금요일)'),
  ('JA', '金曜日', 'きんようび(kinyōbi) - 金曜日 (금요일)'),
  ('KO', '금요일', '한 주의 다섯 번째 날. geumyoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '금요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Saturday', 'First day of the weekend'),
  ('ES', 'Sábado', 'Primer día del fin de semana'),
  ('ZH', '星期六', 'xīng qī liù - 星期六 (토요일)'),
  ('JA', '土曜日', 'どようび(doyōbi) - 土曜日 (토요일)'),
  ('KO', '토요일', '주말 첫 번째 날. toyoil')
) AS v(lang, expr, hint)
WHERE s.meaning = '토요일' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Good morning', 'Morning greeting'),
  ('ES', 'Buenos días', 'Saludo matutino'),
  ('ZH', '早上好', 'zǎo shang hǎo - 早上好 (좋은 아침)'),
  ('JA', 'おはようございます', 'おはようございます(ohayō gozaimasu) - 朝の挨拶 (아침 인사)'),
  ('KO', '좋은 아침', '아침 인사 표현. 관형사형+명사. joeun achim')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋은 아침' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This weekend', 'Phrase: this + weekend'),
  ('ES', 'Este fin de semana', 'Frase: este + fin de semana'),
  ('ZH', '这个周末', 'zhè ge zhōu mò - 这个+周末 (이번+주말)'),
  ('JA', '今週末', 'こんしゅうまつ(konshūmatsu) - 今週末 (이번 주말)'),
  ('KO', '이번 주말', '시간 표현. ''이번''은 현재의 차례. ibeon jumal')
) AS v(lang, expr, hint)
WHERE s.meaning = '이번 주말' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'School on Monday', 'Phrase: time + place'),
  ('ES', 'Escuela el lunes', 'Frase: tiempo + lugar'),
  ('ZH', '星期一去学校', 'xīng qī yī qù xué xiào - 星期一+学校 (월요일+학교)'),
  ('JA', '月曜日に学校', 'げつようびにがっこう(getsuyōbi ni gakkō) - 月曜日+に+学校'),
  ('KO', '월요일에 학교', '시간+에+장소 패턴. ''에''는 시간 조사. woryoire hakgyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '월요일에 학교' AND l.level_number = 5 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Store on Friday', 'Phrase: time + place'),
  ('ES', 'Tienda el viernes', 'Frase: tiempo + lugar'),
  ('ZH', '星期五去商店', 'xīng qī wǔ qù shāng diàn - 星期五+商店 (금요일+가게)'),
  ('JA', '金曜日にお店', 'きんようびにおみせ(kinyōbi ni omise) - 金曜日+に+店'),
  ('KO', '금요일에 가게', '시간+에+장소 패턴. geumyoire gage')
) AS v(lang, expr, hint)
WHERE s.meaning = '금요일에 가게' AND l.level_number = 5 AND sk.display_order = 1;

-- Level 5, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Morning', 'Early part of the day'),
  ('ES', 'Mañana', 'Parte temprana del día'),
  ('ZH', '早上', 'zǎo shang - 早上 (아침)'),
  ('JA', '朝', 'あさ(asa) - 朝 (아침)'),
  ('KO', '아침', '하루의 이른 시간. 아침식사를 뜻하기도 함. achim')
) AS v(lang, expr, hint)
WHERE s.meaning = '아침' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Afternoon', 'Part of the day after noon'),
  ('ES', 'Tarde', 'Parte del día después del mediodía'),
  ('ZH', '下午', 'xià wǔ - 下午 (오후)'),
  ('JA', '午後', 'ごご(gogo) - 午後 (오후)'),
  ('KO', '오후', '낮 12시 이후의 시간. ohu')
) AS v(lang, expr, hint)
WHERE s.meaning = '오후' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Evening', 'Late part of the day'),
  ('ES', 'Noche', 'Parte tardía del día'),
  ('ZH', '晚上', 'wǎn shang - 晚上 (저녁)'),
  ('JA', '夕方', 'ゆうがた(yūgata) - 夕方 (저녁)'),
  ('KO', '저녁', '해가 지는 시간대. 저녁식사를 뜻하기도 함. jeonyeok')
) AS v(lang, expr, hint)
WHERE s.meaning = '저녁' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Night', 'Dark part of the day'),
  ('ES', 'Noche', 'Parte oscura del día'),
  ('ZH', '夜晚', 'yè wǎn - 夜晚 (밤)'),
  ('JA', '夜', 'よる(yoru) - 夜 (밤)'),
  ('KO', '밤', '어두운 시간대. ''밤(chestnut)''과 동음. bam')
) AS v(lang, expr, hint)
WHERE s.meaning = '밤' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Today', 'This present day'),
  ('ES', 'Hoy', 'Este día presente'),
  ('ZH', '今天', 'jīn tiān - 今天 (오늘)'),
  ('JA', '今日', 'きょう(kyō) - 今日 (오늘)'),
  ('KO', '오늘', '지금 이 날. oneul')
) AS v(lang, expr, hint)
WHERE s.meaning = '오늘' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tomorrow', 'The day after today'),
  ('ES', 'Mañana', 'El día después de hoy'),
  ('ZH', '明天', 'míng tiān - 明天 (내일)'),
  ('JA', '明日', 'あした(ashita) - 明日 (내일)'),
  ('KO', '내일', '오늘의 다음 날. naeil')
) AS v(lang, expr, hint)
WHERE s.meaning = '내일' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This morning', 'Phrase: today + morning'),
  ('ES', 'Esta mañana', 'Frase: hoy + mañana'),
  ('ZH', '今天早上', 'jīn tiān zǎo shang - 今天+早上 (오늘+아침)'),
  ('JA', '今朝', 'けさ(kesa) - 今朝 (오늘 아침)'),
  ('KO', '오늘 아침', '시간 표현 조합. 오늘+아침. oneul achim')
) AS v(lang, expr, hint)
WHERE s.meaning = '오늘 아침' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tomorrow evening', 'Phrase: tomorrow + evening'),
  ('ES', 'Mañana por la noche', 'Frase: mañana + noche'),
  ('ZH', '明天晚上', 'míng tiān wǎn shang - 明天+晚上 (내일+저녁)'),
  ('JA', '明日の夕方', 'あしたのゆうがた(ashita no yūgata) - 明日+の+夕方 (내일+의+저녁)'),
  ('KO', '내일 저녁', '시간 표현 조합. 내일+저녁. naeil jeonyeok')
) AS v(lang, expr, hint)
WHERE s.meaning = '내일 저녁' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Last night', 'Phrase: yesterday + night'),
  ('ES', 'Anoche', 'Frase: ayer + noche'),
  ('ZH', '昨天晚上', 'zuó tiān wǎn shang - 昨天+晚上 (어제+밤)'),
  ('JA', '昨夜', 'ゆうべ(yūbe) - 昨夜 (어젯밤)'),
  ('KO', '어제 밤', '시간 표현 조합. 어제+밤. eoje bam')
) AS v(lang, expr, hint)
WHERE s.meaning = '어제 밤' AND l.level_number = 5 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Right here, right now', 'Phrase: now + here'),
  ('ES', 'Aquí y ahora', 'Frase: aquí + ahora'),
  ('ZH', '现在这里', 'xiàn zài zhè lǐ - 现在+这里 (지금+여기)'),
  ('JA', '今ここ', 'いまここ(ima koko) - 今+ここ (지금+여기)'),
  ('KO', '지금 여기', '시간+장소 조합. ''지금''은 현재 시점. jigeum yeogi')
) AS v(lang, expr, hint)
WHERE s.meaning = '지금 여기' AND l.level_number = 5 AND sk.display_order = 2;

-- Level 5, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Clear / Sunny', 'Adjective meaning clear sky'),
  ('ES', 'Despejado', 'Adjetivo que significa cielo claro'),
  ('ZH', '晴朗', 'qíng lǎng - 形容词，晴朗 (형용사, 맑은)'),
  ('JA', '晴れ', 'はれ(hare) - 晴れ (맑음)'),
  ('KO', '맑다', '날씨 형용사. 하늘이 깨끗함. makda')
) AS v(lang, expr, hint)
WHERE s.meaning = '맑다' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cloudy', 'Adjective meaning covered with clouds'),
  ('ES', 'Nublado', 'Adjetivo que significa cubierto de nubes'),
  ('ZH', '阴天', 'yīn tiān - 阴天，多云 (흐림, 구름 많음)'),
  ('JA', '曇り', 'くもり(kumori) - 曇り (흐림)'),
  ('KO', '흐리다', '날씨 형용사. 구름이 많음. 반대말: 맑다. heurida')
) AS v(lang, expr, hint)
WHERE s.meaning = '흐리다' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Rain', 'Water falling from clouds'),
  ('ES', 'Lluvia', 'Agua que cae de las nubes'),
  ('ZH', '雨', 'yǔ - 雨 (비)'),
  ('JA', '雨', 'あめ(ame) - 雨 (비)'),
  ('KO', '비', '구름에서 내리는 물. bi')
) AS v(lang, expr, hint)
WHERE s.meaning = '비' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Snow', 'White ice crystals falling from sky'),
  ('ES', 'Nieve', 'Cristales de hielo que caen del cielo'),
  ('ZH', '雪', 'xuě - 雪 (눈)'),
  ('JA', '雪', 'ゆき(yuki) - 雪 (눈)'),
  ('KO', '눈', '하늘에서 내리는 흰 결정. 눈(eye)과 동음. nun')
) AS v(lang, expr, hint)
WHERE s.meaning = '눈' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Wind', 'Moving air'),
  ('ES', 'Viento', 'Aire en movimiento'),
  ('ZH', '风', 'fēng - 风 (바람)'),
  ('JA', '風', 'かぜ(kaze) - 風 (바람)'),
  ('KO', '바람', '움직이는 공기. baram')
) AS v(lang, expr, hint)
WHERE s.meaning = '바람' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Weather', 'Atmospheric conditions'),
  ('ES', 'Clima', 'Condiciones atmosféricas'),
  ('ZH', '天气', 'tiān qì - 天气 (날씨)'),
  ('JA', '天気', 'てんき(tenki) - 天気 (날씨)'),
  ('KO', '날씨', '대기의 상태. 기온, 비, 눈 등을 포함. nalssi')
) AS v(lang, expr, hint)
WHERE s.meaning = '날씨' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Nice weather', 'Phrase: adjective + noun'),
  ('ES', 'Buen clima', 'Frase: adjetivo + sustantivo'),
  ('ZH', '好天气', 'hǎo tiān qì - 好+天气 (좋은+날씨)'),
  ('JA', 'いい天気', 'いいてんき(ii tenki) - いい+天気 (좋은+날씨)'),
  ('KO', '좋은 날씨', '관형사형+명사. 좋다→좋은(관형형). joeun nalssi')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋은 날씨' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bad weather', 'Phrase: adjective + noun'),
  ('ES', 'Mal clima', 'Frase: adjetivo + sustantivo'),
  ('ZH', '坏天气', 'huài tiān qì - 坏+天气 (나쁜+날씨)'),
  ('JA', '悪い天気', 'わるいてんき(warui tenki) - 悪い+天気 (나쁜+날씨)'),
  ('KO', '나쁜 날씨', '관형사형+명사. 나쁘다→나쁜(관형형). nappeun nalssi')
) AS v(lang, expr, hint)
WHERE s.meaning = '나쁜 날씨' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Rain today', 'Phrase: time + weather'),
  ('ES', 'Lluvia hoy', 'Frase: tiempo + clima'),
  ('ZH', '今天下雨', 'jīn tiān xià yǔ - 今天+下雨 (오늘+비)'),
  ('JA', '今日は雨', 'きょうはあめ(kyō wa ame) - 今日+は+雨 (오늘+은+비)'),
  ('KO', '오늘 비', '시간+날씨 조합. oneul bi')
) AS v(lang, expr, hint)
WHERE s.meaning = '오늘 비' AND l.level_number = 5 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cold wind', 'Phrase: adjective + noun'),
  ('ES', 'Viento frío', 'Frase: adjetivo + sustantivo'),
  ('ZH', '冷风', 'lěng fēng - 冷+风 (찬+바람)'),
  ('JA', '冷たい風', 'つめたいかぜ(tsumetai kaze) - 冷たい+風 (찬+바람)'),
  ('KO', '찬 바람', '관형사형+명사. 차다→찬(관형형). chan baram')
) AS v(lang, expr, hint)
WHERE s.meaning = '찬 바람' AND l.level_number = 5 AND sk.display_order = 3;

-- Level 5, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Spring', 'Season after winter'),
  ('ES', 'Primavera', 'Estación después del invierno'),
  ('ZH', '春天', 'chūn tiān - 春天 (봄)'),
  ('JA', '春', 'はる(haru) - 春 (봄)'),
  ('KO', '봄', '겨울 다음 계절. 따뜻함. bom')
) AS v(lang, expr, hint)
WHERE s.meaning = '봄' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Summer', 'Hottest season of the year'),
  ('ES', 'Verano', 'Estación más calurosa del año'),
  ('ZH', '夏天', 'xià tiān - 夏天 (여름)'),
  ('JA', '夏', 'なつ(natsu) - 夏 (여름)'),
  ('KO', '여름', '가장 더운 계절. yeoreum')
) AS v(lang, expr, hint)
WHERE s.meaning = '여름' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Autumn / Fall', 'Season after summer'),
  ('ES', 'Otoño', 'Estación después del verano'),
  ('ZH', '秋天', 'qiū tiān - 秋天 (가을)'),
  ('JA', '秋', 'あき(aki) - 秋 (가을)'),
  ('KO', '가을', '여름 다음 계절. 시원함. gaeul')
) AS v(lang, expr, hint)
WHERE s.meaning = '가을' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Winter', 'Coldest season of the year'),
  ('ES', 'Invierno', 'Estación más fría del año'),
  ('ZH', '冬天', 'dōng tiān - 冬天 (겨울)'),
  ('JA', '冬', 'ふゆ(fuyu) - 冬 (겨울)'),
  ('KO', '겨울', '가장 추운 계절. gyeoul')
) AS v(lang, expr, hint)
WHERE s.meaning = '겨울' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Season', 'One of the four periods of the year'),
  ('ES', 'Estación', 'Uno de los cuatro períodos del año'),
  ('ZH', '季节', 'jì jié - 季节 (계절)'),
  ('JA', '季節', 'きせつ(kisetsu) - 季節 (계절)'),
  ('KO', '계절', '봄, 여름, 가을, 겨울의 네 시기. gyejeol')
) AS v(lang, expr, hint)
WHERE s.meaning = '계절' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'January', 'First month of the year'),
  ('ES', 'Enero', 'Primer mes del año'),
  ('ZH', '一月', 'yī yuè - 一月 (1월)'),
  ('JA', '一月', 'いちがつ(ichigatsu) - 一月 (1월)'),
  ('KO', '1월', '한 해의 첫 번째 달. irwol')
) AS v(lang, expr, hint)
WHERE s.meaning = '1월' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Warm spring', 'Phrase: adjective + noun'),
  ('ES', 'Primavera cálida', 'Frase: adjetivo + sustantivo'),
  ('ZH', '温暖的春天', 'wēn nuǎn de chūn tiān - 温暖的+春天 (따뜻한+봄)'),
  ('JA', '暖かい春', 'あたたかいはる(atatakai haru) - 暖かい+春 (따뜻한+봄)'),
  ('KO', '따뜻한 봄', '관형사형+명사. 따뜻하다→따뜻한. ttatteutan bom')
) AS v(lang, expr, hint)
WHERE s.meaning = '따뜻한 봄' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Hot summer', 'Phrase: adjective + noun'),
  ('ES', 'Verano caluroso', 'Frase: adjetivo + sustantivo'),
  ('ZH', '炎热的夏天', 'yán rè de xià tiān - 炎热的+夏天 (더운+여름)'),
  ('JA', '暑い夏', 'あついなつ(atsui natsu) - 暑い+夏 (더운+여름)'),
  ('KO', '더운 여름', '관형사형+명사. 덥다→더운. deoun yeoreum')
) AS v(lang, expr, hint)
WHERE s.meaning = '더운 여름' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cold winter', 'Phrase: adjective + noun'),
  ('ES', 'Invierno frío', 'Frase: adjetivo + sustantivo'),
  ('ZH', '寒冷的冬天', 'hán lěng de dōng tiān - 寒冷的+冬天 (추운+겨울)'),
  ('JA', '寒い冬', 'さむいふゆ(samui fuyu) - 寒い+冬 (추운+겨울)'),
  ('KO', '추운 겨울', '관형사형+명사. 춥다→추운. chuun gyeoul')
) AS v(lang, expr, hint)
WHERE s.meaning = '추운 겨울' AND l.level_number = 5 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cool autumn', 'Phrase: adjective + noun'),
  ('ES', 'Otoño fresco', 'Frase: adjetivo + sustantivo'),
  ('ZH', '凉爽的秋天', 'liáng shuǎng de qiū tiān - 凉爽的+秋天 (시원한+가을)'),
  ('JA', '涼しい秋', 'すずしいあき(suzushii aki) - 涼しい+秋 (시원한+가을)'),
  ('KO', '시원한 가을', '관형사형+명사. 시원하다→시원한. siwonhan gaeul')
) AS v(lang, expr, hint)
WHERE s.meaning = '시원한 가을' AND l.level_number = 5 AND sk.display_order = 4;

-- Level 6, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Shirt', 'Upper body clothing'),
  ('ES', 'Camisa', 'Ropa para la parte superior del cuerpo'),
  ('ZH', '衬衫', 'chèn shān - 衬衫 (셔츠)'),
  ('JA', 'シャツ', 'シャツ(shatsu) - シャツ (셔츠)'),
  ('KO', '셔츠', '상의 의류. 영어 shirt에서 온 외래어. syeocheu')
) AS v(lang, expr, hint)
WHERE s.meaning = '셔츠' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Pants', 'Lower body clothing'),
  ('ES', 'Pantalones', 'Ropa para la parte inferior del cuerpo'),
  ('ZH', '裤子', 'kù zi - 裤子 (바지)'),
  ('JA', 'ズボン', 'ズボン(zubon) - ズボン (바지)'),
  ('KO', '바지', '하의 의류. 다리를 감싸는 옷. baji')
) AS v(lang, expr, hint)
WHERE s.meaning = '바지' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Shoes', 'Footwear'),
  ('ES', 'Zapatos', 'Calzado'),
  ('ZH', '鞋子', 'xié zi - 鞋子 (신발)'),
  ('JA', '靴', 'くつ(kutsu) - 靴 (신발)'),
  ('KO', '신발', '발에 신는 것. sinbal')
) AS v(lang, expr, hint)
WHERE s.meaning = '신발' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'White shirt', 'Phrase: color + clothing'),
  ('ES', 'Camisa blanca', 'Frase: color + ropa'),
  ('ZH', '白衬衫', 'bái chèn shān - 白+衬衫 (하얀+셔츠)'),
  ('JA', '白いシャツ', 'しろいシャツ(shiroi shatsu) - 白い+シャツ (하얀+셔츠)'),
  ('KO', '하얀 셔츠', '색상+의류 패턴. 하얗다→하얀(관형형). hayan syeocheu')
) AS v(lang, expr, hint)
WHERE s.meaning = '하얀 셔츠' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Black pants', 'Phrase: color + clothing'),
  ('ES', 'Pantalones negros', 'Frase: color + ropa'),
  ('ZH', '黑裤子', 'hēi kù zi - 黑+裤子 (검은+바지)'),
  ('JA', '黒いズボン', 'くろいズボン(kuroi zubon) - 黒い+ズボン (검은+바지)'),
  ('KO', '검은 바지', '색상+의류 패턴. 검다→검은(관형형). geomeun baji')
) AS v(lang, expr, hint)
WHERE s.meaning = '검은 바지' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big shoes', 'Phrase: size + clothing'),
  ('ES', 'Zapatos grandes', 'Frase: tamaño + calzado'),
  ('ZH', '大鞋子', 'dà xié zi - 大+鞋子 (큰+신발)'),
  ('JA', '大きい靴', 'おおきいくつ(ōkii kutsu) - 大きい+靴 (큰+신발)'),
  ('KO', '큰 신발', '크기+의류 패턴. keun sinbal')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 신발' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Small hat', 'Phrase: size + clothing'),
  ('ES', 'Sombrero pequeño', 'Frase: tamaño + accesorio'),
  ('ZH', '小帽子', 'xiǎo mào zi - 小+帽子 (작은+모자)'),
  ('JA', '小さい帽子', 'ちいさいぼうし(chiisai bōshi) - 小さい+帽子 (작은+모자)'),
  ('KO', '작은 모자', '크기+의류 패턴. jageun moja')
) AS v(lang, expr, hint)
WHERE s.meaning = '작은 모자' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is a skirt', 'Subject + be + noun sentence'),
  ('ES', 'Esto es una falda', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '这是裙子', 'zhè shì qún zi - 这+是+裙子 (이것+은+치마)'),
  ('JA', 'これはスカートです', 'これはスカートです(kore wa sukāto desu) - これ+は+スカート+です'),
  ('KO', '이것은 치마입니다', '이것+은+명사+입니다 패턴. 기본 서술문. igoseun chimaimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 치마입니다' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are shoes', 'Existence sentence'),
  ('ES', 'Hay zapatos', 'Oración de existencia'),
  ('ZH', '有鞋子', 'yǒu xié zi - 有+鞋子 (있다+신발)'),
  ('JA', '靴があります', 'くつがあります(kutsu ga arimasu) - 靴+が+あります'),
  ('KO', '신발이 있습니다', '명사+이/가+있습니다 패턴. 존재 표현. sinbari itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '신발이 있습니다' AND l.level_number = 6 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The shirt is big', 'Subject + adjective sentence'),
  ('ES', 'La camisa es grande', 'Oración: sujeto + adjetivo'),
  ('ZH', '衬衫很大', 'chèn shān hěn dà - 衬衫+很+大 (셔츠+가+크다)'),
  ('JA', 'シャツが大きいです', 'シャツがおおきいです(shatsu ga ōkii desu) - シャツ+が+大きい+です'),
  ('KO', '셔츠가 큽니다', '명사+가+형용사 패턴. 크다→큽니다(격식). syeocheuga keumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '셔츠가 큽니다' AND l.level_number = 6 AND sk.display_order = 1;

-- Level 6, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Phone', 'Device for making calls'),
  ('ES', 'Teléfono', 'Dispositivo para hacer llamadas'),
  ('ZH', '电话', 'diàn huà - 电话 (전화기)'),
  ('JA', '電話', 'でんわ(denwa) - 電話 (전화기)'),
  ('KO', '전화기', '통화하는 기기. 핸드폰을 뜻하기도 함. jeonhwagi')
) AS v(lang, expr, hint)
WHERE s.meaning = '전화기' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Book', 'Written or printed pages bound together'),
  ('ES', 'Libro', 'Páginas escritas o impresas encuadernadas'),
  ('ZH', '书', 'shū - 书 (책)'),
  ('JA', '本', 'ほん(hon) - 本 (책)'),
  ('KO', '책', '글이 적힌 인쇄물. chaek')
) AS v(lang, expr, hint)
WHERE s.meaning = '책' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bag', 'Container for carrying things'),
  ('ES', 'Bolsa', 'Contenedor para llevar cosas'),
  ('ZH', '包', 'bāo - 包，书包 (가방)'),
  ('JA', 'カバン', 'カバン(kaban) - カバン (가방)'),
  ('KO', '가방', '물건을 넣어 들고 다니는 것. gabang')
) AS v(lang, expr, hint)
WHERE s.meaning = '가방' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'My bag', 'Phrase: possessive + noun'),
  ('ES', 'Mi bolsa', 'Frase: posesivo + sustantivo'),
  ('ZH', '我的包', 'wǒ de bāo - 我的+包 (나의+가방)'),
  ('JA', '私のカバン', 'わたしのカバン(watashi no kaban) - 私+の+カバン (나+의+가방)'),
  ('KO', '내 가방', '소유격+명사 패턴. ''나의''의 줄임말이 ''내''. nae gabang')
) AS v(lang, expr, hint)
WHERE s.meaning = '내 가방' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Please give me an umbrella', 'Request phrase'),
  ('ES', 'Deme un paraguas, por favor', 'Frase de solicitud'),
  ('ZH', '请给我雨伞', 'qǐng gěi wǒ yǔ sǎn - 请+给+我+雨伞 (주세요+우산)'),
  ('JA', '傘をください', 'かさをください(kasa o kudasai) - 傘+を+ください (우산+을+주세요)'),
  ('KO', '우산 주세요', '명사+주세요 패턴. 정중한 요청 표현. usan juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '우산 주세요' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big bag', 'Phrase: size + noun'),
  ('ES', 'Bolsa grande', 'Frase: tamaño + sustantivo'),
  ('ZH', '大包', 'dà bāo - 大+包 (큰+가방)'),
  ('JA', '大きいカバン', 'おおきいカバン(ōkii kaban) - 大きい+カバン (큰+가방)'),
  ('KO', '큰 가방', '크기+명사 패턴. keun gabang')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 가방' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This way, please', 'Polite direction phrase'),
  ('ES', 'Por aquí, por favor', 'Frase de dirección cortés'),
  ('ZH', '请往这边走', 'qǐng wǎng zhè biān zǒu - 请+这边+走 (이쪽으로 오세요)'),
  ('JA', 'こちらへどうぞ', 'こちらへどうぞ(kochira e dōzo) - こちら+へ+どうぞ (이쪽으로 어서)'),
  ('KO', '이쪽으로요', '방향+으로+요 패턴. 정중한 안내 표현. ijjogeurooyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '이쪽으로요' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is a book', 'Subject + be + noun sentence'),
  ('ES', 'Esto es un libro', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '这是书', 'zhè shì shū - 这+是+书 (이것+은+책)'),
  ('JA', 'これは本です', 'これはほんです(kore wa hon desu) - これ+は+本+です'),
  ('KO', '이것은 책입니다', '이것+은+명사+입니다 패턴. igoseun chaegimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 책입니다' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is no key', 'Non-existence sentence'),
  ('ES', 'No hay llave', 'Oración de no existencia'),
  ('ZH', '没有钥匙', 'méi yǒu yào shi - 没有+钥匙 (없다+열쇠)'),
  ('JA', '鍵がありません', 'かぎがありません(kagi ga arimasen) - 鍵+が+ありません'),
  ('KO', '열쇠가 없습니다', '명사+가+없습니다 패턴. 부재 표현. yeolsoega eopsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '열쇠가 없습니다' AND l.level_number = 6 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a clock', 'Existence sentence'),
  ('ES', 'Hay un reloj', 'Oración de existencia'),
  ('ZH', '有钟表', 'yǒu zhōng biǎo - 有+钟表 (있다+시계)'),
  ('JA', '時計があります', 'とけいがあります(tokei ga arimasu) - 時計+が+あります'),
  ('KO', '시계가 있습니다', '명사+가+있습니다 패턴. 존재 표현. sigyega itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '시계가 있습니다' AND l.level_number = 6 AND sk.display_order = 2;

-- Level 6, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Car', 'Motor vehicle for transportation'),
  ('ES', 'Coche', 'Vehículo motorizado para transporte'),
  ('ZH', '汽车', 'qì chē - 汽车 (자동차)'),
  ('JA', '車', 'くるま(kuruma) - 車 (자동차)'),
  ('KO', '자동차', '엔진으로 움직이는 탈것. jadongcha')
) AS v(lang, expr, hint)
WHERE s.meaning = '자동차' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bus', 'Large public transport vehicle'),
  ('ES', 'Autobús', 'Vehículo grande de transporte público'),
  ('ZH', '公共汽车', 'gōng gòng qì chē - 公共汽车 (버스)'),
  ('JA', 'バス', 'バス(basu) - バス (버스)'),
  ('KO', '버스', '대중교통 수단. 영어 bus에서 온 외래어. beoseu')
) AS v(lang, expr, hint)
WHERE s.meaning = '버스' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bicycle', 'Two-wheeled vehicle'),
  ('ES', 'Bicicleta', 'Vehículo de dos ruedas'),
  ('ZH', '自行车', 'zì xíng chē - 自行车 (자전거)'),
  ('JA', '自転車', 'じてんしゃ(jitensha) - 自転車 (자전거)'),
  ('KO', '자전거', '두 바퀴 달린 탈것. jajeongeo')
) AS v(lang, expr, hint)
WHERE s.meaning = '자전거' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big bus', 'Phrase: size + transport'),
  ('ES', 'Autobús grande', 'Frase: tamaño + transporte'),
  ('ZH', '大巴士', 'dà bā shì - 大+巴士 (큰+버스)'),
  ('JA', '大きいバス', 'おおきいバス(ōkii basu) - 大きい+バス (큰+버스)'),
  ('KO', '큰 버스', '크기+교통수단 패턴. keun beoseu')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 버스' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Small car', 'Phrase: size + transport'),
  ('ES', 'Coche pequeño', 'Frase: tamaño + transporte'),
  ('ZH', '小汽车', 'xiǎo qì chē - 小+汽车 (작은+자동차)'),
  ('JA', '小さい車', 'ちいさいくるま(chiisai kuruma) - 小さい+車 (작은+자동차)'),
  ('KO', '작은 자동차', '크기+교통수단 패턴. jageun jadongcha')
) AS v(lang, expr, hint)
WHERE s.meaning = '작은 자동차' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Fast train', 'Phrase: speed + transport'),
  ('ES', 'Tren rápido', 'Frase: velocidad + transporte'),
  ('ZH', '快速火车', 'kuài sù huǒ chē - 快速+火车 (빠른+기차)'),
  ('JA', '速い電車', 'はやいでんしゃ(hayai densha) - 速い+電車 (빠른+기차)'),
  ('KO', '빠른 기차', '속도+교통수단 패턴. 빠르다→빠른(관형형). ppareun gicha')
) AS v(lang, expr, hint)
WHERE s.meaning = '빠른 기차' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Taxi, please', 'Request phrase'),
  ('ES', 'Un taxi, por favor', 'Frase de solicitud'),
  ('ZH', '请叫出租车', 'qǐng jiào chū zū chē - 请+叫+出租车 (택시 불러주세요)'),
  ('JA', 'タクシーをお願いします', 'タクシーをおねがいします(takushī o onegai shimasu)'),
  ('KO', '택시 주세요', '명사+주세요 패턴. 정중한 요청. taeksi juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '택시 주세요' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a bus', 'Existence sentence'),
  ('ES', 'Hay un autobús', 'Oración de existencia'),
  ('ZH', '有公共汽车', 'yǒu gōng gòng qì chē - 有+公共汽车 (있다+버스)'),
  ('JA', 'バスがあります', 'バスがあります(basu ga arimasu) - バス+が+あります'),
  ('KO', '버스가 있습니다', '명사+가+있습니다 패턴. beoseuga itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '버스가 있습니다' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bicycles are nice', 'Subject + adjective sentence'),
  ('ES', 'Las bicicletas son buenas', 'Oración: sujeto + adjetivo'),
  ('ZH', '自行车很好', 'zì xíng chē hěn hǎo - 自行车+很+好 (자전거+좋다)'),
  ('JA', '自転車がいいです', 'じてんしゃがいいです(jitensha ga ii desu)'),
  ('KO', '자전거가 좋습니다', '명사+가+형용사 패턴. jajeonggeoga jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '자전거가 좋습니다' AND l.level_number = 6 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That is an airplane', 'Subject + be + noun sentence'),
  ('ES', 'Eso es un avión', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '那是飞机', 'nà shì fēi jī - 那+是+飞机 (저것+은+비행기)'),
  ('JA', 'あれは飛行機です', 'あれはひこうきです(are wa hikōki desu) - あれ+は+飛行機+です'),
  ('KO', '저것은 비행기입니다', '저것+은+명사+입니다 패턴. jeogoseun bihaenggiimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '저것은 비행기입니다' AND l.level_number = 6 AND sk.display_order = 3;

-- Level 6, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Twenty', 'Cardinal number 20'),
  ('ES', 'Veinte', 'Número cardinal 20'),
  ('ZH', '二十', 'èr shí - 数字20 (숫자 20)'),
  ('JA', '二十', 'にじゅう(nijū) - 数字20 (숫자 20)'),
  ('KO', '스물', '고유어 숫자 20. seumul')
) AS v(lang, expr, hint)
WHERE s.meaning = '스물' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Thirty', 'Cardinal number 30'),
  ('ES', 'Treinta', 'Número cardinal 30'),
  ('ZH', '三十', 'sān shí - 数字30 (숫자 30)'),
  ('JA', '三十', 'さんじゅう(sanjū) - 数字30 (숫자 30)'),
  ('KO', '서른', '고유어 숫자 30. seoreun')
) AS v(lang, expr, hint)
WHERE s.meaning = '서른' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'One hundred', 'Cardinal number 100'),
  ('ES', 'Cien', 'Número cardinal 100'),
  ('ZH', '一百', 'yì bǎi - 数字100 (숫자 100)'),
  ('JA', '百', 'ひゃく(hyaku) - 数字100 (숫자 100)'),
  ('KO', '백', '한자어 숫자 100. baek')
) AS v(lang, expr, hint)
WHERE s.meaning = '백' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Five apples', 'Phrase: noun + number'),
  ('ES', 'Cinco manzanas', 'Frase: número + sustantivo'),
  ('ZH', '五个苹果', 'wǔ ge píng guǒ - 五+个+苹果 (다섯+개+사과)'),
  ('JA', 'りんご五つ', 'りんごいつつ(ringo itsutsu) - りんご+五つ (사과+다섯)'),
  ('KO', '사과 다섯', '명사+숫자 패턴. 수량 표현. sagwa daseot')
) AS v(lang, expr, hint)
WHERE s.meaning = '사과 다섯' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Ten eggs', 'Phrase: noun + number'),
  ('ES', 'Diez huevos', 'Frase: número + sustantivo'),
  ('ZH', '十个鸡蛋', 'shí ge jī dàn - 十+个+鸡蛋 (열+개+달걀)'),
  ('JA', '卵十個', 'たまごじゅっこ(tamago jukko) - 卵+十個 (달걀+열 개)'),
  ('KO', '달걀 열', '명사+숫자 패턴. dalgyal yeol')
) AS v(lang, expr, hint)
WHERE s.meaning = '달걀 열' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'One water', 'Phrase: noun + number (ordering)'),
  ('ES', 'Un agua', 'Frase: número + sustantivo (pedir)'),
  ('ZH', '一杯水', 'yì bēi shuǐ - 一+杯+水 (한+잔+물)'),
  ('JA', '水一つ', 'みずひとつ(mizu hitotsu) - 水+一つ (물+하나)'),
  ('KO', '물 하나', '명사+숫자 패턴. 주문할 때 많이 사용. mul hana')
) AS v(lang, expr, hint)
WHERE s.meaning = '물 하나' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'How much is it?', 'Question about price'),
  ('ES', '¿Cuánto cuesta?', 'Pregunta sobre el precio'),
  ('ZH', '多少钱？', 'duō shǎo qián - 多少+钱？(얼마+돈?)'),
  ('JA', 'いくらですか？', 'いくらですか(ikura desu ka) - いくら+ですか？(얼마+입니까?)'),
  ('KO', '얼마예요?', '가격을 물을 때 쓰는 기본 표현. eolmayeyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '얼마예요?' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are three apples', 'Existence + counting sentence'),
  ('ES', 'Hay tres manzanas', 'Oración de existencia + conteo'),
  ('ZH', '有三个苹果', 'yǒu sān ge píng guǒ - 有+三个+苹果 (있다+세 개+사과)'),
  ('JA', 'りんごが三つあります', 'りんごがみっつあります(ringo ga mittsu arimasu)'),
  ('KO', '사과가 셋 있습니다', '명사+가+숫자+있습니다 패턴. sagwaga set itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '사과가 셋 있습니다' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are four chairs', 'Existence + counting sentence'),
  ('ES', 'Hay cuatro sillas', 'Oración de existencia + conteo'),
  ('ZH', '有四把椅子', 'yǒu sì bǎ yǐ zi - 有+四把+椅子 (있다+네 개+의자)'),
  ('JA', '椅子が四つあります', 'いすがよっつあります(isu ga yottsu arimasu)'),
  ('KO', '의자가 넷 있습니다', '명사+가+숫자+있습니다 패턴. uijaga net itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '의자가 넷 있습니다' AND l.level_number = 6 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are two children', 'Existence + counting sentence'),
  ('ES', 'Hay dos niños', 'Oración de existencia + conteo'),
  ('ZH', '有两个孩子', 'yǒu liǎng ge hái zi - 有+两个+孩子 (있다+두 명+아이)'),
  ('JA', '子どもが二人います', 'こどもがふたりいます(kodomo ga futari imasu)'),
  ('KO', '아이가 둘 있습니다', '명사+가+숫자+있습니다 패턴. aiga dul itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '아이가 둘 있습니다' AND l.level_number = 6 AND sk.display_order = 4;

-- Level 7, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Apple', 'Common red or green fruit'),
  ('ES', 'Manzana', 'Fruta común roja o verde'),
  ('ZH', '苹果', 'píng guǒ - 苹果 (사과)'),
  ('JA', 'りんご', 'りんご(ringo) - りんご (사과)'),
  ('KO', '사과', '흔한 과일. ''사과(apology)''와 동음. sagwa')
) AS v(lang, expr, hint)
WHERE s.meaning = '사과' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Banana', 'Long yellow fruit'),
  ('ES', 'Plátano', 'Fruta larga y amarilla'),
  ('ZH', '香蕉', 'xiāng jiāo - 香蕉 (바나나)'),
  ('JA', 'バナナ', 'バナナ(banana) - バナナ (바나나)'),
  ('KO', '바나나', '긴 노란색 과일. 외래어. banana')
) AS v(lang, expr, hint)
WHERE s.meaning = '바나나' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Grape', 'Small round fruit in clusters'),
  ('ES', 'Uva', 'Fruta pequeña y redonda en racimos'),
  ('ZH', '葡萄', 'pú tao - 葡萄 (포도)'),
  ('JA', 'ぶどう', 'ぶどう(budō) - ぶどう (포도)'),
  ('KO', '포도', '송이로 열리는 작고 둥근 과일. podo')
) AS v(lang, expr, hint)
WHERE s.meaning = '포도' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big watermelon', 'Phrase: adjective + fruit'),
  ('ES', 'Sandía grande', 'Frase: fruta + adjetivo'),
  ('ZH', '大西瓜', 'dà xī guā - 大+西瓜 (큰+수박)'),
  ('JA', '大きいスイカ', 'おおきいスイカ(ōkii suika) - 大きい+スイカ (큰+수박)'),
  ('KO', '큰 수박', '크기+과일 패턴. keun subak')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 수박' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Red strawberry', 'Phrase: color + fruit'),
  ('ES', 'Fresa roja', 'Frase: fruta + color'),
  ('ZH', '红草莓', 'hóng cǎo méi - 红+草莓 (빨간+딸기)'),
  ('JA', '赤いイチゴ', 'あかいイチゴ(akai ichigo) - 赤い+イチゴ (빨간+딸기)'),
  ('KO', '빨간 딸기', '색상+과일 패턴. 빨갛다→빨간(관형형). ppalgan ttalgi')
) AS v(lang, expr, hint)
WHERE s.meaning = '빨간 딸기' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'An apple, please', 'Request phrase'),
  ('ES', 'Una manzana, por favor', 'Frase de solicitud'),
  ('ZH', '请给我苹果', 'qǐng gěi wǒ píng guǒ - 请+给我+苹果 (주세요+사과)'),
  ('JA', 'りんごをください', 'りんごをください(ringo o kudasai) - りんご+を+ください'),
  ('KO', '사과 주세요', '명사+주세요 패턴. 정중한 요청. sagwa juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '사과 주세요' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'A lot of fruit', 'Phrase: noun + adjective'),
  ('ES', 'Mucha fruta', 'Frase: sustantivo + adjetivo'),
  ('ZH', '水果很多', 'shuǐ guǒ hěn duō - 水果+很+多 (과일+많다)'),
  ('JA', '果物が多い', 'くだものがおおい(kudamono ga ōi) - 果物+が+多い'),
  ('KO', '과일 많다', '명사+형용사 패턴. gwail manta')
) AS v(lang, expr, hint)
WHERE s.meaning = '과일 많다' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are tomatoes', 'Existence sentence'),
  ('ES', 'Hay tomates', 'Oración de existencia'),
  ('ZH', '有番茄', 'yǒu fān qié - 有+番茄 (있다+토마토)'),
  ('JA', 'トマトがあります', 'トマトがあります(tomato ga arimasu)'),
  ('KO', '토마토가 있습니다', '명사+가+있습니다 패턴. tomatoga itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '토마토가 있습니다' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Carrots are good', 'Subject + adjective sentence'),
  ('ES', 'Las zanahorias son buenas', 'Oración: sujeto + adjetivo'),
  ('ZH', '胡萝卜很好', 'hú luó bo hěn hǎo - 胡萝卜+很+好 (당근+좋다)'),
  ('JA', 'にんじんがいいです', 'にんじんがいいです(ninjin ga ii desu)'),
  ('KO', '당근이 좋습니다', '명사+이+형용사 패턴. danggeuni jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '당근이 좋습니다' AND l.level_number = 7 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is a potato', 'Subject + be + noun sentence'),
  ('ES', 'Esto es una patata', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '这是土豆', 'zhè shì tǔ dòu - 这+是+土豆 (이것+은+감자)'),
  ('JA', 'これはじゃがいもです', 'これはじゃがいもです(kore wa jagaimo desu)'),
  ('KO', '이것은 감자입니다', '이것+은+명사+입니다 패턴. igoseun gamjaimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 감자입니다' AND l.level_number = 7 AND sk.display_order = 1;

-- Level 7, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Coffee', 'Hot beverage made from roasted beans'),
  ('ES', 'Café', 'Bebida caliente hecha de granos tostados'),
  ('ZH', '咖啡', 'kā fēi - 咖啡 (커피)'),
  ('JA', 'コーヒー', 'コーヒー(kōhī) - コーヒー (커피)'),
  ('KO', '커피', '원두로 만든 음료. 외래어. keopi')
) AS v(lang, expr, hint)
WHERE s.meaning = '커피' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Juice', 'Drink made from fruit'),
  ('ES', 'Jugo', 'Bebida hecha de frutas'),
  ('ZH', '果汁', 'guǒ zhī - 果汁 (주스)'),
  ('JA', 'ジュース', 'ジュース(jūsu) - ジュース (주스)'),
  ('KO', '주스', '과일로 만든 음료. 외래어. juseu')
) AS v(lang, expr, hint)
WHERE s.meaning = '주스' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cake', 'Sweet baked dessert'),
  ('ES', 'Pastel', 'Postre dulce horneado'),
  ('ZH', '蛋糕', 'dàn gāo - 蛋糕 (케이크)'),
  ('JA', 'ケーキ', 'ケーキ(kēki) - ケーキ (케이크)'),
  ('KO', '케이크', '달콤한 구운 디저트. 외래어. keikeu')
) AS v(lang, expr, hint)
WHERE s.meaning = '케이크' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'One cup of coffee', 'Phrase: noun + counter'),
  ('ES', 'Una taza de café', 'Frase: sustantivo + contador'),
  ('ZH', '一杯咖啡', 'yì bēi kā fēi - 一+杯+咖啡 (한+잔+커피)'),
  ('JA', 'コーヒー一杯', 'コーヒーいっぱい(kōhī ippai) - コーヒー+一杯 (커피+한 잔)'),
  ('KO', '커피 한 잔', '명사+수량+단위 패턴. ''잔''은 음료 단위. keopi han jan')
) AS v(lang, expr, hint)
WHERE s.meaning = '커피 한 잔' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Tea, please', 'Request phrase'),
  ('ES', 'Té, por favor', 'Frase de solicitud'),
  ('ZH', '请给我茶', 'qǐng gěi wǒ chá - 请+给我+茶 (주세요+차)'),
  ('JA', 'お茶をください', 'おちゃをください(ocha o kudasai) - お茶+を+ください'),
  ('KO', '차 주세요', '명사+주세요 패턴. cha juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '차 주세요' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Sweet cookie', 'Phrase: adjective + noun'),
  ('ES', 'Galleta dulce', 'Frase: sustantivo + adjetivo'),
  ('ZH', '甜饼干', 'tián bǐng gān - 甜+饼干 (달콤한+쿠키)'),
  ('JA', '甘いクッキー', 'あまいクッキー(amai kukkī) - 甘い+クッキー (달콤한+쿠키)'),
  ('KO', '달콤한 쿠키', '맛+간식 패턴. 달콤하다→달콤한. dalkomhan kuki')
) AS v(lang, expr, hint)
WHERE s.meaning = '달콤한 쿠키' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cold juice', 'Phrase: adjective + noun'),
  ('ES', 'Jugo frío', 'Frase: sustantivo + adjetivo'),
  ('ZH', '冷果汁', 'lěng guǒ zhī - 冷+果汁 (차가운+주스)'),
  ('JA', '冷たいジュース', 'つめたいジュース(tsumetai jūsu) - 冷たい+ジュース'),
  ('KO', '차가운 주스', '온도+음료 패턴. 차갑다→차가운. chagaun juseu')
) AS v(lang, expr, hint)
WHERE s.meaning = '차가운 주스' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Coffee is good', 'Subject + adjective sentence'),
  ('ES', 'El café es bueno', 'Oración: sujeto + adjetivo'),
  ('ZH', '咖啡很好', 'kā fēi hěn hǎo - 咖啡+很+好 (커피+좋다)'),
  ('JA', 'コーヒーがいいです', 'コーヒーがいいです(kōhī ga ii desu)'),
  ('KO', '커피가 좋습니다', '명사+가+형용사 패턴. keopiga jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '커피가 좋습니다' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Ice cream is sweet', 'Subject + adjective sentence'),
  ('ES', 'El helado es dulce', 'Oración: sujeto + adjetivo'),
  ('ZH', '冰淇淋很甜', 'bīng qí lín hěn tián - 冰淇淋+很+甜 (아이스크림+달다)'),
  ('JA', 'アイスクリームは甘い', 'アイスクリームはあまい(aisukurīmu wa amai)'),
  ('KO', '아이스크림이 달다', '명사+이+형용사 패턴. aiseukeurimi dalda')
) AS v(lang, expr, hint)
WHERE s.meaning = '아이스크림이 달다' AND l.level_number = 7 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Water, please', 'Request phrase'),
  ('ES', 'Agua, por favor', 'Frase de solicitud'),
  ('ZH', '请给我水', 'qǐng gěi wǒ shuǐ - 请+给我+水 (주세요+물)'),
  ('JA', '水をください', 'みずをください(mizu o kudasai) - 水+を+ください'),
  ('KO', '물 주세요', '명사+주세요 패턴. 가장 기본적인 요청. mul juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '물 주세요' AND l.level_number = 7 AND sk.display_order = 2;

-- Level 7, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Lunch', 'Midday meal'),
  ('ES', 'Almuerzo', 'Comida del mediodía'),
  ('ZH', '午饭', 'wǔ fàn - 午饭 (점심)'),
  ('JA', '昼ご飯', 'ひるごはん(hirugohan) - 昼ご飯 (점심)'),
  ('KO', '점심', '낮에 먹는 식사. jeomsim')
) AS v(lang, expr, hint)
WHERE s.meaning = '점심' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Menu', 'List of food and drinks'),
  ('ES', 'Menú', 'Lista de comidas y bebidas'),
  ('ZH', '菜单', 'cài dān - 菜单 (메뉴)'),
  ('JA', 'メニュー', 'メニュー(menyū) - メニュー (메뉴)'),
  ('KO', '메뉴', '음식과 음료의 목록. 외래어. menyu')
) AS v(lang, expr, hint)
WHERE s.meaning = '메뉴' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Spoon', 'Utensil for eating liquid food'),
  ('ES', 'Cuchara', 'Utensilio para comer alimentos líquidos'),
  ('ZH', '勺子', 'sháo zi - 勺子 (숟가락)'),
  ('JA', 'スプーン', 'スプーン(supūn) - スプーン (숟가락)'),
  ('KO', '숟가락', '국이나 밥을 먹는 도구. sutgarak')
) AS v(lang, expr, hint)
WHERE s.meaning = '숟가락' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Breakfast, please', 'Request phrase'),
  ('ES', 'Desayuno, por favor', 'Frase de solicitud'),
  ('ZH', '请给我早餐', 'qǐng gěi wǒ zǎo cān - 请+给我+早餐 (주세요+아침식사)'),
  ('JA', '朝食をお願いします', 'ちょうしょくをおねがいします(chōshoku o onegai shimasu)'),
  ('KO', '아침식사 주세요', '명사+주세요 패턴. achimshiksa juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '아침식사 주세요' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Chopsticks, please', 'Request phrase'),
  ('ES', 'Palillos, por favor', 'Frase de solicitud'),
  ('ZH', '请给我筷子', 'qǐng gěi wǒ kuài zi - 请+给我+筷子 (주세요+젓가락)'),
  ('JA', 'お箸をください', 'おはしをください(ohashi o kudasai) - お箸+を+ください'),
  ('KO', '젓가락 주세요', '명사+주세요 패턴. jeotgarak juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '젓가락 주세요' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'One cup', 'Phrase: noun + number'),
  ('ES', 'Una taza', 'Frase: sustantivo + número'),
  ('ZH', '一个杯子', 'yí ge bēi zi - 一+个+杯子 (하나+개+컵)'),
  ('JA', 'コップ一つ', 'コップひとつ(koppu hitotsu) - コップ+一つ (컵+하나)'),
  ('KO', '컵 하나', '명사+숫자 패턴. keop hana')
) AS v(lang, expr, hint)
WHERE s.meaning = '컵 하나' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Menu, please', 'Request phrase'),
  ('ES', 'El menú, por favor', 'Frase de solicitud'),
  ('ZH', '请给我菜单', 'qǐng gěi wǒ cài dān - 请+给我+菜单 (주세요+메뉴)'),
  ('JA', 'メニューをください', 'メニューをください(menyū o kudasai)'),
  ('KO', '메뉴 주세요', '명사+주세요 패턴. 식당에서 자주 사용. menyu juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '메뉴 주세요' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is rice', 'Existence sentence'),
  ('ES', 'Hay arroz', 'Oración de existencia'),
  ('ZH', '有米饭', 'yǒu mǐ fàn - 有+米饭 (있다+밥)'),
  ('JA', 'ご飯があります', 'ごはんがあります(gohan ga arimasu)'),
  ('KO', '밥이 있습니다', '명사+이+있습니다 패턴. babi itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '밥이 있습니다' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The soup is hot', 'Subject + adjective sentence'),
  ('ES', 'La sopa está caliente', 'Oración: sujeto + adjetivo'),
  ('ZH', '汤很热', 'tāng hěn rè - 汤+很+热 (국+뜨겁다)'),
  ('JA', 'スープが熱いです', 'スープがあついです(sūpu ga atsui desu)'),
  ('KO', '국이 뜨겁습니다', '명사+이+형용사 패턴. gugi tteugeopseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '국이 뜨겁습니다' AND l.level_number = 7 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The plate is big', 'Subject + adjective sentence'),
  ('ES', 'El plato es grande', 'Oración: sujeto + adjetivo'),
  ('ZH', '盘子很大', 'pán zi hěn dà - 盘子+很+大 (접시+크다)'),
  ('JA', 'お皿が大きいです', 'おさらがおおきいです(osara ga ōkii desu)'),
  ('KO', '접시가 큽니다', '명사+가+형용사 패턴. jeopsiga keumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '접시가 큽니다' AND l.level_number = 7 AND sk.display_order = 3;

-- Level 7, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Delicious', 'Adjective meaning tasty'),
  ('ES', 'Delicioso', 'Adjetivo que significa sabroso'),
  ('ZH', '好吃', 'hǎo chī - 好吃 (맛있다)'),
  ('JA', 'おいしい', 'おいしい(oishii) - おいしい (맛있다)'),
  ('KO', '맛있다', '맛 형용사. 음식이 좋은 맛임. masitda')
) AS v(lang, expr, hint)
WHERE s.meaning = '맛있다' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Spicy', 'Adjective meaning hot/peppery'),
  ('ES', 'Picante', 'Adjetivo que significa picante'),
  ('ZH', '辣', 'là - 形容词，辣 (형용사, 매운)'),
  ('JA', '辛い', 'からい(karai) - 辛い (매운)'),
  ('KO', '맵다', '맛 형용사. 고추 같은 맛. maepda')
) AS v(lang, expr, hint)
WHERE s.meaning = '맵다' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Bland', 'Adjective meaning not salty enough'),
  ('ES', 'Insípido', 'Adjetivo que significa sin suficiente sal'),
  ('ZH', '淡', 'dàn - 形容词，淡 (형용사, 싱거운)'),
  ('JA', '薄味', 'うすあじ(usuaji) - 味が薄い (싱겁다)'),
  ('KO', '싱겁다', '맛 형용사. 간이 약함. 반대말: 짜다. singgeopda')
) AS v(lang, expr, hint)
WHERE s.meaning = '싱겁다' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Delicious rice', 'Phrase: adjective + noun'),
  ('ES', 'Arroz delicioso', 'Frase: sustantivo + adjetivo'),
  ('ZH', '好吃的饭', 'hǎo chī de fàn - 好吃的+饭 (맛있는+밥)'),
  ('JA', 'おいしいご飯', 'おいしいごはん(oishii gohan) - おいしい+ご飯'),
  ('KO', '맛있는 밥', '관형사형+명사. 맛있다→맛있는. masinneun bap')
) AS v(lang, expr, hint)
WHERE s.meaning = '맛있는 밥' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Spicy soup', 'Phrase: adjective + noun'),
  ('ES', 'Sopa picante', 'Frase: sustantivo + adjetivo'),
  ('ZH', '辣汤', 'là tāng - 辣+汤 (매운+국)'),
  ('JA', '辛いスープ', 'からいスープ(karai sūpu) - 辛い+スープ'),
  ('KO', '매운 국', '관형사형+명사. 맵다→매운. maeun guk')
) AS v(lang, expr, hint)
WHERE s.meaning = '매운 국' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Sweet fruit', 'Phrase: adjective + noun'),
  ('ES', 'Fruta dulce', 'Frase: sustantivo + adjetivo'),
  ('ZH', '甜水果', 'tián shuǐ guǒ - 甜+水果 (달콤한+과일)'),
  ('JA', '甘い果物', 'あまいくだもの(amai kudamono) - 甘い+果物'),
  ('KO', '달콤한 과일', '관형사형+명사. 달콤하다→달콤한. dalkomhan gwail')
) AS v(lang, expr, hint)
WHERE s.meaning = '달콤한 과일' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Fresh vegetables', 'Phrase: adjective + noun'),
  ('ES', 'Verduras frescas', 'Frase: sustantivo + adjetivo'),
  ('ZH', '新鲜蔬菜', 'xīn xiān shū cài - 新鲜+蔬菜 (신선한+채소)'),
  ('JA', '新鮮な野菜', 'しんせんなやさい(shinsen na yasai) - 新鮮な+野菜'),
  ('KO', '신선한 채소', '관형사형+명사. 신선하다→신선한. sinseonhan chaeso')
) AS v(lang, expr, hint)
WHERE s.meaning = '신선한 채소' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The meat is delicious', 'Subject + adjective sentence'),
  ('ES', 'La carne es deliciosa', 'Oración: sujeto + adjetivo'),
  ('ZH', '肉很好吃', 'ròu hěn hǎo chī - 肉+很+好吃 (고기+맛있다)'),
  ('JA', '肉がおいしいです', 'にくがおいしいです(niku ga oishii desu)'),
  ('KO', '고기가 맛있습니다', '명사+가+형용사 패턴. gogiga masitseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '고기가 맛있습니다' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The bread is soft', 'Subject + adjective sentence'),
  ('ES', 'El pan es suave', 'Oración: sujeto + adjetivo'),
  ('ZH', '面包很软', 'miàn bāo hěn ruǎn - 面包+很+软 (빵+부드럽다)'),
  ('JA', 'パンが柔らかいです', 'パンがやわらかいです(pan ga yawarakai desu)'),
  ('KO', '빵이 부드럽습니다', '명사+이+형용사 패턴. ppangi budeureopseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '빵이 부드럽습니다' AND l.level_number = 7 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is salty', 'Subject + adjective sentence'),
  ('ES', 'Esto es salado', 'Oración: sujeto + adjetivo'),
  ('ZH', '这个很咸', 'zhè ge hěn xián - 这个+很+咸 (이것+짜다)'),
  ('JA', 'これはしょっぱいです', 'これはしょっぱいです(kore wa shoppai desu)'),
  ('KO', '이것은 짭니다', '이것+은+형용사 패턴. 짜다→짭니다(격식). igoseun jjamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 짭니다' AND l.level_number = 7 AND sk.display_order = 4;

-- Level 8, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Teacher', 'Person who teaches at school'),
  ('ES', 'Profesor', 'Persona que enseña en la escuela'),
  ('ZH', '老师', 'lǎo shī - 老师 (선생님)'),
  ('JA', '先生', 'せんせい(sensei) - 先生 (선생님)'),
  ('KO', '선생님', '가르치는 사람. 존칭 ''님'' 포함. seonsaengnim')
) AS v(lang, expr, hint)
WHERE s.meaning = '선생님' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Doctor', 'Person who treats sick people'),
  ('ES', 'Doctor', 'Persona que trata a los enfermos'),
  ('ZH', '医生', 'yī shēng - 医生 (의사)'),
  ('JA', '医者', 'いしゃ(isha) - 医者 (의사)'),
  ('KO', '의사', '아픈 사람을 치료하는 사람. uisa')
) AS v(lang, expr, hint)
WHERE s.meaning = '의사' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Good teacher', 'Phrase: adjective + noun'),
  ('ES', 'Buen profesor', 'Frase: adjetivo + sustantivo'),
  ('ZH', '好老师', 'hǎo lǎo shī - 好+老师 (좋은+선생님)'),
  ('JA', 'いい先生', 'いいせんせい(ii sensei) - いい+先生 (좋은+선생님)'),
  ('KO', '좋은 선생님', '관형사형+명사 패턴. joeun seonsaengnim')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋은 선생님' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Our doctor', 'Phrase: possessive + noun'),
  ('ES', 'Nuestro doctor', 'Frase: posesivo + sustantivo'),
  ('ZH', '我们的医生', 'wǒ men de yī shēng - 我们的+医生 (우리+의사)'),
  ('JA', '私たちの医者', 'わたしたちのいしゃ(watashitachi no isha)'),
  ('KO', '우리 의사', '소유격+명사 패턴. uri uisa')
) AS v(lang, expr, hint)
WHERE s.meaning = '우리 의사' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Many students', 'Phrase: noun + adjective'),
  ('ES', 'Muchos estudiantes', 'Frase: adjetivo + sustantivo'),
  ('ZH', '学生很多', 'xué shēng hěn duō - 学生+很+多 (학생+많다)'),
  ('JA', '学生が多い', 'がくせいがおおい(gakusei ga ōi)'),
  ('KO', '학생 많다', '명사+형용사 패턴. haksaeng manta')
) AS v(lang, expr, hint)
WHERE s.meaning = '학생 많다' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I am a student', 'Subject + be + noun sentence'),
  ('ES', 'Soy estudiante', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '我是学生', 'wǒ shì xué shēng - 我+是+学生 (나+는+학생)'),
  ('JA', '私は学生です', 'わたしはがくせいです(watashi wa gakusei desu)'),
  ('KO', '나는 학생입니다', '주어+는+명사+입니다 패턴. naneun haksaengimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 학생입니다' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'She is a nurse', 'Subject + be + noun sentence'),
  ('ES', 'Ella es enfermera', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '她是护士', 'tā shì hù shi - 她+是+护士 (그녀+는+간호사)'),
  ('JA', '彼女は看護師です', 'かのじょはかんごしです(kanojo wa kangoshi desu)'),
  ('KO', '그녀는 간호사입니다', '주어+는+명사+입니다 패턴. geunyeoneun ganhosaimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그녀는 간호사입니다' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Dad is an office worker', 'Subject + be + noun sentence'),
  ('ES', 'Papá es oficinista', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '爸爸是公司职员', 'bà ba shì gōng sī zhí yuán - 爸爸+是+公司职员'),
  ('JA', 'お父さんは会社員です', 'おとうさんはかいしゃいんです(otōsan wa kaishain desu)'),
  ('KO', '아빠는 회사원입니다', '주어+는+명사+입니다 패턴. appaneun hoesawonimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '아빠는 회사원입니다' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'He is a cook', 'Subject + be + noun sentence'),
  ('ES', 'Él es cocinero', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '他是厨师', 'tā shì chú shī - 他+是+厨师 (그+는+요리사)'),
  ('JA', '彼は料理人です', 'かれはりょうりにんです(kare wa ryōrinin desu)'),
  ('KO', '그는 요리사입니다', '주어+는+명사+입니다 패턴. geuneun yorisaimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그는 요리사입니다' AND l.level_number = 8 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Our mom is a teacher at school', 'Extended sentence with location'),
  ('ES', 'Nuestra mamá es profesora en la escuela', 'Oración extendida con lugar'),
  ('ZH', '我们妈妈在学校是老师', 'wǒ men mā ma zài xué xiào shì lǎo shī'),
  ('JA', 'お母さんは学校で先生です', 'おかあさんはがっこうでせんせいです(okāsan wa gakkō de sensei desu)'),
  ('KO', '우리 엄마는 학교에서 선생님입니다', '주어+는+장소에서+명사+입니다. 확장 단문. uri eommaneun hakgyoeseo seonsaengnimimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '우리 엄마는 학교에서 선생님입니다' AND l.level_number = 8 AND sk.display_order = 1;

-- Level 8, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Class', 'A lesson or course'),
  ('ES', 'Clase', 'Una lección o curso'),
  ('ZH', '课', 'kè - 课，上课 (수업)'),
  ('JA', '授業', 'じゅぎょう(jugyō) - 授業 (수업)'),
  ('KO', '수업', '학교에서 배우는 시간. sueop')
) AS v(lang, expr, hint)
WHERE s.meaning = '수업' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Homework', 'School work done at home'),
  ('ES', 'Tarea', 'Trabajo escolar hecho en casa'),
  ('ZH', '作业', 'zuò yè - 作业 (숙제)'),
  ('JA', '宿題', 'しゅくだい(shukudai) - 宿題 (숙제)'),
  ('KO', '숙제', '집에서 하는 학교 과제. sukje')
) AS v(lang, expr, hint)
WHERE s.meaning = '숙제' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Difficult homework', 'Phrase: adjective + noun'),
  ('ES', 'Tarea difícil', 'Frase: sustantivo + adjetivo'),
  ('ZH', '难的作业', 'nán de zuò yè - 难的+作业 (어려운+숙제)'),
  ('JA', '難しい宿題', 'むずかしいしゅくだい(muzukashii shukudai)'),
  ('KO', '어려운 숙제', '관형사형+명사. 어렵다→어려운. eoryeoun sukje')
) AS v(lang, expr, hint)
WHERE s.meaning = '어려운 숙제' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big classroom', 'Phrase: adjective + noun'),
  ('ES', 'Aula grande', 'Frase: sustantivo + adjetivo'),
  ('ZH', '大教室', 'dà jiào shì - 大+教室 (큰+교실)'),
  ('JA', '大きい教室', 'おおきいきょうしつ(ōkii kyōshitsu)'),
  ('KO', '큰 교실', '크기+장소 패턴. keun gyosil')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 교실' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'My textbook', 'Phrase: possessive + noun'),
  ('ES', 'Mi libro de texto', 'Frase: posesivo + sustantivo'),
  ('ZH', '我的课本', 'wǒ de kè běn - 我的+课本 (나의+교과서)'),
  ('JA', '私の教科書', 'わたしのきょうかしょ(watashi no kyōkasho)'),
  ('KO', '내 교과서', '소유격+명사 패턴. nae gyogwaseo')
) AS v(lang, expr, hint)
WHERE s.meaning = '내 교과서' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a class', 'Existence sentence'),
  ('ES', 'Hay clase', 'Oración de existencia'),
  ('ZH', '有课', 'yǒu kè - 有+课 (있다+수업)'),
  ('JA', '授業があります', 'じゅぎょうがあります(jugyō ga arimasu)'),
  ('KO', '수업이 있습니다', '명사+이+있습니다 패턴. sueobi itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '수업이 있습니다' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The exam is difficult', 'Subject + adjective sentence'),
  ('ES', 'El examen es difícil', 'Oración: sujeto + adjetivo'),
  ('ZH', '考试很难', 'kǎo shì hěn nán - 考试+很+难 (시험+어렵다)'),
  ('JA', '試験が難しいです', 'しけんがむずかしいです(shiken ga muzukashii desu)'),
  ('KO', '시험이 어렵습니다', '명사+이+형용사 패턴. siheomi eoryeopseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '시험이 어렵습니다' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The blackboard is big', 'Subject + adjective sentence'),
  ('ES', 'La pizarra es grande', 'Oración: sujeto + adjetivo'),
  ('ZH', '黑板很大', 'hēi bǎn hěn dà - 黑板+很+大 (칠판+크다)'),
  ('JA', '黒板が大きいです', 'こくばんがおおきいです(kokuban ga ōkii desu)'),
  ('KO', '칠판이 큽니다', '명사+이+형용사 패턴. chilpani keumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '칠판이 큽니다' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Studying is good', 'Subject + adjective sentence'),
  ('ES', 'Estudiar es bueno', 'Oración: sujeto + adjetivo'),
  ('ZH', '学习很好', 'xué xí hěn hǎo - 学习+很+好 (공부+좋다)'),
  ('JA', '勉強がいいです', 'べんきょうがいいです(benkyō ga ii desu)'),
  ('KO', '공부가 좋습니다', '명사+가+형용사 패턴. gongbuga jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '공부가 좋습니다' AND l.level_number = 8 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I study at school today', 'Extended sentence with time and place'),
  ('ES', 'Hoy estudio en la escuela', 'Oración extendida con tiempo y lugar'),
  ('ZH', '我今天在学校学习', 'wǒ jīn tiān zài xué xiào xué xí'),
  ('JA', '私は今日学校で勉強します', 'わたしはきょうがっこうでべんきょうします(watashi wa kyō gakkō de benkyō shimasu)'),
  ('KO', '나는 오늘 학교에서 공부합니다', '주어+시간+장소에서+동사 패턴. 확장 단문. naneun oneul hakgyoeseo gongbuhamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 오늘 학교에서 공부합니다' AND l.level_number = 8 AND sk.display_order = 2;

-- Level 8, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Office', 'Place where people work'),
  ('ES', 'Oficina', 'Lugar donde la gente trabaja'),
  ('ZH', '办公室', 'bàn gōng shì - 办公室 (사무실)'),
  ('JA', 'オフィス', 'オフィス(ofisu) - オフィス (사무실)'),
  ('KO', '사무실', '업무를 보는 곳. samusil')
) AS v(lang, expr, hint)
WHERE s.meaning = '사무실' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Big desk', 'Phrase: adjective + noun'),
  ('ES', 'Escritorio grande', 'Frase: sustantivo + adjetivo'),
  ('ZH', '大桌子', 'dà zhuō zi - 大+桌子 (큰+책상)'),
  ('JA', '大きい机', 'おおきいつくえ(ōkii tsukue) - 大きい+机'),
  ('KO', '큰 책상', '크기+가구 패턴. keun chaeksang')
) AS v(lang, expr, hint)
WHERE s.meaning = '큰 책상' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'My computer', 'Phrase: possessive + noun'),
  ('ES', 'Mi computadora', 'Frase: posesivo + sustantivo'),
  ('ZH', '我的电脑', 'wǒ de diàn nǎo - 我的+电脑 (나의+컴퓨터)'),
  ('JA', '私のパソコン', 'わたしのパソコン(watashi no pasokon)'),
  ('KO', '내 컴퓨터', '소유격+명사 패턴. nae keompyuteo')
) AS v(lang, expr, hint)
WHERE s.meaning = '내 컴퓨터' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Meeting today', 'Phrase: time + noun'),
  ('ES', 'Reunión hoy', 'Frase: sustantivo + tiempo'),
  ('ZH', '今天开会', 'jīn tiān kāi huì - 今天+开会 (오늘+회의)'),
  ('JA', '今日の会議', 'きょうのかいぎ(kyō no kaigi) - 今日+の+会議'),
  ('KO', '오늘 회의', '시간+명사 패턴. oneul hoeui')
) AS v(lang, expr, hint)
WHERE s.meaning = '오늘 회의' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a phone call', 'Existence sentence'),
  ('ES', 'Hay una llamada', 'Oración de existencia'),
  ('ZH', '有电话', 'yǒu diàn huà - 有+电话 (있다+전화)'),
  ('JA', '電話があります', 'でんわがあります(denwa ga arimasu)'),
  ('KO', '전화가 있습니다', '명사+가+있습니다 패턴. jeonhwaga itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '전화가 있습니다' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I read email', 'Subject + verb sentence'),
  ('ES', 'Leo el correo electrónico', 'Oración: sujeto + verbo'),
  ('ZH', '读邮件', 'dú yóu jiàn - 读+邮件 (읽다+이메일)'),
  ('JA', 'メールを読みます', 'メールをよみます(mēru o yomimasu)'),
  ('KO', '이메일을 읽습니다', '명사+을+동사 패턴. imeireul ikseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이메일을 읽습니다' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a lot of work', 'Subject + adjective sentence'),
  ('ES', 'Hay mucho trabajo', 'Oración: sujeto + adjetivo'),
  ('ZH', '工作很多', 'gōng zuò hěn duō - 工作+很+多 (일+많다)'),
  ('JA', '仕事が多いです', 'しごとがおおいです(shigoto ga ōi desu)'),
  ('KO', '일이 많습니다', '명사+이+형용사 패턴. iri manseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '일이 많습니다' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There are no documents', 'Non-existence sentence'),
  ('ES', 'No hay documentos', 'Oración de no existencia'),
  ('ZH', '没有文件', 'méi yǒu wén jiàn - 没有+文件 (없다+서류)'),
  ('JA', '書類がありません', 'しょるいがありません(shorui ga arimasen)'),
  ('KO', '서류가 없습니다', '명사+가+없습니다 패턴. seoryuga eopsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '서류가 없습니다' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a printer', 'Existence sentence'),
  ('ES', 'Hay una impresora', 'Oración de existencia'),
  ('ZH', '有打印机', 'yǒu dǎ yìn jī - 有+打印机 (있다+프린터)'),
  ('JA', 'プリンターがあります', 'プリンターがあります(purintā ga arimasu)'),
  ('KO', '프린터가 있습니다', '명사+가+있습니다 패턴. peurinteoga itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '프린터가 있습니다' AND l.level_number = 8 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'He goes to the office every morning', 'Extended sentence with time'),
  ('ES', 'Él va a la oficina cada mañana', 'Oración extendida con tiempo'),
  ('ZH', '他每天早上去办公室', 'tā měi tiān zǎo shang qù bàn gōng shì'),
  ('JA', '彼は毎朝オフィスに行きます', 'かれはまいあさオフィスにいきます(kare wa maiasa ofisu ni ikimasu)'),
  ('KO', '그는 매일 아침 사무실에 갑니다', '주어+빈도+시간+장소에+동사 패턴. 확장 단문. geuneun maeil achim samusire gamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그는 매일 아침 사무실에 갑니다' AND l.level_number = 8 AND sk.display_order = 3;

-- Level 8, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Music', 'Art of sound and rhythm'),
  ('ES', 'Música', 'Arte del sonido y ritmo'),
  ('ZH', '音乐', 'yīn yuè - 音乐 (음악)'),
  ('JA', '音楽', 'おんがく(ongaku) - 音楽 (음악)'),
  ('KO', '음악', '소리와 리듬의 예술. eumak')
) AS v(lang, expr, hint)
WHERE s.meaning = '음악' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Good music', 'Phrase: adjective + noun'),
  ('ES', 'Buena música', 'Frase: adjetivo + sustantivo'),
  ('ZH', '好音乐', 'hǎo yīn yuè - 好+音乐 (좋은+음악)'),
  ('JA', 'いい音楽', 'いいおんがく(ii ongaku) - いい+音楽'),
  ('KO', '좋은 음악', '관형사형+명사 패턴. joeun eumak')
) AS v(lang, expr, hint)
WHERE s.meaning = '좋은 음악' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Fun movie', 'Phrase: adjective + noun'),
  ('ES', 'Película divertida', 'Frase: sustantivo + adjetivo'),
  ('ZH', '有趣的电影', 'yǒu qù de diàn yǐng - 有趣的+电影 (재미있는+영화)'),
  ('JA', '面白い映画', 'おもしろいえいが(omoshiroi eiga) - 面白い+映画'),
  ('KO', '재미있는 영화', '관형사형+명사. 재미있다→재미있는. jaemiinneun yeonghwa')
) AS v(lang, expr, hint)
WHERE s.meaning = '재미있는 영화' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'My photo', 'Phrase: possessive + noun'),
  ('ES', 'Mi foto', 'Frase: posesivo + sustantivo'),
  ('ZH', '我的照片', 'wǒ de zhào piàn - 我的+照片 (나의+사진)'),
  ('JA', '私の写真', 'わたしのしゃしん(watashi no shashin)'),
  ('KO', '내 사진', '소유격+명사 패턴. nae sajin')
) AS v(lang, expr, hint)
WHERE s.meaning = '내 사진' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I like exercise', 'Subject + verb + object sentence'),
  ('ES', 'Me gusta el ejercicio', 'Oración: sujeto + verbo + objeto'),
  ('ZH', '我喜欢运动', 'wǒ xǐ huān yùn dòng - 我+喜欢+运动'),
  ('JA', '私は運動が好きです', 'わたしはうんどうがすきです(watashi wa undō ga suki desu)'),
  ('KO', '나는 운동을 좋아합니다', '주어+목적어+을+동사 패턴. naneun undongeul joahamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 운동을 좋아합니다' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Movies are good', 'Subject + adjective sentence'),
  ('ES', 'Las películas son buenas', 'Oración: sujeto + adjetivo'),
  ('ZH', '电影很好', 'diàn yǐng hěn hǎo - 电影+很+好 (영화+좋다)'),
  ('JA', '映画がいいです', 'えいががいいです(eiga ga ii desu)'),
  ('KO', '영화가 좋습니다', '명사+가+형용사 패턴. yeonghwaga jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '영화가 좋습니다' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Cooking is fun', 'Subject + adjective sentence'),
  ('ES', 'Cocinar es divertido', 'Oración: sujeto + adjetivo'),
  ('ZH', '做菜很有趣', 'zuò cài hěn yǒu qù - 做菜+很+有趣 (요리+재미있다)'),
  ('JA', '料理が面白いです', 'りょうりがおもしろいです(ryōri ga omoshiroi desu)'),
  ('KO', '요리가 재미있습니다', '명사+가+형용사 패턴. yoriga jaemiitsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '요리가 재미있습니다' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I like reading', 'Object + verb sentence'),
  ('ES', 'Me gusta leer', 'Oración: verbo + objeto'),
  ('ZH', '喜欢读书', 'xǐ huān dú shū - 喜欢+读书 (좋아하다+독서)'),
  ('JA', '読書が好きです', 'どくしょがすきです(dokusho ga suki desu)'),
  ('KO', '독서를 좋아합니다', '명사+를+동사 패턴. dokseoreul joahamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '독서를 좋아합니다' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Songs are good', 'Subject + adjective sentence'),
  ('ES', 'Las canciones son buenas', 'Oración: sujeto + adjetivo'),
  ('ZH', '歌曲很好', 'gē qǔ hěn hǎo - 歌曲+很+好 (노래+좋다)'),
  ('JA', '歌がいいです', 'うたがいいです(uta ga ii desu)'),
  ('KO', '노래가 좋습니다', '명사+가+형용사 패턴. noraega jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '노래가 좋습니다' AND l.level_number = 8 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I exercise at the park on weekends', 'Extended sentence with time and place'),
  ('ES', 'Hago ejercicio en el parque los fines de semana', 'Oración extendida'),
  ('ZH', '我周末在公园运动', 'wǒ zhōu mò zài gōng yuán yùn dòng'),
  ('JA', '私は週末に公園で運動します', 'わたしはしゅうまつにこうえんでうんどうします(watashi wa shūmatsu ni kōen de undō shimasu)'),
  ('KO', '나는 주말에 공원에서 운동합니다', '주어+시간에+장소에서+동사 패턴. 확장 단문. naneun jumare gongwoneseo undonghamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 주말에 공원에서 운동합니다' AND l.level_number = 8 AND sk.display_order = 4;

-- Level 9, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Inside', 'Location word meaning within'),
  ('ES', 'Dentro', 'Palabra de ubicación que significa adentro'),
  ('ZH', '里面', 'lǐ miàn - 里面 (안에)'),
  ('JA', '中に', 'なかに(naka ni) - 中に (안에)'),
  ('KO', '안에', '위치 조사. 내부를 나타냄. ane')
) AS v(lang, expr, hint)
WHERE s.meaning = '안에' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Next to', 'Location word meaning beside'),
  ('ES', 'Al lado de', 'Palabra de ubicación que significa al lado'),
  ('ZH', '旁边', 'páng biān - 旁边 (옆에)'),
  ('JA', '隣に', 'となりに(tonari ni) - 隣に (옆에)'),
  ('KO', '옆에', '위치 조사. 바로 곁을 나타냄. yeope')
) AS v(lang, expr, hint)
WHERE s.meaning = '옆에' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'On the table', 'Phrase: noun + location'),
  ('ES', 'Sobre la mesa', 'Frase: sustantivo + ubicación'),
  ('ZH', '桌子上面', 'zhuō zi shàng miàn - 桌子+上面 (탁자+위에)'),
  ('JA', 'テーブルの上に', 'テーブルのうえに(tēburu no ue ni)'),
  ('KO', '탁자 위에', '명사+위에 패턴. 위치 표현. takja wie')
) AS v(lang, expr, hint)
WHERE s.meaning = '탁자 위에' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Under the chair', 'Phrase: noun + location'),
  ('ES', 'Debajo de la silla', 'Frase: sustantivo + ubicación'),
  ('ZH', '椅子下面', 'yǐ zi xià miàn - 椅子+下面 (의자+아래에)'),
  ('JA', '椅子の下に', 'いすのしたに(isu no shita ni)'),
  ('KO', '의자 아래에', '명사+아래에 패턴. 위치 표현. uija arae')
) AS v(lang, expr, hint)
WHERE s.meaning = '의자 아래에' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'In front of the door', 'Phrase: noun + location'),
  ('ES', 'Frente a la puerta', 'Frase: sustantivo + ubicación'),
  ('ZH', '门前面', 'mén qián miàn - 门+前面 (문+앞에)'),
  ('JA', 'ドアの前に', 'ドアのまえに(doa no mae ni)'),
  ('KO', '문 앞에', '명사+앞에 패턴. 위치 표현. mun ape')
) AS v(lang, expr, hint)
WHERE s.meaning = '문 앞에' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is a book', 'Existence sentence'),
  ('ES', 'Hay un libro', 'Oración de existencia'),
  ('ZH', '有书', 'yǒu shū - 有+书 (있다+책)'),
  ('JA', '本があります', 'ほんがあります(hon ga arimasu)'),
  ('KO', '책이 있습니다', '명사+이+있습니다 패턴. chaegi itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '책이 있습니다' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The bag is here', 'Subject + location + exist sentence'),
  ('ES', 'La bolsa está aquí', 'Oración: sujeto + ubicación + estar'),
  ('ZH', '包在这里', 'bāo zài zhè lǐ - 包+在+这里 (가방+여기에+있다)'),
  ('JA', 'カバンはここにあります', 'カバンはここにあります(kaban wa koko ni arimasu)'),
  ('KO', '가방은 여기 있습니다', '명사+은+장소+있습니다 패턴. gabangeun yeogi itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '가방은 여기 있습니다' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The cat is outside', 'Subject + location + exist sentence'),
  ('ES', 'El gato está afuera', 'Oración: sujeto + ubicación + estar'),
  ('ZH', '猫在外面', 'māo zài wài miàn - 猫+在+外面 (고양이+밖에+있다)'),
  ('JA', '猫が外にいます', 'ねこがそとにいます(neko ga soto ni imasu)'),
  ('KO', '고양이가 밖에 있습니다', '명사+가+장소에+있습니다 패턴. goyangiga bakke itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '고양이가 밖에 있습니다' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The dog is inside the house', 'Subject + location + exist sentence'),
  ('ES', 'El perro está dentro de la casa', 'Oración con ubicación'),
  ('ZH', '狗在家里面', 'gǒu zài jiā lǐ miàn - 狗+在+家+里面'),
  ('JA', '犬が家の中にいます', 'いぬがいえのなかにいます(inu ga ie no naka ni imasu)'),
  ('KO', '개가 집 안에 있습니다', '명사+가+장소+안에+있습니다 패턴. gaega jip ane itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '개가 집 안에 있습니다' AND l.level_number = 9 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The key is on the table', 'Subject + location + exist sentence'),
  ('ES', 'La llave está sobre la mesa', 'Oración con ubicación'),
  ('ZH', '钥匙在桌子上面', 'yào shi zài zhuō zi shàng miàn'),
  ('JA', '鍵はテーブルの上にあります', 'かぎはテーブルのうえにあります(kagi wa tēburu no ue ni arimasu)'),
  ('KO', '열쇠는 탁자 위에 있습니다', '명사+는+장소+위에+있습니다 패턴. yeolsoeneun takja wie itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '열쇠는 탁자 위에 있습니다' AND l.level_number = 9 AND sk.display_order = 1;

-- Level 9, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Left', 'Direction word'),
  ('ES', 'Izquierda', 'Palabra de dirección'),
  ('ZH', '左边', 'zuǒ biān - 左边 (왼쪽)'),
  ('JA', '左', 'ひだり(hidari) - 左 (왼쪽)'),
  ('KO', '왼쪽', '방향 단어. 오른쪽의 반대. oenjjok')
) AS v(lang, expr, hint)
WHERE s.meaning = '왼쪽' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Right', 'Direction word'),
  ('ES', 'Derecha', 'Palabra de dirección'),
  ('ZH', '右边', 'yòu biān - 右边 (오른쪽)'),
  ('JA', '右', 'みぎ(migi) - 右 (오른쪽)'),
  ('KO', '오른쪽', '방향 단어. 왼쪽의 반대. oreunjjok')
) AS v(lang, expr, hint)
WHERE s.meaning = '오른쪽' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This way, please', 'Polite direction request'),
  ('ES', 'Por aquí, por favor', 'Solicitud cortés de dirección'),
  ('ZH', '请往这边', 'qǐng wǎng zhè biān - 请+往+这边 (이쪽으로+주세요)'),
  ('JA', 'こちらへお願いします', 'こちらへおねがいします(kochira e onegai shimasu)'),
  ('KO', '이쪽으로 주세요', '방향+으로+주세요 패턴. ijjogeuro juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '이쪽으로 주세요' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Door on the left', 'Phrase: direction + noun'),
  ('ES', 'Puerta a la izquierda', 'Frase: dirección + sustantivo'),
  ('ZH', '左边的门', 'zuǒ biān de mén - 左边的+门 (왼쪽+문)'),
  ('JA', '左のドア', 'ひだりのドア(hidari no doa) - 左+の+ドア'),
  ('KO', '왼쪽에 문', '방향+에+명사 패턴. oenjjoge mun')
) AS v(lang, expr, hint)
WHERE s.meaning = '왼쪽에 문' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That way, please', 'Polite direction phrase'),
  ('ES', 'Por allá, por favor', 'Frase cortés de dirección'),
  ('ZH', '请往那边', 'qǐng wǎng nà biān - 请+往+那边 (저쪽으로)'),
  ('JA', 'あちらへどうぞ', 'あちらへどうぞ(achira e dōzo)'),
  ('KO', '저쪽으로요', '방향+으로+요 패턴. jeojjogeuroyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '저쪽으로요' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The school is over there', 'Subject + location + exist sentence'),
  ('ES', 'La escuela está allá', 'Oración con ubicación'),
  ('ZH', '学校在那边', 'xué xiào zài nà biān - 学校+在+那边'),
  ('JA', '学校はあそこにあります', 'がっこうはあそこにあります(gakkō wa asoko ni arimasu)'),
  ('KO', '학교가 저기 있습니다', '명사+가+장소+있습니다 패턴. hakgyoga jeogi itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '학교가 저기 있습니다' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The park is on the right', 'Subject + direction sentence'),
  ('ES', 'El parque está a la derecha', 'Oración con dirección'),
  ('ZH', '公园在右边', 'gōng yuán zài yòu biān - 公园+在+右边'),
  ('JA', '公園は右です', 'こうえんはみぎです(kōen wa migi desu)'),
  ('KO', '공원은 오른쪽입니다', '명사+은+방향+입니다 패턴. gongwoneun oreunjjogimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '공원은 오른쪽입니다' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The store is on the left', 'Subject + direction + exist sentence'),
  ('ES', 'La tienda está a la izquierda', 'Oración con dirección'),
  ('ZH', '商店在左边', 'shāng diàn zài zuǒ biān - 商店+在+左边'),
  ('JA', '店は左にあります', 'みせはひだりにあります(mise wa hidari ni arimasu)'),
  ('KO', '가게가 왼쪽에 있습니다', '명사+가+방향에+있습니다 패턴. gagega oenjjoge itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '가게가 왼쪽에 있습니다' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Go straight and it''s the station', 'Conditional direction sentence'),
  ('ES', 'Siga recto y es la estación', 'Oración con dirección condicional'),
  ('ZH', '直走就是车站', 'zhí zǒu jiù shì chē zhàn - 直走+就是+车站'),
  ('JA', 'まっすぐ行くと駅です', 'まっすぐいくとえきです(massugu iku to eki desu)'),
  ('KO', '직진하면 역입니다', '동사+하면+명사+입니다 패턴. ''하면''은 조건. jikjinhamyeon yeogimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '직진하면 역입니다' AND l.level_number = 9 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The hospital is in front of the school', 'Subject + relative location sentence'),
  ('ES', 'El hospital está frente a la escuela', 'Oración con ubicación relativa'),
  ('ZH', '医院在学校前面', 'yī yuàn zài xué xiào qián miàn'),
  ('JA', '病院は学校の前にあります', 'びょういんはがっこうのまえにあります(byōin wa gakkō no mae ni arimasu)'),
  ('KO', '병원은 학교 앞에 있습니다', '명사+은+명사+앞에+있습니다 패턴. byeongwoneun hakgyo ape itsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '병원은 학교 앞에 있습니다' AND l.level_number = 9 AND sk.display_order = 2;

-- Level 9, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Close / Near', 'Adjective meaning short distance'),
  ('ES', 'Cerca', 'Adjetivo que significa corta distancia'),
  ('ZH', '近', 'jìn - 形容词，近 (형용사, 가까운)'),
  ('JA', '近い', 'ちかい(chikai) - 近い (가까운)'),
  ('KO', '가깝다', '거리 형용사. 반대말: 멀다. gakkapda')
) AS v(lang, expr, hint)
WHERE s.meaning = '가깝다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Far', 'Adjective meaning long distance'),
  ('ES', 'Lejos', 'Adjetivo que significa larga distancia'),
  ('ZH', '远', 'yuǎn - 形容词，远 (형용사, 먼)'),
  ('JA', '遠い', 'とおい(tōi) - 遠い (먼)'),
  ('KO', '멀다', '거리 형용사. 반대말: 가깝다. meolda')
) AS v(lang, expr, hint)
WHERE s.meaning = '멀다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Wide park', 'Phrase: adjective + noun'),
  ('ES', 'Parque amplio', 'Frase: sustantivo + adjetivo'),
  ('ZH', '宽阔的公园', 'kuān kuò de gōng yuán - 宽阔的+公园 (넓은+공원)'),
  ('JA', '広い公園', 'ひろいこうえん(hiroi kōen) - 広い+公園'),
  ('KO', '넓은 공원', '관형사형+명사. 넓다→넓은. neolbeun gongwon')
) AS v(lang, expr, hint)
WHERE s.meaning = '넓은 공원' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Narrow room', 'Phrase: adjective + noun'),
  ('ES', 'Habitación estrecha', 'Frase: sustantivo + adjetivo'),
  ('ZH', '狭小的房间', 'xiá xiǎo de fáng jiān - 狭小的+房间 (좁은+방)'),
  ('JA', '狭い部屋', 'せまいへや(semai heya) - 狭い+部屋'),
  ('KO', '좁은 방', '관형사형+명사. 좁다→좁은. jobeun bang')
) AS v(lang, expr, hint)
WHERE s.meaning = '좁은 방' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Light bag', 'Phrase: adjective + noun'),
  ('ES', 'Bolsa ligera', 'Frase: sustantivo + adjetivo'),
  ('ZH', '轻的包', 'qīng de bāo - 轻的+包 (가벼운+가방)'),
  ('JA', '軽いカバン', 'かるいカバン(karui kaban) - 軽い+カバン'),
  ('KO', '가벼운 가방', '관형사형+명사. 가볍다→가벼운. gabyeoun gabang')
) AS v(lang, expr, hint)
WHERE s.meaning = '가벼운 가방' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The school is close', 'Subject + adjective sentence'),
  ('ES', 'La escuela está cerca', 'Oración: sujeto + adjetivo'),
  ('ZH', '学校很近', 'xué xiào hěn jìn - 学校+很+近 (학교+가깝다)'),
  ('JA', '学校が近いです', 'がっこうがちかいです(gakkō ga chikai desu)'),
  ('KO', '학교가 가깝습니다', '명사+가+형용사 패턴. hakgyoga gakkapseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '학교가 가깝습니다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The hospital is far', 'Subject + adjective sentence'),
  ('ES', 'El hospital está lejos', 'Oración: sujeto + adjetivo'),
  ('ZH', '医院很远', 'yī yuàn hěn yuǎn - 医院+很+远 (병원+멀다)'),
  ('JA', '病院が遠いです', 'びょういんがとおいです(byōin ga tōi desu)'),
  ('KO', '병원이 멉니다', '명사+이+형용사 패턴. 멀다→멉니다(격식). byeongwoni meomnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '병원이 멉니다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This room is spacious', 'Subject + adjective sentence'),
  ('ES', 'Esta habitación es amplia', 'Oración: sujeto + adjetivo'),
  ('ZH', '这个房间很宽', 'zhè ge fáng jiān hěn kuān'),
  ('JA', 'この部屋は広いです', 'このへやはひろいです(kono heya wa hiroi desu)'),
  ('KO', '이 방은 넓습니다', '이+명사+은+형용사 패턴. i bangeun neolpseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이 방은 넓습니다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The bag is light', 'Subject + adjective sentence'),
  ('ES', 'La bolsa es ligera', 'Oración: sujeto + adjetivo'),
  ('ZH', '包很轻', 'bāo hěn qīng - 包+很+轻 (가방+가볍다)'),
  ('JA', 'カバンが軽いです', 'カバンがかるいです(kaban ga karui desu)'),
  ('KO', '가방이 가볍습니다', '명사+이+형용사 패턴. gabangi gabyeopseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '가방이 가볍습니다' AND l.level_number = 9 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Our house is close to the school', 'Extended sentence with reference point'),
  ('ES', 'Nuestra casa está cerca de la escuela', 'Oración extendida'),
  ('ZH', '我们家离学校很近', 'wǒ men jiā lí xué xiào hěn jìn'),
  ('JA', '私たちの家は学校から近いです', 'わたしたちのいえはがっこうからちかいです(watashitachi no ie wa gakkō kara chikai desu)'),
  ('KO', '우리 집은 학교에서 가깝습니다', '주어+은+기준점에서+형용사 패턴. 확장 단문. uri jibeun hakgyoeseo gakkapseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '우리 집은 학교에서 가깝습니다' AND l.level_number = 9 AND sk.display_order = 3;

-- Level 9, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'First / Beginning', 'Noun meaning the start'),
  ('ES', 'Primero / Inicio', 'Sustantivo que significa el comienzo'),
  ('ZH', '第一 / 开始', 'dì yī / kāi shǐ - 第一/开始 (처음)'),
  ('JA', '最初', 'さいしょ(saisho) - 最初 (처음)'),
  ('KO', '처음', '순서의 맨 앞. 시작을 뜻함. cheoeum')
) AS v(lang, expr, hint)
WHERE s.meaning = '처음' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Last / End', 'Noun meaning the end'),
  ('ES', 'Último / Final', 'Sustantivo que significa el final'),
  ('ZH', '最后', 'zuì hòu - 最后 (마지막)'),
  ('JA', '最後', 'さいご(saigo) - 最後 (마지막)'),
  ('KO', '마지막', '순서의 맨 끝. 끝을 뜻함. majimak')
) AS v(lang, expr, hint)
WHERE s.meaning = '마지막' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'First room', 'Phrase: ordinal + noun'),
  ('ES', 'Primera habitación', 'Frase: ordinal + sustantivo'),
  ('ZH', '第一个房间', 'dì yī ge fáng jiān - 第一个+房间 (첫 번째+방)'),
  ('JA', '最初の部屋', 'さいしょのへや(saisho no heya) - 最初+の+部屋'),
  ('KO', '첫 번째 방', '서수+명사 패턴. ''첫 번째''는 순서 1. cheot beonjjae bang')
) AS v(lang, expr, hint)
WHERE s.meaning = '첫 번째 방' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Next store', 'Phrase: order + noun'),
  ('ES', 'Siguiente tienda', 'Frase: orden + sustantivo'),
  ('ZH', '下一个商店', 'xià yí ge shāng diàn - 下一个+商店 (다음+가게)'),
  ('JA', '次の店', 'つぎのみせ(tsugi no mise) - 次+の+店'),
  ('KO', '다음 가게', '순서+명사 패턴. ''다음''은 그 뒤. daeum gage')
) AS v(lang, expr, hint)
WHERE s.meaning = '다음 가게' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Second house', 'Phrase: ordinal + noun'),
  ('ES', 'Segunda casa', 'Frase: ordinal + sustantivo'),
  ('ZH', '第二个房子', 'dì èr ge fáng zi - 第二个+房子 (두 번째+집)'),
  ('JA', '二番目の家', 'にばんめのいえ(nibanme no ie) - 二番目+の+家'),
  ('KO', '두 번째 집', '서수+명사 패턴. du beonjjae jip')
) AS v(lang, expr, hint)
WHERE s.meaning = '두 번째 집' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is the first', 'Subject + be + noun sentence'),
  ('ES', 'Esto es el primero', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '这是第一个', 'zhè shì dì yī ge - 这+是+第一个'),
  ('JA', 'これが最初です', 'これがさいしょです(kore ga saisho desu)'),
  ('KO', '이것이 처음입니다', '이것+이+명사+입니다 패턴. igeosi cheoeuminmida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것이 처음입니다' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That is the last', 'Subject + be + noun sentence'),
  ('ES', 'Eso es el último', 'Oración: sujeto + ser + sustantivo'),
  ('ZH', '那是最后一个', 'nà shì zuì hòu yí ge - 那+是+最后一个'),
  ('JA', 'あれが最後です', 'あれがさいごです(are ga saigo desu)'),
  ('KO', '저것이 마지막입니다', '저것+이+명사+입니다 패턴. jeogeosi majimagimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '저것이 마지막입니다' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Next is here', 'Subject + be + location sentence'),
  ('ES', 'El siguiente es aquí', 'Oración: sujeto + ser + lugar'),
  ('ZH', '下一个在这里', 'xià yí ge zài zhè lǐ - 下一个+在+这里'),
  ('JA', '次はここです', 'つぎはここです(tsugi wa koko desu)'),
  ('KO', '다음은 여기입니다', '다음+은+장소+입니다 패턴. daeumeun yeogimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '다음은 여기입니다' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The third one is good', 'Subject + adjective sentence'),
  ('ES', 'El tercero es bueno', 'Oración: sujeto + adjetivo'),
  ('ZH', '第三个很好', 'dì sān ge hěn hǎo - 第三个+很+好'),
  ('JA', '三番目がいいです', 'さんばんめがいいです(sanbanme ga ii desu)'),
  ('KO', '세 번째가 좋습니다', '서수+가+형용사 패턴. se beonjjaega jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '세 번째가 좋습니다' AND l.level_number = 9 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The first school is our school', 'Extended identification sentence'),
  ('ES', 'La primera escuela es nuestra escuela', 'Oración extendida de identificación'),
  ('ZH', '第一个学校是我们的学校', 'dì yī ge xué xiào shì wǒ men de xué xiào'),
  ('JA', '最初の学校が私たちの学校です', 'さいしょのがっこうがわたしたちのがっこうです(saisho no gakkō ga watashitachi no gakkō desu)'),
  ('KO', '첫 번째 학교가 우리 학교입니다', '서수+명사+가+소유+명사+입니다. 확장 단문. cheot beonjjae hakgyoga uri hakgyoimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '첫 번째 학교가 우리 학교입니다' AND l.level_number = 9 AND sk.display_order = 4;

-- Level 10, Skill 1
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'What', 'Interrogative pronoun for things'),
  ('ES', 'Qué', 'Pronombre interrogativo para cosas'),
  ('ZH', '什么', 'shén me - 什么 (무엇)'),
  ('JA', '何', 'なに(nani) - 何 (무엇)'),
  ('KO', '무엇', '의문 대명사. 사물이나 일을 물을 때. mueot')
) AS v(lang, expr, hint)
WHERE s.meaning = '무엇' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Who', 'Interrogative pronoun for people'),
  ('ES', 'Quién', 'Pronombre interrogativo para personas'),
  ('ZH', '谁', 'shuí - 谁 (누구)'),
  ('JA', '誰', 'だれ(dare) - 誰 (누구)'),
  ('KO', '누구', '의문 대명사. 사람을 물을 때. nugu')
) AS v(lang, expr, hint)
WHERE s.meaning = '누구' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'What is this?', 'Informal question phrase'),
  ('ES', '¿Qué es esto?', 'Pregunta informal'),
  ('ZH', '这是什么？', 'zhè shì shén me - 这+是+什么？(이것+은+무엇?)'),
  ('JA', 'これは何？', 'これはなに(kore wa nani) - これ+は+何？'),
  ('KO', '이것은 무엇?', '비격식 의문문. 이것+은+무엇 패턴. igoseun mueot?')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 무엇?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Where is this?', 'Informal question about location'),
  ('ES', '¿Dónde es aquí?', 'Pregunta informal sobre ubicación'),
  ('ZH', '这里是哪里？', 'zhè lǐ shì nǎ lǐ - 这里+是+哪里？(여기+어디?)'),
  ('JA', 'ここはどこ？', 'ここはどこ(koko wa doko) - ここ+は+どこ？'),
  ('KO', '여기 어디?', '비격식 의문문. 장소를 물음. yeogi eodi?')
) AS v(lang, expr, hint)
WHERE s.meaning = '여기 어디?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'When do you go?', 'Question about time'),
  ('ES', '¿Cuándo vas?', 'Pregunta sobre tiempo'),
  ('ZH', '什么时候去？', 'shén me shí hou qù - 什么时候+去？(언제+가요?)'),
  ('JA', 'いつ行きますか？', 'いついきますか(itsu ikimasu ka) - いつ+行きます+か？'),
  ('KO', '언제 가요?', '의문사+동사+요 패턴. 해요체. eonje gayo?')
) AS v(lang, expr, hint)
WHERE s.meaning = '언제 가요?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'What is this?', 'Formal question sentence'),
  ('ES', '¿Qué es esto?', 'Pregunta formal'),
  ('ZH', '这是什么？', 'zhè shì shén me - 这+是+什么？(이것+은+무엇입니까?)'),
  ('JA', 'これは何ですか？', 'これはなんですか(kore wa nan desu ka)'),
  ('KO', '이것은 무엇입니까?', '격식체 의문문. +입니까? 패턴. igoseun mueosimnikka?')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 무엇입니까?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Where is the school?', 'Formal question about location'),
  ('ES', '¿Dónde está la escuela?', 'Pregunta formal sobre ubicación'),
  ('ZH', '学校在哪里？', 'xué xiào zài nǎ lǐ - 学校+在+哪里？'),
  ('JA', '学校はどこですか？', 'がっこうはどこですか(gakkō wa doko desu ka)'),
  ('KO', '학교는 어디입니까?', '명사+는+어디+입니까 패턴. hakgyoneun eodiimnikka?')
) AS v(lang, expr, hint)
WHERE s.meaning = '학교는 어디입니까?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Who is that person?', 'Formal question about identity'),
  ('ES', '¿Quién es esa persona?', 'Pregunta formal sobre identidad'),
  ('ZH', '那个人是谁？', 'nà ge rén shì shuí - 那个人+是+谁？'),
  ('JA', 'あの人は誰ですか？', 'あのひとはだれですか(ano hito wa dare desu ka)'),
  ('KO', '저 사람은 누구입니까?', '저+명사+은+누구+입니까 패턴. jeo sarameun nuguimnikka?')
) AS v(lang, expr, hint)
WHERE s.meaning = '저 사람은 누구입니까?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'How much is that?', 'Formal question about price'),
  ('ES', '¿Cuánto cuesta eso?', 'Pregunta formal sobre precio'),
  ('ZH', '那个多少钱？', 'nà ge duō shǎo qián - 那个+多少+钱？'),
  ('JA', 'それはいくらですか？', 'それはいくらですか(sore wa ikura desu ka)'),
  ('KO', '그것은 얼마입니까?', '명사+은+얼마+입니까 패턴. geugoseun eolmaimnikka?')
) AS v(lang, expr, hint)
WHERE s.meaning = '그것은 얼마입니까?' AND l.level_number = 10 AND sk.display_order = 1;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'What do you eat for dinner today?', 'Extended formal question'),
  ('ES', '¿Qué comes para cenar hoy?', 'Pregunta formal extendida'),
  ('ZH', '今天晚上吃什么？', 'jīn tiān wǎn shang chī shén me'),
  ('JA', '今日の夕食は何を食べますか？', 'きょうのゆうしょくはなにをたべますか(kyō no yūshoku wa nani o tabemasu ka)'),
  ('KO', '오늘 저녁에 무엇을 먹습니까?', '시간+에+의문사+을+동사+ㅂ니까 패턴. oneul jeonyeoge mueoseul meokseumnikka?')
) AS v(lang, expr, hint)
WHERE s.meaning = '오늘 저녁에 무엇을 먹습니까?' AND l.level_number = 10 AND sk.display_order = 1;

-- Level 10, Skill 2
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'And', 'Conjunction connecting words or sentences'),
  ('ES', 'Y', 'Conjunción que conecta palabras u oraciones'),
  ('ZH', '和 / 然后', 'hé / rán hòu - 和/然后 (그리고)'),
  ('JA', 'そして', 'そして(soshite) - そして (그리고)'),
  ('KO', '그리고', '접속사. 앞뒤 내용을 연결. geurigo')
) AS v(lang, expr, hint)
WHERE s.meaning = '그리고' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Very good', 'Phrase: adverb + adjective'),
  ('ES', 'Muy bueno', 'Frase: adverbio + adjetivo'),
  ('ZH', '非常好', 'fēi cháng hǎo - 非常+好 (매우+좋다)'),
  ('JA', 'とてもいい', 'とてもいい(totemo ii) - とても+いい (매우+좋다)'),
  ('KO', '매우 좋다', '부사+형용사 패턴. ''매우''는 정도 부사. maeu jota')
) AS v(lang, expr, hint)
WHERE s.meaning = '매우 좋다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Really delicious', 'Phrase: adverb + adjective'),
  ('ES', 'Realmente delicioso', 'Frase: adverbio + adjetivo'),
  ('ZH', '真的很好吃', 'zhēn de hěn hǎo chī - 真的+很+好吃 (정말+맛있다)'),
  ('JA', '本当においしい', 'ほんとうにおいしい(hontō ni oishii)'),
  ('KO', '정말 맛있다', '부사+형용사 패턴. ''정말''은 강조 부사. jeongmal masitda')
) AS v(lang, expr, hint)
WHERE s.meaning = '정말 맛있다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Very big', 'Phrase: adverb + adjective'),
  ('ES', 'Muy grande', 'Frase: adverbio + adjetivo'),
  ('ZH', '非常大', 'fēi cháng dà - 非常+大 (아주+크다)'),
  ('JA', 'とても大きい', 'とてもおおきい(totemo ōkii)'),
  ('KO', '아주 크다', '부사+형용사 패턴. ''아주''는 정도 부사. aju keuda')
) AS v(lang, expr, hint)
WHERE s.meaning = '아주 크다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The rice is very delicious', 'Subject + adverb + adjective sentence'),
  ('ES', 'El arroz es muy delicioso', 'Oración: sujeto + adverbio + adjetivo'),
  ('ZH', '饭非常好吃', 'fàn fēi cháng hǎo chī - 饭+非常+好吃'),
  ('JA', 'ご飯がとてもおいしいです', 'ごはんがとてもおいしいです(gohan ga totemo oishii desu)'),
  ('KO', '밥이 매우 맛있습니다', '명사+이+부사+형용사 패턴. babi maeu masitseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '밥이 매우 맛있습니다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The weather is really nice', 'Subject + adverb + adjective sentence'),
  ('ES', 'El clima es realmente bueno', 'Oración con adverbio'),
  ('ZH', '天气真的很好', 'tiān qì zhēn de hěn hǎo'),
  ('JA', '天気が本当にいいです', 'てんきがほんとうにいいです(tenki ga hontō ni ii desu)'),
  ('KO', '날씨가 정말 좋습니다', '명사+가+부사+형용사 패턴. nalssiga jeongmal jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '날씨가 정말 좋습니다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The house is very big', 'Subject + adverb + adjective sentence'),
  ('ES', 'La casa es muy grande', 'Oración con adverbio'),
  ('ZH', '家非常大', 'jiā fēi cháng dà - 家+非常+大'),
  ('JA', '家がとても大きいです', 'いえがとてもおおきいです(ie ga totemo ōkii desu)'),
  ('KO', '집이 아주 큽니다', '명사+이+부사+형용사 패턴. jibi aju keumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '집이 아주 큽니다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'The coffee is very hot', 'Subject + adverb + adjective sentence'),
  ('ES', 'El café está muy caliente', 'Oración con adverbio'),
  ('ZH', '咖啡非常热', 'kā fēi fēi cháng rè'),
  ('JA', 'コーヒーがとても熱いです', 'コーヒーがとてもあついです(kōhī ga totemo atsui desu)'),
  ('KO', '커피가 매우 뜨겁습니다', '명사+가+부사+형용사 패턴. keopiga maeu tteugeopseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '커피가 매우 뜨겁습니다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'She is a really good teacher', 'Extended sentence with adverb'),
  ('ES', 'Ella es una profesora realmente buena', 'Oración extendida con adverbio'),
  ('ZH', '她真的是一个好老师', 'tā zhēn de shì yí ge hǎo lǎo shī'),
  ('JA', '彼女は本当にいい先生です', 'かのじょはほんとうにいいせんせいです(kanojo wa hontō ni ii sensei desu)'),
  ('KO', '그녀는 정말 좋은 선생님입니다', '주어+부사+관형사형+명사+입니다. geunyeoneun jeongmal joeun seonsaengnimimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그녀는 정말 좋은 선생님입니다' AND l.level_number = 10 AND sk.display_order = 2;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is very good', 'Subject + adverb + adjective sentence'),
  ('ES', 'Esto es muy bueno', 'Oración con adverbio'),
  ('ZH', '这个非常好', 'zhè ge fēi cháng hǎo'),
  ('JA', 'これはとてもいいです', 'これはとてもいいです(kore wa totemo ii desu)'),
  ('KO', '이것은 아주 좋습니다', '이것+은+부사+형용사 패턴. igoseun aju jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 아주 좋습니다' AND l.level_number = 10 AND sk.display_order = 2;

-- Level 10, Skill 3
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That''s correct', 'Affirmation expression'),
  ('ES', 'Es correcto', 'Expresión de afirmación'),
  ('ZH', '对的', 'duì de - 对的 (맞다, 옳다)'),
  ('JA', 'そうです', 'そうです(sō desu) - そうです (맞습니다)'),
  ('KO', '맞습니다', '긍정 표현. 사실이 옳음을 확인. matseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '맞습니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Of course', 'Strong affirmation'),
  ('ES', 'Por supuesto', 'Afirmación fuerte'),
  ('ZH', '当然', 'dāng rán - 当然 (물론)'),
  ('JA', 'もちろん', 'もちろん(mochiron) - もちろん (물론)'),
  ('KO', '물론', '강한 긍정 부사. 당연하다는 뜻. mullon')
) AS v(lang, expr, hint)
WHERE s.meaning = '물론' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Yes, that''s fine', 'Agreement expression'),
  ('ES', 'Sí, está bien', 'Expresión de acuerdo'),
  ('ZH', '是的，很好', 'shì de, hěn hǎo - 是的+很好 (네+좋습니다)'),
  ('JA', 'はい、いいです', 'はい、いいです(hai, ii desu)'),
  ('KO', '네, 좋습니다', '긍정+동의 표현. ne, jotseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '네, 좋습니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'No, it''s okay', 'Polite refusal'),
  ('ES', 'No, está bien', 'Rechazo cortés'),
  ('ZH', '不，没关系', 'bù, méi guān xi - 不+没关系 (아니요+괜찮습니다)'),
  ('JA', 'いいえ、大丈夫です', 'いいえ、だいじょうぶです(iie, daijōbu desu)'),
  ('KO', '아니요, 괜찮습니다', '부정+거절 표현. 정중한 거절. aniyo, gwaenchanseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '아니요, 괜찮습니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Maybe tomorrow', 'Phrase: uncertainty + time'),
  ('ES', 'Quizás mañana', 'Frase: incertidumbre + tiempo'),
  ('ZH', '也许明天', 'yě xǔ míng tiān - 也许+明天 (아마도+내일)'),
  ('JA', 'たぶん明日', 'たぶんあした(tabun ashita) - たぶん+明日'),
  ('KO', '아마도 내일', '추측부사+시간 패턴. ''아마도''는 불확실한 추측. amado naeil')
) AS v(lang, expr, hint)
WHERE s.meaning = '아마도 내일' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'This is correct', 'Subject + adjective sentence'),
  ('ES', 'Esto es correcto', 'Oración: sujeto + adjetivo'),
  ('ZH', '这是对的', 'zhè shì duì de - 这+是+对的'),
  ('JA', 'これは正しいです', 'これはただしいです(kore wa tadashii desu)'),
  ('KO', '이것은 맞습니다', '이것+은+형용사 패턴. igoseun matseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '이것은 맞습니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That is not it', 'Negation sentence'),
  ('ES', 'Eso no es', 'Oración de negación'),
  ('ZH', '那不是', 'nà bú shì - 那+不是 (그것+아니다)'),
  ('JA', 'それは違います', 'それはちがいます(sore wa chigaimasu)'),
  ('KO', '그것은 아닙니다', '명사+은+아닙니다 패턴. 부정 서술. geugoseun animnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그것은 아닙니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'There is no water', 'Negation of existence'),
  ('ES', 'No hay agua', 'Negación de existencia'),
  ('ZH', '没有水', 'méi yǒu shuǐ - 没有+水 (없다+물)'),
  ('JA', '水はありません', 'みずはありません(mizu wa arimasen)'),
  ('KO', '물은 없습니다', '명사+은+없습니다 패턴. 부재 표현. mureun eopsseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '물은 없습니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'That is certain', 'Subject + adjective sentence'),
  ('ES', 'Eso es seguro', 'Oración: sujeto + adjetivo'),
  ('ZH', '那是确定的', 'nà shì què dìng de - 那+是+确定的'),
  ('JA', 'それは確かです', 'それはたしかです(sore wa tashika desu)'),
  ('KO', '그것은 확실합니다', '명사+은+형용사 패턴. geugoseun hwaksilhamnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '그것은 확실합니다' AND l.level_number = 10 AND sk.display_order = 3;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I don''t go to school today', 'Negative sentence with time'),
  ('ES', 'No voy a la escuela hoy', 'Oración negativa con tiempo'),
  ('ZH', '我今天不去学校', 'wǒ jīn tiān bú qù xué xiào'),
  ('JA', '私は今日学校に行きません', 'わたしはきょうがっこうにいきません(watashi wa kyō gakkō ni ikimasen)'),
  ('KO', '나는 오늘 학교에 가지 않습니다', '주어+시간+장소에+동사+지 않습니다 패턴. 부정문. naneun oneul hakgyoe gaji anseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 오늘 학교에 가지 않습니다' AND l.level_number = 10 AND sk.display_order = 3;

-- Level 10, Skill 4
INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Always', 'Frequency adverb meaning every time'),
  ('ES', 'Siempre', 'Adverbio de frecuencia que significa cada vez'),
  ('ZH', '总是', 'zǒng shì - 总是 (항상)'),
  ('JA', 'いつも', 'いつも(itsumo) - いつも (항상)'),
  ('KO', '항상', '빈도 부사. 언제나 늘. hangsang')
) AS v(lang, expr, hint)
WHERE s.meaning = '항상' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Just a little, please', 'Quantity request phrase'),
  ('ES', 'Solo un poco, por favor', 'Frase de solicitud de cantidad'),
  ('ZH', '请给我一点点', 'qǐng gěi wǒ yì diǎn diǎn - 请+给我+一点点'),
  ('JA', '少しだけください', 'すこしだけください(sukoshi dake kudasai)'),
  ('KO', '조금만 주세요', '양+만+주세요 패턴. ''만''은 한정 조사. jogeumman juseyo')
) AS v(lang, expr, hint)
WHERE s.meaning = '조금만 주세요' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'A lot of water', 'Phrase: noun + quantity'),
  ('ES', 'Mucha agua', 'Frase: sustantivo + cantidad'),
  ('ZH', '很多水', 'hěn duō shuǐ - 很多+水 (많이+물)'),
  ('JA', '水をたくさん', 'みずをたくさん(mizu o takusan) - 水+を+たくさん'),
  ('KO', '물 많이', '명사+양 부사 패턴. mul mani')
) AS v(lang, expr, hint)
WHERE s.meaning = '물 많이' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'Sometimes the park', 'Phrase: frequency + place'),
  ('ES', 'A veces el parque', 'Frase: frecuencia + lugar'),
  ('ZH', '偶尔去公园', 'ǒu ěr qù gōng yuán - 偶尔+公园 (가끔+공원)'),
  ('JA', '時々公園', 'ときどきこうえん(tokidoki kōen) - 時々+公園'),
  ('KO', '가끔 공원', '빈도부사+장소 패턴. gakkeum gongwon')
) AS v(lang, expr, hint)
WHERE s.meaning = '가끔 공원' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I always eat breakfast', 'Sentence with frequency adverb'),
  ('ES', 'Siempre desayuno', 'Oración con adverbio de frecuencia'),
  ('ZH', '我总是吃早餐', 'wǒ zǒng shì chī zǎo cān'),
  ('JA', '私はいつも朝食を食べます', 'わたしはいつもちょうしょくをたべます(watashi wa itsumo chōshoku o tabemasu)'),
  ('KO', '나는 항상 아침을 먹습니다', '주어+빈도부사+목적어+을+동사 패턴. naneun hangsang achimeul meokseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 항상 아침을 먹습니다' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I drink a lot of water', 'Sentence with quantity adverb'),
  ('ES', 'Bebo mucha agua', 'Oración con adverbio de cantidad'),
  ('ZH', '喝很多水', 'hē hěn duō shuǐ - 喝+很多+水'),
  ('JA', '水をたくさん飲みます', 'みずをたくさんのみます(mizu o takusan nomimasu)'),
  ('KO', '물을 많이 마십니다', '목적어+을+양부사+동사 패턴. mureul mani masimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '물을 많이 마십니다' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I sometimes watch movies', 'Sentence with frequency adverb'),
  ('ES', 'A veces veo películas', 'Oración con adverbio de frecuencia'),
  ('ZH', '偶尔看电影', 'ǒu ěr kàn diàn yǐng - 偶尔+看+电影'),
  ('JA', '時々映画を見ます', 'ときどきえいがをみます(tokidoki eiga o mimasu)'),
  ('KO', '가끔 영화를 봅니다', '빈도부사+목적어+를+동사 패턴. gakkeum yeonghwareul bomnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '가끔 영화를 봅니다' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I drink a little milk', 'Sentence with quantity adverb'),
  ('ES', 'Bebo un poco de leche', 'Oración con adverbio de cantidad'),
  ('ZH', '喝一点牛奶', 'hē yì diǎn niú nǎi - 喝+一点+牛奶'),
  ('JA', '牛乳を少し飲みます', 'ぎゅうにゅうをすこしのみます(gyūnyū o sukoshi nomimasu)'),
  ('KO', '우유를 조금 마십니다', '목적어+를+양부사+동사 패턴. uyureul jogeum masimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '우유를 조금 마십니다' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I often eat fruit', 'Sentence with frequency adverb'),
  ('ES', 'A menudo como fruta', 'Oración con adverbio de frecuencia'),
  ('ZH', '经常吃水果', 'jīng cháng chī shuǐ guǒ - 经常+吃+水果'),
  ('JA', 'よく果物を食べます', 'よくくだものをたべます(yoku kudamono o tabemasu)'),
  ('KO', '과일을 자주 먹습니다', '목적어+를+빈도부사+동사 패턴. gwaireul jaju meokseumnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '과일을 자주 먹습니다' AND l.level_number = 10 AND sk.display_order = 4;

INSERT INTO expressions (sentence_id, language_code, expression_text, hint)
SELECT s.id, v.lang, v.expr, v.hint
FROM sentences s
JOIN skills sk ON s.skill_id = sk.id
JOIN levels l ON sk.level_id = l.id
CROSS JOIN (VALUES
  ('EN', 'I drink milk every morning', 'Extended sentence with frequency and time'),
  ('ES', 'Bebo leche cada mañana', 'Oración extendida con frecuencia y tiempo'),
  ('ZH', '我每天早上喝牛奶', 'wǒ měi tiān zǎo shang hē niú nǎi'),
  ('JA', '私は毎朝牛乳を飲みます', 'わたしはまいあさぎゅうにゅうをのみます(watashi wa maiasa gyūnyū o nomimasu)'),
  ('KO', '나는 매일 아침에 우유를 마십니다', '주어+빈도+시간에+목적어+를+동사. 확장 단문. naneun maeil achime uyureul masimnida')
) AS v(lang, expr, hint)
WHERE s.meaning = '나는 매일 아침에 우유를 마십니다' AND l.level_number = 10 AND sk.display_order = 4;

COMMIT;