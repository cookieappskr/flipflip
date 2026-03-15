-- FlipFlip Sentence Data: Level 1-50
-- Total: 1600 sentences
-- Generated: 2026-03-15

BEGIN;

-- Skill ID 1
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '안녕하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '안녕히 가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '안녕히 계세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '감사합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '고맙습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '미안합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '죄송합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '네', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '아니요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 1), '실례합니다', '기본');

-- Skill ID 2
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '저', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '너', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '당신', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '그', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '그녀', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '그것', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '우리', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '그들', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 2), '여러분', '기본');

-- Skill ID 3
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '이것', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '그것', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '저것', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '여기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '거기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '저기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '이쪽', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '저쪽', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '이곳', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 3), '저곳', '기본');

-- Skill ID 4
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '좋다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '나쁘다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '행복하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '슬프다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '배고프다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '피곤하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '기쁘다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '화나다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '무섭다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 1 AND s.display_order = 4), '괜찮다', '기본');

-- Skill ID 5
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '하나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '둘', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '셋', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '넷', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '다섯', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '여섯', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '일곱', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '여덟', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '아홉', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 1), '열', '기본');

-- Skill ID 6
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '엄마', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '아빠', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '형', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '누나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '동생', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '할머니', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '할아버지', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '가족', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '부모님', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 2), '아이', '기본');

-- Skill ID 7
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '머리', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '눈', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '코', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '입', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '귀', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '손', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '발', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '팔', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '다리', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 3), '얼굴', '기본');

-- Skill ID 8
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '빨간색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '파란색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '노란색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '초록색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '하얀색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '검은색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '주황색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '보라색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '분홍색', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 2 AND s.display_order = 4), '갈색', '기본');

-- Skill ID 9
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '집', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '문', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '창문', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '탁자', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '의자', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '침대', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '부엌', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '화장실', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 1), '거울', '기본');

-- Skill ID 10
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '물', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '밥', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '빵', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '고기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '과일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '우유', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '달걀', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '채소', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '국', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 2), '차', '기본');

-- Skill ID 11
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '개', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '고양이', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '새', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '물고기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '소', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '말', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '돼지', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '닭', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '토끼', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 3), '쥐', '기본');

-- Skill ID 12
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '학교', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '가게', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '공원', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '병원', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '은행', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '역', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '식당', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '도서관', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '우체국', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 3 AND s.display_order = 4), '시장', '기본');

-- Skill ID 13
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '가다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '오다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '먹다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '마시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '자다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '보다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '학교에 가다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '물 마시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '밥 먹다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 1), '여기 오다', '기본');

-- Skill ID 14
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '이다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '있다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '없다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '좋아하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '싫어하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '원하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '물 있다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '집에 있다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '과일 좋아하다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 2), '밥 원하다', '기본');

-- Skill ID 15
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '크다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '작다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '많다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '적다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '길다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '짧다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '큰 집', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '작은 방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '긴 다리', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 3), '짧은 머리', '기본');

-- Skill ID 16
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '뜨겁다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '차갑다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '달다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '짜다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '밝다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '어둡다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '뜨거운 물', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '차가운 우유', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '밝은 방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 4 AND s.display_order = 4), '어두운 밤', '기본');

-- Skill ID 17
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '월요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '화요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '수요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '목요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '금요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '토요일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '좋은 아침', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '이번 주말', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '월요일에 학교', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 1), '금요일에 가게', '기본');

-- Skill ID 18
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '아침', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '오후', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '저녁', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '밤', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '오늘', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '내일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '오늘 아침', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '내일 저녁', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '어제 밤', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 2), '지금 여기', '기본');

-- Skill ID 19
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '맑다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '흐리다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '비', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '눈', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '바람', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '날씨', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '좋은 날씨', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '나쁜 날씨', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '오늘 비', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 3), '찬 바람', '기본');

-- Skill ID 20
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '봄', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '여름', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '가을', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '겨울', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '계절', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '1월', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '따뜻한 봄', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '더운 여름', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '추운 겨울', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 5 AND s.display_order = 4), '시원한 가을', '기본');

-- Skill ID 21
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '셔츠', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '바지', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '신발', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '하얀 셔츠', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '검은 바지', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '큰 신발', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '작은 모자', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '이것은 치마입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '신발이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 1), '셔츠가 큽니다', '기본');

-- Skill ID 22
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '전화기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '책', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '가방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '내 가방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '우산 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '큰 가방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '이쪽으로요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '이것은 책입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '열쇠가 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 2), '시계가 있습니다', '기본');

-- Skill ID 23
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '자동차', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '버스', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '자전거', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '큰 버스', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '작은 자동차', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '빠른 기차', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '택시 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '버스가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '자전거가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 3), '저것은 비행기입니다', '기본');

-- Skill ID 24
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '스물', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '서른', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '백', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '사과 다섯', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '달걀 열', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '물 하나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '얼마예요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '사과가 셋 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '의자가 넷 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 6 AND s.display_order = 4), '아이가 둘 있습니다', '기본');

-- Skill ID 25
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '사과', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '바나나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '포도', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '큰 수박', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '빨간 딸기', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '사과 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '과일 많다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '토마토가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '당근이 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 1), '이것은 감자입니다', '기본');

-- Skill ID 26
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '커피', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '주스', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '케이크', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '커피 한 잔', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '차 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '달콤한 쿠키', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '차가운 주스', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '커피가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '아이스크림이 달다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 2), '물 주세요', '기본');

-- Skill ID 27
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '점심', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '메뉴', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '숟가락', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '아침식사 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '젓가락 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '컵 하나', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '메뉴 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '밥이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '국이 뜨겁습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 3), '접시가 큽니다', '기본');

-- Skill ID 28
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '맛있다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '맵다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '싱겁다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '맛있는 밥', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '매운 국', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '달콤한 과일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '신선한 채소', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '고기가 맛있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '빵이 부드럽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 7 AND s.display_order = 4), '이것은 짭니다', '기본');

-- Skill ID 29
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '선생님', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '의사', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '좋은 선생님', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '우리 의사', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '학생 많다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '나는 학생입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '그녀는 간호사입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '아빠는 회사원입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '그는 요리사입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 1), '우리 엄마는 학교에서 선생님입니다', '기본');

-- Skill ID 30
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '수업', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '숙제', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '어려운 숙제', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '큰 교실', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '내 교과서', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '수업이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '시험이 어렵습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '칠판이 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '공부가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 2), '나는 오늘 학교에서 공부합니다', '기본');

-- Skill ID 31
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '사무실', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '큰 책상', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '내 컴퓨터', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '오늘 회의', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '전화가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '이메일을 읽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '일이 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '서류가 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '프린터가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 3), '그는 매일 아침 사무실에 갑니다', '기본');

-- Skill ID 32
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '음악', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '좋은 음악', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '재미있는 영화', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '내 사진', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '나는 운동을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '영화가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '요리가 재미있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '독서를 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '노래가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 8 AND s.display_order = 4), '나는 주말에 공원에서 운동합니다', '기본');

-- Skill ID 33
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '안에', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '옆에', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '탁자 위에', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '의자 아래에', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '문 앞에', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '책이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '가방은 여기 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '고양이가 밖에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '개가 집 안에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 1), '열쇠는 탁자 위에 있습니다', '기본');

-- Skill ID 34
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '왼쪽', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '오른쪽', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '이쪽으로 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '왼쪽에 문', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '저쪽으로요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '학교가 저기 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '공원은 오른쪽입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '가게가 왼쪽에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '직진하면 역입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 2), '병원은 학교 앞에 있습니다', '기본');

-- Skill ID 35
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '가깝다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '멀다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '넓은 공원', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '좁은 방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '가벼운 가방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '학교가 가깝습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '병원이 멉니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '이 방은 넓습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '가방이 가볍습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 3), '우리 집은 학교에서 가깝습니다', '기본');

-- Skill ID 36
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '처음', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '마지막', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '첫 번째 방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '다음 가게', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '두 번째 집', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '이것이 처음입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '저것이 마지막입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '다음은 여기입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '세 번째가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 9 AND s.display_order = 4), '첫 번째 학교가 우리 학교입니다', '기본');

-- Skill ID 37
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '무엇', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '누구', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '이것은 무엇?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '여기 어디?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '언제 가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '이것은 무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '학교는 어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '저 사람은 누구입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '그것은 얼마입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 1), '오늘 저녁에 무엇을 먹습니까?', '기본');

-- Skill ID 38
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '그리고', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '매우 좋다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '정말 맛있다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '아주 크다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '밥이 매우 맛있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '날씨가 정말 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '집이 아주 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '커피가 매우 뜨겁습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '그녀는 정말 좋은 선생님입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 2), '이것은 아주 좋습니다', '기본');

-- Skill ID 39
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '맞습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '물론', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '네, 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '아니요, 괜찮습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '아마도 내일', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '이것은 맞습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '그것은 아닙니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '물은 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '그것은 확실합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 3), '나는 오늘 학교에 가지 않습니다', '기본');

-- Skill ID 40
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '항상', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '조금만 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '물 많이', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '가끔 공원', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '나는 항상 아침을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '물을 많이 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '가끔 영화를 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '우유를 조금 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '과일을 자주 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 10 AND s.display_order = 4), '나는 매일 아침에 우유를 마십니다', '기본');

-- Skill ID 41
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '좋은 친구', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '저는 학생입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '오늘 날씨가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '그녀는 선생님입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '우리는 같은 학교 친구입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '이 식당은 항상 사람이 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '저는 대학생이고 동생은 고등학생입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 1), '이것은 어머니의 가방입니다', '기본');

-- Skill ID 42
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '매일 아침', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '저는 커피를 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '그는 학교에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '어머니가 음식을 만듭니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '저는 매일 아침에 학교에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '아버지는 매일 저녁에 집에 옵니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '저는 아침을 먹고 학교에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 2), '그녀는 매일 아침 공원에서 운동합니다', '기본');

-- Skill ID 43
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '내 가방', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '저는 가방이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '그는 자동차가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '이것은 제 책입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '우리 집에 고양이가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '그녀는 예쁜 가방이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '저는 좋은 친구가 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 3), '그는 책이 있고 연필도 있습니다', '기본');

-- Skill ID 44
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '여기 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '방에 책상이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '교실에 학생이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '이 근처에 좋은 식당이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '탁자 위에 책이 세 권 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '가방 안에 지갑과 열쇠가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '공원에 나무가 많고 꽃도 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 11 AND s.display_order = 4), '방에 침대와 책상이 있습니다', '기본');

-- Skill ID 45
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '아닙니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '저는 학생이 아닙니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '오늘 날씨가 춥지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '그녀는 오늘 집에 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '이 방은 크지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '그는 학생이 아니라 선생님입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '이 방은 크지 않지만 깨끗합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 1), '날씨가 춥지 않고 따뜻합니다', '기본');

-- Skill ID 46
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '안 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '저는 커피를 마시지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '그는 음악을 듣지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '저는 고기를 안 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '우리는 평일에 텔레비전을 보지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '그녀는 아침에 커피를 마시지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '저는 커피를 마시지 않고 차를 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 2), '저는 차를 운전하지 않고 버스를 탑니다', '기본');

-- Skill ID 47
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '안 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '이 음식은 맛없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '지금은 필요하지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '그는 절대 약속에 늦지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '교실에 아무도 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '지금은 아무것도 필요하지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '이 문제는 쉽지 않지만 재미있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 3), '그녀는 전혀 피곤하지 않습니다', '기본');

-- Skill ID 48
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '여기서 사진을 찍지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '큰 소리로 말하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '걱정하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '도서관에서 큰 소리로 말하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '건물 안에서 담배를 피우지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '음식을 남기지 말고 다 드세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 12 AND s.display_order = 4), '너무 걱정하지 말고 쉬세요', '기본');

-- Skill ID 49
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '학생입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '이것은 누구 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '오늘 날씨가 좋습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '그녀는 선생님입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '당신은 이 학교 학생입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '이 답이 정말 맞습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '이것은 당신의 책입니까, 제 책입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 1), '요즘 건강합니까?', '기본');

-- Skill ID 50
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '좋아합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '커피를 좋아합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '아침을 매일 먹습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '혼자 공부합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '그는 매일 아침 운동합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '이 식당에 자주 옵니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '커피를 좋아합니까, 차를 좋아합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 2), '보통 버스를 탑니까, 지하철을 탑니까?', '기본');

-- Skill ID 51
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '이것은 무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '저 사람은 누구입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '이 소리는 무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '당신의 이름은 무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '이 꽃은 무슨 색입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '점심에 무엇을 먹고 싶습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 3), '당신의 직업은 무엇입니까?', '기본');

-- Skill ID 52
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '화장실은 어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '회의는 언제입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '학교는 어디에 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '가장 가까운 역은 어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '당신의 생일은 몇 월 며칠입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '오후 수업은 몇 시에 시작합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 13 AND s.display_order = 4), '보통 점심은 몇 시에 먹습니까?', '기본');

-- Skill ID 53
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '만나서 반갑습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 학생입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 서울에 삽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '제 이름은 민수입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 스물다섯 살입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 음악을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 부모님과 함께 삽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 1), '저는 회사원이고 서울에서 일합니다', '기본');

-- Skill ID 54
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '잘 지내세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '네, 잘 지냅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '요즘 어떻게 지내세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '저는 괜찮습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '오랜만입니다, 반갑습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '좋은 아침입니다, 잘 주무셨습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '덕분에 잘 지내고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 2), '요즘 일이 많지만 괜찮습니다', '기본');

-- Skill ID 55
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '감사합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '정말 죄송합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '괜찮습니다, 걱정 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '아닙니다, 천만에요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '도와주셔서 감사합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '약속에 늦어서 죄송합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '실례합니다, 잠깐 지나가겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 3), '선물을 주셔서 정말 감사합니다', '기본');

-- Skill ID 56
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '안녕히 가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '또 만나요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '좋은 하루 되세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '조심히 가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '내일 같은 시간에 봐요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '좋은 주말 되세요, 푹 쉬세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '만나서 반가웠고 또 연락하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 14 AND s.display_order = 4), '그럼 잘 가요, 또 봐요', '기본');

-- Skill ID 57
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '커피 두 잔 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '사과가 세 개 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '물 한 병 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '빵 두 개를 샀습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '우리 집에 고양이가 두 마리 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '교실에 학생이 스무 명 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '회의실에 의자가 네 개 더 필요합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 1), '사과 세 개와 바나나 두 개를 샀습니다', '기본');

-- Skill ID 58
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '얼마입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '이 커피는 오천 원입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '이것은 얼마입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '이것은 비쌉니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '전부 합해서 얼마입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '이것보다 싼 것이 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '큰 것은 만 원이고 작은 것은 칠천 원입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 2), '좋은 물건이지만 너무 비쌉니다', '기본');

-- Skill ID 59
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '조금만 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '물을 더 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '이것이 더 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '이것이 더 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '이것보다 큰 것이 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '우유를 조금만 넣어 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '좀 더 천천히 말해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 3), '설탕은 적게 넣고 우유는 많이 넣어 주세요', '기본');

-- Skill ID 60
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '충분합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '시간이 부족합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '돈이 충분합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '물이 더 필요합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '이것으로 충분합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '음식이 더 필요하면 말해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '시간이 더 필요하지만 열심히 하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 15 AND s.display_order = 4), '의자가 부족하니까 몇 개 더 가져오세요', '기본');

-- Skill ID 61
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '지금 몇 시입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '지금 세 시입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '회의는 네 시에 시작합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '한 시 반에 약속이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '열두 시이니까 점심을 먹읍시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '아직 아홉 시이니까 천천히 하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '다섯 시 반이고 곧 퇴근 시간입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 1), '거의 여덟 시여서 서둘러야 합니다', '기본');

-- Skill ID 62
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '일곱 시에 일어납니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '아침을 먹고 출발합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '아홉 시에 학교에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '열두 시에 친구와 점심을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '다섯 시에 집에 옵니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '저녁을 먹고 산책합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '열 시에 책을 읽고 잠을 잡니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 2), '아침에 운동하고 저녁에 공부합니다', '기본');

-- Skill ID 63
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '항상 아침을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '저는 자주 운동합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '그는 가끔 공원에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '저는 매일 물을 많이 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '우리는 자주 공원에서 산책합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '그는 절대 늦지 않고 항상 일찍 옵니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '저는 보통 버스를 타지만 가끔 걸어갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 3), '그녀는 가끔 운동하지만 매일은 안 합니다', '기본');

-- Skill ID 64
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '한 시간 동안 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '삼십 분 동안 기다렸습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '두 시간 동안 공부하고 쉽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '한 시간 동안 운동하고 샤워합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '매일 세 시간 동안 한국어를 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '일주일 동안 쉬면서 책을 읽겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '삼십 분 동안 기다렸지만 오지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 16 AND s.display_order = 4), '이틀 동안 비가 와서 밖에 못 나갔습니다', '기본');

-- Skill ID 65
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '화장실이 어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '이층으로 가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '은행은 이 근처에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '직진하면 왼쪽에 보입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '출구는 저쪽에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '여기서 가까우니까 걸어서 가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '은행은 가깝지만 조금 걸어야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 1), '병원은 어디에 있고 걸어서 갈 수 있습니까?', '기본');

-- Skill ID 66
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '버스를 탑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '걸어서 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '저는 아침에 버스를 타고 학교에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '지하철이 버스보다 빠릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '가까우니까 걸어서 갑시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '멀면 비행기를 타야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '지하철이 버스보다 빠르고 편합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 2), '비가 오면 그는 택시를 탑니다', '기본');

-- Skill ID 67
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '얼마나 걸립니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '오 분 걸립니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '버스로 가면 얼마나 걸립니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '걸어서 가면 삼십 분 걸립니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '여기서 오 분이니까 금방 도착합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '학교까지 이십 분 걸리지만 멀지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '가까우니까 출발하면 금방 도착합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 3), '교통이 복잡하면 한 시간 걸립니다', '기본');

-- Skill ID 68
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '은행은 가게 옆에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '약국은 병원 근처에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '우체국은 은행과 학교 사이에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '식당은 이층에 있고 카페는 일층에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '서점은 공원 왼쪽에 있는 큰 건물입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '은행은 가게 옆에 있고 찾기 쉽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '공원이 학교 앞에 있어서 학생들이 자주 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 17 AND s.display_order = 4), '병원은 역 뒤에 있지만 걸어서 갈 수 있습니다', '기본');

-- Skill ID 69
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '저는 독서를 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '우리 가족은 여행을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '저는 과일을 좋아하고 특히 사과를 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '저는 음악을 좋아하고 매일 듣습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '그녀는 요리를 좋아해서 자주 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '저는 한국 음식을 좋아하고 직접 만듭니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '그는 축구를 좋아하지만 시간이 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 1), '저는 독서를 좋아해서 매일 한 시간씩 읽습니다', '기본');

-- Skill ID 70
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '저는 매운 음식을 싫어합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '그녀는 추운 날씨를 싫어합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '저는 시끄러운 곳을 싫어합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '그는 숙제를 싫어하지만 열심히 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '그녀는 추운 날씨를 싫어하고 여름을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '아침에 일찍 일어나는 것이 싫습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '저는 비 오는 날이 싫어서 집에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 2), '그는 매운 음식을 싫어하지만 짠 음식은 좋아합니다', '기본');

-- Skill ID 71
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '제 취미는 독서입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '저는 기타를 칩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '주말에 영화를 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '저는 매일 아침 운동합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '요리가 취미이고 주말마다 새 요리를 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '주말에 그림을 그리고 전시회도 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '게임을 자주 하지만 공부도 열심히 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 3), '사진 찍는 것을 좋아해서 여행할 때 많이 찍습니다', '기본');

-- Skill ID 72
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '저는 과학에 관심이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '그녀는 역사를 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '저는 음악에 관심이 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '그는 컴퓨터에 관심이 있고 열심히 배웁니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '저는 외국어를 배우고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '그녀는 역사를 좋아해서 책을 많이 읽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '그는 컴퓨터에 관심이 있어서 프로그래밍을 배웁니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 18 AND s.display_order = 4), '저는 동물을 좋아하지만 키울 수 없습니다', '기본');

-- Skill ID 73
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '오늘 날씨가 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '밖에 비가 옵니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '오늘 매우 덥고 습합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '바람이 많이 불고 하늘이 흐립니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '오늘 날씨가 맑고 기분이 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '날씨가 따뜻해서 공원에 사람이 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '하늘이 흐리지만 비는 안 올 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 1), '밖에 비가 오니까 우산을 가져가세요', '기본');

-- Skill ID 74
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '오늘 날씨가 어떻습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '밖이 춥습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '밖이 춥습니까, 따뜻합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '오늘 비가 오니까 우산 가져왔습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '밖이 추우니까 코트를 꼭 입으세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '밖에 바람이 많이 부니까 조심하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '오전에는 흐리지만 오후에 맑아질 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 2), '비가 올 것 같으면 우산이 필요합니다', '기본');

-- Skill ID 75
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '여름에 수영을 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '겨울에 스키를 탑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '봄에 꽃구경을 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '여름에 수영을 하고 바다에도 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '봄에 꽃구경을 가고 사진도 찍습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '가을에 등산을 하고 단풍을 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '가을 날씨를 좋아하고 하늘이 정말 맑습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 3), '봄이 오면 공원에서 운동하고 산책합니다', '기본');

-- Skill ID 76
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '오늘 많이 덥습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '오늘 기온이 높습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '오늘 기온이 이십오 도입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '내일은 오늘보다 더 따뜻합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '낮에는 덥지만 밤에는 시원합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '기온이 높아서 에어컨을 켜야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '날씨가 좋으니까 밖에서 운동합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 19 AND s.display_order = 4), '날씨가 점점 추워져서 따뜻하게 입으세요', '기본');

-- Skill ID 77
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '이것 좀 보여 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '운동화를 사고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '친구에게 줄 선물을 사고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '이것 말고 다른 색은 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '파란색 바지가 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '겨울 모자를 찾고 있는데 추천해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '운동화를 사고 싶은데 어디에 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 1), '검은색도 괜찮으니까 있으면 보여 주세요', '기본');

-- Skill ID 78
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '이것은 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '작은 사이즈로 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '이것보다 큰 사이즈가 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '빨간색으로 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '검은색과 흰색 둘 다 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '입어 봐도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '이것은 크니까 작은 사이즈로 바꿔 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 2), '이것은 너무 크고 저것은 너무 작습니다', '기본');

-- Skill ID 79
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '카드로 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '전부 얼마입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '영수증 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '카드로 결제하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '봉투에 넣어 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '카드로 결제하고 영수증도 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '현금으로 계산하면 할인이 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 3), '선물이니까 예쁘게 포장해 주세요', '기본');

-- Skill ID 80
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '교환할 수 있습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '환불을 원합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '영수증 여기 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '사이즈가 맞지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '이것은 처음부터 고장 나 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '사이즈가 안 맞아서 교환하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '마음에 안 들어서 환불을 원합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 20 AND s.display_order = 4), '교환은 가능하지만 환불은 안 됩니까?', '기본');

-- Skill ID 81
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '우리는 어제 피곤했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '나는 그때 학생이었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '어제 날씨가 맑고 따뜻했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '그 영화는 길었지만 재미있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '아침에는 추웠지만 오후에는 따뜻했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '날씨가 좋아서 기분이 좋았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '시험이 어려워서 힘들었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 1), '어제 생일이라서 행복했습니다', '기본');

-- Skill ID 82
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '숙제를 끝냈습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '어제 저녁에 요리했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '친구에게 전화하고 이야기했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '아침에 청소하고 빨래했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '음악을 들으면서 공부했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '시험이 있어서 열심히 공부했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '바람이 세서 창문을 닫았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 2), '방이 더러워서 청소했습니다', '기본');

-- Skill ID 83
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '어젯밤에 8시간 잤습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '그녀를 공원에서 만났습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '빵을 사고 우유도 샀습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '배가 고파서 점심을 일찍 먹었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '편지를 쓰고 우체국에 보냈습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '우유가 필요해서 가게에 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '목이 말라서 물을 많이 마셨습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 3), '운동한 후에 샤워했습니다', '기본');

-- Skill ID 84
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '이틀 전에 도착했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '작년에 일본에 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '오늘 아침에 빵을 먹고 커피를 마셨습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '지난주에 친구와 함께 영화를 봤습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '3일 전에 서점에서 책을 샀습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '어제 비가 와서 집에 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '지난 금요일에 파티에 가서 친구들을 만났습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 21 AND s.display_order = 4), '어제 오후에 도서관에서 공부했습니다', '기본');

-- Skill ID 85
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '커피를 마시지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '그 영화를 보지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '시간이 없어서 아침을 먹지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '피곤해서 숙제를 하지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '전화했지만 그녀는 집에 없었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '비가 와서 공원에 가지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '일찍 출발해서 늦지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 1), '날씨가 추워서 밖에 나가지 않았습니다', '기본');

-- Skill ID 86
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '그 책을 읽었습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '어젯밤에 잘 잤습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '누가 전화했습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '언제 도착했습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '어제 학교에 갔습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '점심을 먹었습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '시험은 어려웠습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 2), '어제 퇴근한 후에 어디에 갔습니까?', '기본');

-- Skill ID 87
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '어제 뭐 했어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '어제 저녁에 뭐 먹었어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '주말에 친구를 만나고 영화를 봤어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '여행은 힘들었지만 즐거웠어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '음식은 맛있었지만 가격이 비쌌어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '피곤해서 어제 일찍 잤어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '날씨가 좋아서 공원에서 산책했어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 3), '집에 올 때 마트에서 장을 봤어요', '기본');

-- Skill ID 88
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '비가 많이 왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '지갑을 택시에 놓고 내렸습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '버스가 늦어서 택시를 탔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '알람이 안 울려서 수업에 늦었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '길을 걷다가 친구를 만났습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '전화를 잃어버려서 연락할 수 없었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '열쇠를 집에 두고 와서 문을 못 열었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 22 AND s.display_order = 4), '갑자기 비가 와서 우산을 샀습니다', '기본');

-- Skill ID 89
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '이것을 보세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '이쪽으로 오세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '여기에 이름을 쓰고 서명하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '나가기 전에 문을 닫으세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '더우니까 창문을 여세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '들어오시면 여기 앉으세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '목이 마르면 물을 드세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 1), '손을 씻고 밥을 드세요', '기본');

-- Skill ID 90
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '만지지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '걱정하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '소리 지르지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '위험하니까 뛰지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '약속이 있으니까 늦지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '외출할 때 열쇠를 잊지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '음식을 남기지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 2), '수업 시간에 떠들지 마세요', '기본');

-- Skill ID 91
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '잠깐 쉽시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '커피 한 잔 합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '배가 고프니까 점심 먹읍시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '날씨가 좋으니까 같이 산책합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '비가 오니까 택시를 탑시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '시험이 있으니까 같이 공부합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '식사한 후에 산책합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 3), '시간이 있으면 같이 영화를 봅시다', '기본');

-- Skill ID 92
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '다시 한번 말씀해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '사진 좀 찍어주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '소금 좀 건네주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '추운데 문 좀 닫아주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '짐이 무거운데 도와주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '잘 모르겠는데 설명해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '길을 모르는데 알려주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 23 AND s.display_order = 4), '잘 못 들었는데 천천히 말씀해 주시겠어요?', '기본');

-- Skill ID 93
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '이것은 내 책입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '그의 차는 새것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '이것은 제 것이고 저것은 당신 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '내 전화기는 검은색이고 그의 것은 흰색입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '이 자리는 당신의 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '그것은 그들의 집이고 매우 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '우리의 선생님은 엄격하지만 친절합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 1), '그 가방은 그녀의 것입니다', '기본');

-- Skill ID 94
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '이것은 엄마의 가방입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '누구의 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '이것은 회사의 건물입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '이것은 내 것이 아니라 친구의 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '그것은 아빠의 차이고 나도 가끔 씁니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '동생의 장난감이 고장 나서 울었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '이 모자는 비슷한데 누구의 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 2), '이 책은 선생님의 것이니까 소중히 다루세요', '기본');

-- Skill ID 95
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 우산은 누구 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 자전거는 당신 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 열쇠는 당신 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 안경은 당신 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이것은 당신 것입니까, 아니면 그녀 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 신발은 큰데 누구 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 가방은 여기 있었는데 누구 것입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 3), '이 책은 같은 색인데 누구 것입니까?', '기본');

-- Skill ID 96
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '이 주차장은 직원 전용입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '이 컴퓨터는 사무실용입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '이 도구는 요리용입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '이 방은 학생용이고 저 방은 교수용입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '그녀는 마케팅 부서 소속이고 경험이 많습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '이 공간은 회의용이니까 조용히 해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '저는 작년에 이 팀에 들어왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 24 AND s.display_order = 4), '그는 우리 회사 소속이지만 다른 부서에서 일합니다', '기본');

-- Skill ID 97
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '그녀가 나보다 키가 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '이 책이 저 책보다 재미있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '이 도시가 저 도시보다 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '여름이 봄보다 더 덥습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '이것이 저것보다 크고 무겁습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '기차가 버스보다 빠르지만 더 비쌉니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '오늘이 어제보다 더 춥습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 1), '이 가방이 저것보다 무겁지만 더 튼튼합니다', '기본');

-- Skill ID 98
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '그녀가 더 유창하게 말합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '그녀는 나보다 더 조용히 말합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '나는 전보다 더 자주 운동합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '그는 나보다 빨리 뛰고 더 오래 달립니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '건강을 위해 이전보다 더 일찍 일어납니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '그가 늦게 오지만 일은 더 빨리 끝냅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '요즘 전보다 더 열심히 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 2), '그는 형보다 더 열심히 공부합니다', '기본');

-- Skill ID 99
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '이것은 내 것과 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '그는 형만큼 똑똑합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '오늘은 어제만큼 덥습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '그녀는 나만큼 빨리 달립니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '그녀는 어머니만큼 키가 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '이 식당은 저 식당만큼 좋고 가격도 비슷합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '커피가 차만큼 뜨거우니까 조심하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 3), '이 가방은 저것만큼 무겁지만 더 예쁩니다', '기본');

-- Skill ID 100
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '누가 더 나이가 많습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '어느 것이 더 큽니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '누가 더 빨리 달립니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '이 두 가지 중에서 어느 것이 더 좋습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '가격이 다른데 어느 것이 더 쌉니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '여름과 겨울 중 어느 계절을 더 좋아합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '둘 다 좋지만 어느 것이 더 편합니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 25 AND s.display_order = 4), '걸어서 가면 어느 길이 더 가깝습니까?', '기본');

-- Skill ID 101
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '이것이 가장 비싼 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '이 건물이 도시에서 가장 높습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '그가 반에서 가장 키가 큽니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '이것이 가장 크고 밝은 방입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '1월이 가장 추운 달이고 8월이 가장 더운 달입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '이것이 가장 쉬운 문제이지만 주의가 필요합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '성적이 좋아서 그녀가 가장 똑똑한 학생입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 1), '이것이 공원에서 가장 오래되고 큰 나무입니다', '기본');

-- Skill ID 102
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그가 팀에서 가장 열심히 일합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그녀가 가장 정확하게 대답합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그가 가장 조용히 움직입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그녀가 가장 늦게까지 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그가 반에서 가장 빨리 뛰고 항상 1등입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '연습을 많이 해서 그녀가 가장 유창하게 말합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '매일 일찍 와서 그녀가 가장 일찍 도착합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 2), '그가 가장 높이 점프하고 가장 멀리 던집니다', '기본');

-- Skill ID 103
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '이것은 가장 맛있는 케이크입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '세계에서 가장 긴 강입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '이것이 가장 편한 의자입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '맛있어서 이 식당이 마을에서 최고입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '가장 인기 있는 노래이고 모두 알고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '여러 가지를 비교했지만 이것이 최고의 선택입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '오늘이 올해 가장 더운 날이라서 에어컨을 켰습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 3), '안전 때문에 이것은 가장 중요한 규칙입니다', '기본');

-- Skill ID 104
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '가장 좋아하는 음식은 무엇입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '무엇을 제일 좋아하세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '가장 가고 싶은 나라는 어디입니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '날씨가 좋아서 여름을 가장 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '쉴 수 있어서 일요일을 가장 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '가장 좋아하는 색깔은 파란색이고 그다음은 초록색입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '단풍이 예뻐서 가을을 가장 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 26 AND s.display_order = 4), '재미있기 때문에 수학을 가장 좋아합니다', '기본');

-- Skill ID 105
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '피곤하지만 행복합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '비싸지만 품질이 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '작지만 아늑한 방입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '빵과 우유를 사고 집에 돌아왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '차를 마시겠어요, 아니면 커피를 드시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '그녀는 똑똑하고 친절합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '시간이 없으면 걸어가거나 버스를 타세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 1), '차와 커피를 좋아하지만 녹차를 더 자주 마십니다', '기본');

-- Skill ID 106
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '날씨가 좋아서 공원에서 산책했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '갑자기 비가 와서 택시를 탔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '배가 고파서 빵을 먹었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '열이 나서 학교에 가지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '아침을 못 먹어서 점심을 많이 먹었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '교통이 막혀서 회의에 늦었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '다음 주에 시험이 있기 때문에 열심히 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 2), '차가 고장 나서 버스를 타고 갔습니다', '기본');

-- Skill ID 107
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '집에 올 때 우유를 사 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '비가 올 때 보통 집에서 책을 읽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '공부하는 동안 조용히 해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '어렸을 때 할머니 댁에 자주 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '요리하는 동안 음악을 듣습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '공항에 도착하면 바로 전화하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '자는 동안 전화가 와서 못 받았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 3), '기다리는 동안 커피를 마시면서 책을 읽었습니다', '기본');

-- Skill ID 108
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '아침을 먹은 후에 출발합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '외출하기 전에 날씨를 확인합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '저녁 식사 후에 가족과 함께 산책합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '자기 전에 양치질을 하고 책을 읽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '수업 전에 교과서를 읽고 복습합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '일이 끝난 후에 친구를 만나서 저녁을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '점심을 먹기 전에 손을 씻습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 27 AND s.display_order = 4), '운동한 후에 샤워하고 물을 많이 마십니다', '기본');

-- Skill ID 109
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '기타를 칠 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '자전거를 탈 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '영어를 말할 수 있고 일본어도 조금 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '한국어를 읽을 수 있지만 쓰기는 어렵습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '수영할 수 있지만 깊은 곳은 못 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '연습을 안 해서 운전을 못합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '위가 약하기 때문에 매운 음식을 못 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 1), '그 상자가 너무 무거워서 들 수 없습니다', '기본');

-- Skill ID 110
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '그가 늦을지도 모릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '그녀가 이미 떠났을 수도 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '구름이 많아서 비가 올지도 모릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '빈자리가 있으면 여기 앉아도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '회의가 끝나면 들어가도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '기온이 떨어져서 내일 눈이 올 수도 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '상황에 따라 계획이 바뀔 수도 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 2), '준비가 되면 오늘 일찍 끝날 수도 있습니다', '기본');

-- Skill ID 111
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '피아노를 칠 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '요리를 할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '이것을 옮길 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '영어를 할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '수영할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '면허가 있으면 운전할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '도구가 있으면 이것을 고칠 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 3), '일이 끝나면 내일 올 수 있나요?', '기본');

-- Skill ID 112
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '화장실을 이용해도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '이 의자에 앉아도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '더운데 창문을 열어도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '이해가 안 되는데 질문해도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '필요하면 이것을 써도 됩니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '약속이 있어서 먼저 가도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '기념으로 사진을 찍어도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 28 AND s.display_order = 4), '급한 전화인데 여기서 전화해도 됩니까?', '기본');

-- Skill ID 113
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '규칙을 따라야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '시험이 있어서 공부해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '법이니까 안전벨트를 매야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '열이 나서 약을 먹어야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '회의가 있으니까 9시까지 출근해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '해외에 가려면 비자를 받아야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '마감이 있기 때문에 내일까지 끝내야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 1), '여행을 가기 전에 여권을 확인해야 합니다', '기본');

-- Skill ID 114
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '운동을 더 해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '피곤하면 쉬어야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '운동한 후에 물을 많이 마셔야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '건강을 위해 너무 많이 먹지 않는 게 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '비가 올 수 있으니까 우산을 가져가는 게 좋겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '증상이 심하면 의사에게 가 보는 게 좋겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '내일 일찍 일어나야 하니까 일찍 자는 게 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 2), '오래 앉아 있으면 건강에 안 좋으니까 운동하세요', '기본');

-- Skill ID 115
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '이것을 수리해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '마감일 전에 서류를 제출해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '냉장고가 비어서 우유를 사야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '보안을 위해 비밀번호를 바꿔야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '자리가 없으니까 예약을 해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '길이 미끄러우니까 조심할 필요가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '실력을 올리려면 더 많이 연습해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 3), '오래된 신발이 닳아서 새 신발을 사야 합니다', '기본');

-- Skill ID 116
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '넥타이를 매지 않아도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '시간이 충분하니까 서두를 필요 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '휴일이라서 오늘 출근하지 않아도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '다 잘 될 테니까 걱정할 필요 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '준비가 되었으니까 기다릴 필요 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '약속을 했으니까 늦으면 안 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '건강에 해로우니까 여기서 흡연하면 안 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 29 AND s.display_order = 4), '위험하기 때문에 여기서 뛰면 안 됩니다', '기본');

-- Skill ID 117
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '세수하고 옷을 입습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '머리를 빗고 가방을 챙깁니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '일어나면 먼저 세수하고 양치질을 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '샤워한 후에 옷을 입고 아침을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '7시에 알람이 울리면 바로 일어납니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '아침마다 커피를 마시면서 뉴스를 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '출발하기 전에 날씨를 확인하고 옷을 고릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 1), '준비를 마친 후에 8시에 집을 나섭니다', '기본');

-- Skill ID 118
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '쉬는 시간에 커피를 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '점심은 12시에 동료들과 함께 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '오전에 이메일을 확인하고 오후에 회의를 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '수업은 3시에 끝나고 그 후에 동아리 활동을 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '보통 9시에 출근해서 먼저 이메일을 확인합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '오후에 회의가 있어서 자료를 미리 준비합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '매일 수업이 끝난 후에 숙제를 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 2), '보통 6시에 퇴근하지만 바쁘면 더 늦게 갑니다', '기본');

-- Skill ID 119
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '밤에 가족과 하루 이야기를 나눕니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '자기 전에 30분 동안 책을 읽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '저녁을 먹고 설거지를 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '퇴근 후에 헬스장에 가서 운동을 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '저녁 식사를 한 후에 가족과 TV를 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '피곤하면 일찍 자지만 보통 11시에 잡니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '잠자리에 들기 전에 샤워하고 양치질합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 3), '저녁에 음악을 들으면서 차를 마시며 쉽니다', '기본');

-- Skill ID 120
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '주말에 장을 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '일요일 아침에 청소하고 빨래를 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '토요일에는 늦잠을 자고 천천히 아침을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '주말에 친구들을 만나서 카페에 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '토요일 오후에 영화를 보고 저녁을 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '날씨가 좋으면 일요일에 공원에서 산책합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '주말에는 부모님을 방문해서 같이 식사합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 30 AND s.display_order = 4), '비가 오면 집에서 쉬지만 맑으면 밖에 나갑니다', '기본');

-- Skill ID 121
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '내일은 아침부터 저녁까지 바쁠 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '일이 끝나고 저녁을 요리할 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '시간이 있으면 오후에 운동하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '날씨가 좋으면 공원에서 산책하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '비가 오면 집에서 영화를 볼 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '회의가 끝나면 바로 출발하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 1), '내일 비가 오면 집에서 쉬고 싶지만 일이 있어서 나가야 합니다', '기본');

-- Skill ID 122
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '오늘은 늦게까지 일하지 않을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '약속을 했으니까 늦지 않겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '메모를 했기 때문에 잊지 않겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '준비가 다 되어서 오래 걸리지 않을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '날씨가 좋으니까 오늘은 비가 오지 않을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '비밀이니까 아무에게도 말하지 않겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 2), '실수를 배웠으니까 다시는 그렇게 하지 않겠습니다', '기본');

-- Skill ID 123
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '내일 오후에 시간이 되시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '커피를 드시겠어요, 아니면 차를 드시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '시간이 되면 같이 가시겠습니까?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '날씨가 좋으면 소풍에 오시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '춥지 않으면 창문을 열어도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '교통이 막히면 언제쯤 도착하실 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 3), '회의가 몇 시에 끝나는지 알고 계시면 알려주시겠어요?', '기본');

-- Skill ID 124
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '어떤 상황에서도 최선을 다하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '약속을 했으니까 꼭 지키겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '일이 끝나면 꼭 연락하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '어려운 상황이지만 끝까지 노력하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '목표를 이루기 위해서 열심히 공부하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '힘들더라도 절대 포기하지 않겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 31 AND s.display_order = 4), '실패하더라도 다시 도전하겠다고 마음먹었습니다', '기본');

-- Skill ID 125
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '다음 달에 휴가를 내고 여행을 갈 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '오늘 밤에 가족과 영화를 볼 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '졸업하면 해외로 유학을 갈 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '직장이 멀어서 회사 근처로 이사할 계획입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '돈을 모았으니까 새 차를 살 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '저녁에 오랜 친구를 만나서 식사할 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 1), '내년 봄에 결혼하고 신혼여행을 갈 예정이라서 준비가 바쁩니다', '기본');

-- Skill ID 126
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '퇴근 시간이라서 길이 막힐 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '구름이 많으니까 곧 비가 올 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '소식을 들으면 그가 놀랄 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '범위가 넓어서 시험이 어려울 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '이 선물을 받으면 그녀가 좋아할 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '버스가 안 오니까 약속에 늦을 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 2), '기온이 떨어졌으니까 눈이 올 것 같은데 따뜻하게 입으세요', '기본');

-- Skill ID 127
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '여름방학에 어디로 여행 갈 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '휴가 때 뭘 할 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '이번 주말 모임에 올 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '식당에 가면 뭘 먹을 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '짐을 다 싸면 언제 출발할 건가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '졸업 후에 어디서 살 건지 생각해 봤나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 3), '오늘 저녁에 누구를 만나서 뭘 할 건가요?', '기본');

-- Skill ID 128
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '무거워 보이니까 제가 들어드리겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '전화가 오니까 제가 받겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '약속했으니까 내일 도와드릴 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '버스가 안 오니까 택시를 타겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '미리 예약했기 때문에 택시를 탈 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '더우니까 창문을 열겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 32 AND s.display_order = 4), '이번 주말에 대청소를 하고 빨래도 할 예정이라서 바쁩니다', '기본');

-- Skill ID 129
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '약속 장소에서 친구를 기다리고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '이어폰을 끼고 음악을 들으며 걷고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '날씨가 좋아서 아이들이 공원에서 놀고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '아침에 일어나서 지금 커피를 마시고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '시험이 있어서 도서관에서 책을 읽고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '그녀는 손님이 오니까 저녁을 요리하고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 1), '카페에서 커피를 마시면서 친구와 이야기하고 있습니다', '기본');

-- Skill ID 130
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '배터리가 없어서 전화를 쓰고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '수업이 끝나서 그는 공부하고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '오늘은 쉬는 날이라서 지금 일하고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '하늘이 맑아서 비가 오고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '할 일을 끝내서 지금은 아무것도 하고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '아직 졸리지 않아서 자고 있지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 2), '시끄러워서 텔레비전을 보지 않고 음악을 듣고 있습니다', '기본');

-- Skill ID 131
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '지금 바쁜가요, 뭐 하고 있어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '방이 조용한데 아이들이 자고 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '창밖을 보니까 지금 비가 오고 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '그녀가 오고 있나요, 아니면 취소했나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '전화기를 들고 있는데 누구와 이야기하고 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '30분이 지났는데 아직 기다리고 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 3), '짐을 싸고 있는데 어디로 가는지 물어봐도 될까요?', '기본');

-- Skill ID 132
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '건강을 위해서 매일 아침을 꼭 먹습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '배가 고파서 지금 아침을 먹고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '환경을 위해서 보통 버스를 탑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '차가 고장 나서 지금 버스를 기다리고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '그는 대학을 졸업하고 은행에서 일합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '중요한 안건이 있어서 지금 회의하고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 33 AND s.display_order = 4), '승진하고 싶어서 매주 영어를 공부하지만 지금은 쉬고 있습니다', '기본');

-- Skill ID 133
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '어젯밤 8시에 공부하고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '해가 질 때 아이들은 밖에서 놀고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '전화가 왔을 때 소파에서 TV를 보고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '비가 오기 시작했을 때 공원에서 걷고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '그녀가 도착했을 때 부엌에서 저녁을 요리하고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '엄마가 전화했을 때 피곤해서 자고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 1), '버스를 기다리는 동안 이어폰으로 음악을 듣고 있었습니다', '기본');

-- Skill ID 134
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '충전 중이어서 전화를 쓰고 있지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '피곤해서 쉬고 있었고 아무것도 하지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '하늘이 맑았기 때문에 비가 오고 있지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '기분이 좋지 않아서 그녀는 웃고 있지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '휴가 중이었으니까 그때 일하고 있지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '다른 생각을 하고 있어서 주의를 기울이지 않았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 2), '밖에 나가 있었기 때문에 그 시간에 자고 있지 않았습니다', '기본');

-- Skill ID 135
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '어젯밤 8시에 집에서 뭐 하고 있었어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '어제 저녁에 도서관에서 공부하고 있었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '제가 전화했을 때 이미 자고 있었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '비가 올 때 우산 없이 밖에 있었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '제가 도착했을 때 누구와 이야기하고 있었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '약속 시간이 지났는데 어디서 기다리고 있었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 3), '사고가 났을 때 어디에 있었고 무엇을 하고 있었나요?', '기본');

-- Skill ID 136
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '집에 돌아와서 바로 저녁을 먹었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '운동을 하고 나서 샤워를 했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '친구가 왔을 때 저녁을 먹고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '전화가 울렸을 때 거실에서 책을 읽고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '잠들기 전에 침대에서 책을 읽었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '일이 끝나고 피곤해서 바로 집에 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 34 AND s.display_order = 4), '비가 내리기 시작했을 때 집에 가고 있었는데 우산이 없었습니다', '기본');

-- Skill ID 137
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '식사 후에 공원에서 산책하는 게 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '오늘은 요리하기 싫으니까 외식합시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '날씨가 좋으니까 영화 보러 가는 게 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '시간이 있으면 근처 카페에서 커피 한잔 할까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '시험이 다가오니까 같이 공부하는 게 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '짐이 많으니까 걷지 말고 택시를 타는 게 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 1), '많이 피곤해 보이는데 오늘은 일찍 쉬는 게 좋을 것 같아요', '기본');

-- Skill ID 138
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '이번 주말에 파티가 있는데 오시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '표가 두 장 있는데 콘서트에 같이 갈래요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '시간이 되시면 주말에 우리 집에 놀러 오세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '새 식당을 찾았는데 저녁 같이 하실래요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '맛있는 식당을 알고 있는데 같이 점심 드시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '다음 주에 생일파티가 있어서 초대하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 2), '날씨가 좋으면 이번 주말에 바비큐 파티를 하려고 하는데 오실래요?', '기본');

-- Skill ID 139
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '좋은 생각이에요, 그럽시다!', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '물론이죠, 시간과 장소를 알려주세요!', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '재미있을 것 같으니까 꼭 가겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '가고 싶지만 그날은 선약이 있어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '죄송하지만 그날은 일이 있어서 안 될 것 같아요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '이번에는 어렵지만 다음에 하면 안 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 3), '기꺼이 가겠는데 시간을 좀 확인하고 연락드리겠습니다', '기본');

-- Skill ID 140
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '이번 토요일 오후에 시간이 있으세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '점심 먹고 3시에 카페에서 만납시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '찾기 쉬우니까 역 앞 카페에서 만나요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '서로 편한 곳이 있으면 거기서 만날까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '오전이 좋으세요, 아니면 오후가 좋으세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '주말이 바쁘면 다음 주 월요일은 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 35 AND s.display_order = 4), '그때 뵙겠는데 혹시 변경이 있으면 미리 알려주세요', '기본');

-- Skill ID 141
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '오늘 저녁 7시에 4명으로 예약하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '어른 2명이고 아이는 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '7시에 예약이 있는데 자리를 확인해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '경치가 좋은 창가 자리로 부탁할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '예약 없이 왔는데 얼마나 기다려야 하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '김 씨 이름으로 예약을 했으니까 확인해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 1), '지금 바로 앉을 수 있는 자리가 없으면 밖에서 기다리겠습니다', '기본');

-- Skill ID 142
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '처음 왔는데 메뉴 좀 볼 수 있을까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '치킨을 주시고 음료는 물로 부탁합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '메뉴를 보고 결정했는데 파스타로 하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '고르기 어려운데 오늘의 추천 메뉴가 뭔가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '저도 맛있어 보이니까 같은 걸로 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '다 골랐으니까 주문할게요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 2), '음식이 나오기 전에 물 한 잔 먼저 주시면 감사하겠습니다', '기본');

-- Skill ID 143
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '소스를 따로 주시면 감사하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '양파를 못 먹으니까 빼고 만들어 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '매운 음식을 잘 못 먹는데 이거 매운가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '아이가 먹을 거라서 덜 맵게 해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '견과류 알레르기가 있어서 확인해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '고기를 안 먹는데 채식 메뉴가 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 3), '배가 많이 고프니까 큰 사이즈로 주시고 음료도 추가해 주세요', '기본');

-- Skill ID 144
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '식사를 다 했으니까 계산서 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '현금이 없는데 카드로 결제할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '각자 먹은 것만 따로 계산할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '음료 포함해서 전체 얼마인지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '경비 처리를 위해서 영수증을 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '오늘은 제가 초대했으니까 제가 내겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 36 AND s.display_order = 4), '서비스가 좋았으니까 잔돈은 안 받으셔도 됩니다', '기본');

-- Skill ID 145
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '여기서 가장 가까운 역이 어디인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '걸어서 가면 여기서 먼가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '약을 사야 하는데 가장 가까운 약국이 어디인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '버스를 타면 거기까지 얼마나 걸리나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '날씨가 좋은데 거기까지 걸어서 갈 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '처음 와 봐서 길을 잃었는데 도와주실 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 1), '지도를 보고 있는데 현재 위치가 어디인지 알려주시겠어요?', '기본');

-- Skill ID 146
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '5분 정도 이 길을 따라 쭉 가시면 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '큰 공원이 보이면 그 건너편에 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '횡단보도를 건너면 왼쪽에 보일 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '은행을 지나면 바로 옆에 보일 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '여기서 직진해서 첫 번째 사거리에서 오른쪽으로 도세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '다리를 건넌 후에 오른쪽으로 가시면 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 2), '이 길을 따라 가다가 사거리에서 왼쪽으로 돌면 바로 보입니다', '기본');

-- Skill ID 147
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '공항에 가려면 몇 번 버스를 타야 하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '시내로 가려면 여기서 어느 버스를 타야 하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '이 버스를 놓치면 다음 버스는 몇 시인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '직행이 없으면 어디서 환승해야 하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '처음 타는 노선인데 여기서 내려야 하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '돌아올 예정이 없으니까 편도 표 한 장 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 3), '공항에 가야 하는데 이 기차가 거기에 가는지 알려주세요', '기본');

-- Skill ID 148
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '호텔까지 가려면 대략 얼마 정도인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '이 주소로 가 주시고 빠른 길로 부탁합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '교통이 막히지 않으면 얼마나 걸리나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '저 건물 앞에 도착하면 여기서 세워 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '짐이 크니까 트렁크를 열어주실 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '약속에 늦어서 좀 더 빨리 가 주실 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 37 AND s.display_order = 4), '서비스가 좋았으니까 거스름돈은 안 받으셔도 됩니다', '기본');

-- Skill ID 149
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '잠시만 기다리시면 바로 바꿔드리겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '이 과장님과 통화하고 싶은데 바꿔 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '급한 일이 있는데 지금 통화할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '여보세요, 저는 김민수인데 담당자를 연결해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '실례지만 어디서 전화하신 건지 여쭤봐도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '죄송합니다, 여기는 다른 부서라서 잘못 거셨습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 1), '바쁘신데 전화 주셔서 감사하고 나중에 다시 연락드리겠습니다', '기본');

-- Skill ID 150
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '회의 중이라서 지금 자리에 안 계십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '자리에 안 계시면 메시지를 남겨도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '급한 건 아니니까 가능할 때 연락 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '확인하시면 가능한 빨리 다시 전화해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '김 과장이 전화했다고 꼭 전해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '연락 받으실 수 있도록 제 번호를 알려드리겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 2), '전화를 못 받으시면 문자를 보낼 테니까 확인해 주세요', '기본');

-- Skill ID 151
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '내일 회의 일정을 확인하려고 전화드렸습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '말씀하신 대로 3시로 확인되었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '지난번에 정한 내일 약속이 그대로 맞나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '다음 주 예약이 되어 있는지 확인하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '일정이 바뀌었다고 들었는데 시간이 변경되었나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '갑자기 일이 생겨서 일정을 변경해도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 3), '장소가 바뀌었다고 들었는데 어디로 가면 되는지 알려주세요', '기본');

-- Skill ID 152
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '오늘 말씀 감사하고 좋은 하루 되세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '지금은 바쁘니까 나중에 다시 얘기해요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '도움이 되어서 기쁘고 언제든 연락 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '확인되는 대로 곧 다시 연락드리겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '할 말을 다 했으니까 그럼 끊겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '궁금한 게 있으면 다음에 또 전화할게요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 38 AND s.display_order = 4), '도움이 필요하시면 언제든 전화해 주시고 좋은 하루 보내세요', '기본');

-- Skill ID 153
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '내일 여행을 가니까 정말 신납니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '시험에 합격해서 정말 기쁩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '기대하지 않았는데 정말 놀라운 소식이네요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '열심히 노력한 만큼 결과에 만족합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '오랫동안 원하던 것을 얻어서 정말 행복합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '날씨도 좋고 일도 잘 되어서 기분이 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 1), '이렇게 좋은 일이 생기다니 꿈만 같아서 아직 믿기 어렵습니다', '기본');

-- Skill ID 154
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '기회를 놓쳐서 많이 아쉽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '연락이 없어서 마음이 안 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '기대했던 것과 달라서 실망스럽습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '열심히 준비했는데 결과가 나빠서 속상합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '노력을 많이 했지만 기대한 만큼이 아니었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '믿고 있었는데 약속을 안 지켜서 속상합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 2), '좋은 사람이었는데 떠나서 슬프고 마음이 아프네요', '기본');

-- Skill ID 155
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '세상에, 이렇게 될 줄은 몰랐습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '그런 일이 일어나다니 믿을 수가 없어요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '아무도 알려주지 않아서 깜짝 놀랐습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '그 소식이 사실이라면 정말 놀라운데요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '그렇게 빨리 끝날 줄은 상상도 못했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '진짜요? 너무 놀라운데 농담이 아니죠?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 3), '이런 결과가 나올 줄은 전혀 예상하지 못해서 놀랐습니다', '기본');

-- Skill ID 156
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '연락이 없어서 많이 걱정되네요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '실력이 있으니까 괜찮을 거예요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '준비를 많이 못 해서 시험이 걱정됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '다 잘 될 테니까 걱정하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '요즘 피곤해 보여서 건강이 걱정됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '어려운 시기이지만 곧 나아질 거예요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 39 AND s.display_order = 4), '할 수 있는 만큼 했으니까 너무 걱정하지 말고 결과를 기다리세요', '기본');

-- Skill ID 157
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '어제부터 머리가 아프고 두통이 심합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '목이 아프고 음식을 삼키기 어렵습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '열이 나고 온몸이 아파서 움직이기 힘듭니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '아침에 일어났을 때부터 배가 아프기 시작했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '밤에 기침이 심해서 잠을 잘 수 없었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '갑자기 어지럽고 눈앞이 흐려졌습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 1), '약을 먹었지만 3일째 계속 아파서 다시 병원에 가야 합니다', '기본');

-- Skill ID 158
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '처음 방문인데 예약 없이 진료가 가능한가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '예약 없이 왔는데 오늘 진료가 가능한가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '증상이 나아지지 않아서 의사를 만나야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '급하게 아파서 가장 가까운 병원이 어디인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '외국인인데 여행자 보험이 적용되나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '다친 곳이 있어서 응급실이 어디인지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 2), '환자가 많아서 오래 기다려야 하는지 확인해 주시겠어요?', '기본');

-- Skill ID 159
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '식후에 30분 뒤에 하루 세 번 드세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '무리하지 말고 집에서 충분히 쉬세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '증상에 맞는 약을 처방할 테니 꼭 드세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '완전히 회복하려면 며칠 쉬어야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '열이 날 때는 물을 많이 마시는 것이 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '빈속에 먹으면 안 되니까 식후에 약을 드세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 3), '경과를 확인하기 위해 일주일 후에 다시 오시면 됩니다', '기본');

-- Skill ID 160
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '약을 먹고 나서 좀 나아졌어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '푹 쉬시고 빨리 나으시길 바랍니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '아직 다 낫지 않았으니까 무리하지 마세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '병원에 다녀오셨다고 들었는데 몸은 좀 어떠세요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '걱정되니까 오늘은 일찍 집에 가서 쉬세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '지난번에 아프다고 했는데 병원에는 다녀오셨어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 40 AND s.display_order = 4), '건강이 가장 중요하니까 좀 나아졌으면 좋겠습니다', '기본');

-- Skill ID 161
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '비행기를 타본 적이 있는데 처음에는 무서웠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '혼자 여행한 적이 있는데 좋은 경험이었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '외국에서 살아본 적이 있어서 문화 차이를 잘 압니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '어렸을 때 피아노를 배운 적이 있어서 조금 칠 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '일본에 가본 적이 있지만 중국에는 아직 못 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '호텔에서 일해본 적이 있어서 서비스업을 이해합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 1), '산에 올라간 적이 있는데 날씨가 좋지 않아서 힘들었습니다', '기본');

-- Skill ID 162
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '해외여행을 한 적이 없지만 내년에 갈 계획입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '직접 요리해 본 적이 없지만 도전해 보겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '눈을 본 적이 없어서 겨울에 꼭 보고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '말을 타본 적이 없어서 이번 기회에 배우고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '그 노래를 들어본 적이 없는데 인기가 많다고 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '그 책을 읽은 적이 없어서 무슨 내용인지 모릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 2), '콘서트에 간 적이 없는데 친구가 같이 가자고 해서 가 보려고 합니다', '기본');

-- Skill ID 163
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '운전면허를 따기 전에 운전해 본 적이 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '악기를 배워본 적이 있다면 무엇을 배우셨나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '겨울 스포츠를 해본 적이 있으면 추천해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '외국 친구를 사귄 적이 있다면 어떻게 만났나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '그 식당에서 먹어봤는데 혹시 어떤 메뉴가 맛있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '캠핑을 해본 적이 있으면 좋은 장소를 추천해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 3), '외국에서 살아본 적이 있으면 어느 나라가 좋았는지 알려주세요', '기본');

-- Skill ID 164
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '이것은 처음이라서 좀 긴장됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '올해 두 번 여행했지만 더 가고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '한 번도 가본 적이 없으니까 이번에 같이 갑시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '여러 번 시도해 봤는데 아직 성공하지 못했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '그 영화를 세 번이나 봤지만 볼 때마다 재미있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '거기에 두 번 갔는데 갈 때마다 새로운 곳을 발견합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 41 AND s.display_order = 4), '그 책을 두 번 읽었는데도 이해하기 어려운 부분이 있어서 다시 읽을 겁니다', '기본');

-- Skill ID 165
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '표를 예약했으니까 걱정하지 않아도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '문제를 해결했지만 다른 문제가 새로 생겼습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '숙제를 끝냈으니까 이제 밖에 나가도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '그가 이미 떠났기 때문에 만날 수 없었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '점심을 먹었는데 아직 배가 고픈 것 같습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '방 청소를 끝냈는데 생각보다 오래 걸렸습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 1), '이메일을 보냈으니까 답장이 올 때까지 다른 일을 하겠습니다', '기본');

-- Skill ID 166
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '아직 전화가 없어서 조금 걱정이 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '아직 점심을 먹지 않았는데 같이 먹을까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '아직 결정하지 못했는데 시간을 좀 더 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '그에게 아직 말하지 않았으니까 비밀로 해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '보고서를 아직 끝내지 못했지만 내일까지 제출하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '아직 답장을 받지 못해서 다시 연락해 볼 생각입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 2), '아직 그 영화를 보지 않았으니까 내용을 말하지 말아 주세요', '기본');

-- Skill ID 167
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '우편물이 왔는지 확인해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '숙제를 다 했으면 놀러 나가도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '빨래를 했으면 밖에 널어줄 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '비행기 표를 예약했으면 일정을 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '아침을 먹었는지 모르겠는데 같이 먹을래요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '그 소식을 들었나요, 아니면 제가 설명할까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 3), '방을 청소했으면 다른 일도 도와줄 수 있는지 물어봐도 될까요?', '기본');

-- Skill ID 168
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '방금 도착했는데 여기가 생각보다 넓습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '아직 준비가 안 됐으니까 10분만 기다려 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '벌써 다 먹었으면 디저트를 주문할까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '방금 전화를 끊었는데 중요한 소식이 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '이미 표를 샀기 때문에 환불이 안 될 수도 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '아직 안 먹었으니까 주문하기 전에 메뉴를 봅시다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 42 AND s.display_order = 4), '방금 일을 끝냈으니까 이제 쉬면서 저녁을 준비하겠습니다', '기본');

-- Skill ID 169
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '날씨가 좋으면 친구들과 공원에 가겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '열심히 공부하면 시험에 붙을 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '비가 오면 집에서 책을 읽으면서 쉬겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '시간이 있으면 운동도 하고 책도 읽겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '돈을 충분히 모으면 가족과 여행을 갈 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '일찍 일어나면 공원에서 산책한 후에 출근하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 1), '새 소식이 있으면 전화해서 바로 알려드리겠습니다', '기본');

-- Skill ID 170
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '약을 제때 먹지 않으면 병이 낫지 않을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '꾸준히 공부하지 않으면 시험에 떨어질 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '우산을 가져가지 않으면 비에 젖을 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '서두르지 않으면 버스를 놓쳐서 회의에 늦을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '지금 떠나지 않으면 교통이 막혀서 늦을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '미리 예약하지 않으면 주말에는 자리가 없을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 2), '물을 충분히 마시지 않으면 건강에 좋지 않으니까 자주 드세요', '기본');

-- Skill ID 171
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '비가 오면 실내에서 만나는 것이 어떨까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '버스가 안 오면 택시를 타는 게 나을까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '내일 시간이 되면 같이 점심을 먹을 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '시험에 떨어지면 다시 도전할 계획이 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '일찍 끝나면 같이 영화 보러 가는 것이 어때요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '문제가 생기면 누구에게 먼저 연락하는 것이 좋을까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 3), '그가 동의하지 않으면 다른 방법을 찾아야 하는 것 아닌가요?', '기본');

-- Skill ID 172
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '비가 오지 않으면 약속대로 공원에서 만나겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '매일 연습하지 않으면 실력이 늘지 않을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '직접 부탁하지 않으면 아무도 나서서 돕지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '꾸준히 노력하지 않으면 원하는 목표를 이룰 수 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '지금 서두르지 않으면 공항에서 비행기를 놓칩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '미리 예약하지 않으면 성수기에는 방이 없을 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 43 AND s.display_order = 4), '일찍 자지 않으면 아침에 피곤해서 하루 종일 집중이 안 됩니다', '기본');

-- Skill ID 173
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '이 도로는 매일 청소되지만 금방 더러워집니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '아침 식사는 7시부터 제공되니까 일찍 오세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '가게가 닫혀 있어서 내일 다시 와야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '이 책은 여러 나라에서 읽히는데 번역 수준이 높습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '이 건물에서는 영어가 주로 사용되지만 다른 언어도 가능합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '밤에는 문이 자동으로 잠기니까 열쇠를 챙기세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 1), '이 식당은 현지인에게 잘 알려져 있어서 항상 사람이 많습니다', '기본');

-- Skill ID 174
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '가방이 도난당해서 경찰에 신고했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '그 건물은 오래전에 지어졌지만 아직도 튼튼합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '창문이 깨져서 바람이 들어오고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '회의가 갑자기 취소되어서 다들 당황했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '편지가 어제 보내졌으니까 이번 주 안에 도착할 것입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '이 케이크는 유명한 제과점에서 만들어졌다고 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 2), '그 그림은 유명한 화가에 의해 그려진 것으로 알려져 있습니다', '기본');

-- Skill ID 175
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '문이 잠겼는데 열쇠가 어디 있는지 아시나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '저녁이 준비되었으면 식탁에 앉아도 될까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '이 제품이 어느 나라에서 만들어졌는지 아시나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '이 노래가 언제 녹음되었는지 알고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '초대장이 모두에게 보내졌는지 확인해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '이것이 기계로 만들어졌는지 손으로 만들어졌는지 궁금합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 3), '회의가 예정대로 진행되는지 아니면 변경되었는지 확인해 주세요', '기본');

-- Skill ID 176
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '이 다리는 매일 수천 명이 이용하고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '누군가 가방을 훔쳤지만 아직 범인을 찾지 못했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '가방이 도난당했는데 안에 중요한 서류가 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '그녀가 그 노래를 불렀을 때 모든 사람이 감동받았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '그 노래는 유명한 가수에 의해 불려서 큰 인기를 얻었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '사람들이 이 다리를 매일 건너지만 역사를 아는 사람은 적습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 44 AND s.display_order = 4), '셰프가 정성껏 음식을 준비했는데 손님들이 매우 만족했습니다', '기본');

-- Skill ID 177
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '독서를 즐기는데 특히 역사책을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '요리하는 것을 좋아하지만 설거지는 싫어합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '식사를 마친 후에 산책하는 것을 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '건강이 나빠져서 담배 피우는 것을 그만뒀습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '건강을 위해 매일 운동하는 것을 계속하고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '새로운 문화를 경험할 수 있어서 여행하는 것을 즐깁니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 1), '저녁에 산책하는 것을 좋아하는데 머리가 맑아지고 기분이 좋아집니다', '기본');

-- Skill ID 178
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '다음 달에 가족과 함께 여행하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '오래 고민한 끝에 회사를 그만두기로 결심했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '교통이 막힐 수 있으니까 일찍 출발하기로 했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '규칙적으로 운동해서 더 건강해지기를 바랍니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '시간이 있을 때마다 새로운 것을 배우고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '외국에서 일하기 위해 영어를 열심히 배우고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 2), '사람들을 돕고 싶어서 의사가 되기로 결심하고 열심히 공부합니다', '기본');

-- Skill ID 179
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '갑자기 비가 오기 시작해서 카페로 들어갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '수영하는 것을 좋아하지만 겨울에는 실내에서 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '나갈 때 문을 잠그는 것을 잊어서 걱정이 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '처음 만났던 날을 기억하는데 비가 오고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '노래하는 것을 좋아해서 매주 노래 교실에 다닙니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '내일 아침에 전화하는 것을 잊지 않도록 메모해 두세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 3), '일하는 것을 멈추고 잠깐 쉬었더니 오히려 집중이 잘 됩니다', '기본');

-- Skill ID 180
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '직접 요리하는 것은 재미있고 돈도 아낄 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '혼자 사는 것은 자유롭지만 가끔 외로울 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '새 언어를 배우는 것은 시간이 걸리지만 보람이 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '아침에 운동하는 것은 건강에 좋지만 일찍 일어나야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '여행하는 것은 즐겁지만 준비하는 데 시간이 많이 듭니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '규칙적으로 운동하는 것이 중요하다는 것을 잘 알고 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 45 AND s.display_order = 4), '외국어를 배우는 것은 새로운 세계를 여는 것과 같다고 생각합니다', '기본');

-- Skill ID 181
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '흥미로운 책을 발견해서 밤새 읽었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '지루한 영화였는데 친구는 재미있다고 했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '그 소식에 너무 놀라서 한동안 말을 못했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '그 이야기에 감동받아서 눈물이 났습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '수업이 너무 길어서 지루했지만 참고 끝까지 들었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '놀라운 결과가 나왔는데 모두 열심히 한 덕분입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 1), '실망스러운 경기였지만 선수들이 최선을 다한 것은 알고 있습니다', '기본');

-- Skill ID 182
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '선생님이 친절하게 설명해 주어서 잘 이해했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '아기가 자고 있어서 조심스럽게 문을 열었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '시험에 합격하기 위해 매일 열심히 공부합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '약속 시간에 늦을까 봐 빠르게 걷고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '옆에 사람이 자고 있으니까 조용히 이야기해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '영어를 유창하게 하는데 어떻게 배웠는지 궁금합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 2), '그녀가 아름답게 노래해서 관객 모두가 감동받고 박수를 쳤습니다', '기본');

-- Skill ID 183
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '정말 놀라운 소식이어서 믿기 어려웠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '방이 충분히 넓어서 가구를 더 놓을 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '꽤 비싸지만 품질이 좋아서 살 만한 가치가 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '매우 흥미로운 이야기여서 시간 가는 줄 몰랐습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '밖이 약간 추운 것 같으니까 겉옷을 가져가세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '거의 완벽하지만 한 가지만 더 고치면 좋겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 3), '밤새 일해서 극도로 피곤하지만 마감이 있어서 할 일이 남아 있습니다', '기본');

-- Skill ID 184
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '그는 성격이 좋아서 불평하는 일이 드뭅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '건강을 생각해서 패스트푸드를 거의 먹지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '건강을 유지하기 위해 거의 매일 운동합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '마감이 가까울 때는 가끔 늦게까지 일합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '그녀는 인내심이 강해서 좀처럼 화를 내지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '그는 해외 고객이 많아서 자주 출장을 갑니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 46 AND s.display_order = 4), '바쁜 생활 때문에 이따금 옛 친구를 만나는데 그때마다 반갑습니다', '기본');

-- Skill ID 185
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '집에 와서 손을 씻고 저녁을 준비했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '카페에 들어가서 커피를 주문하고 자리에 앉았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '가게에 가서 우유를 사고 집에 돌아와서 요리했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '샤워를 한 후에 책을 읽다가 잠자리에 들었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '공항에 도착해서 수속을 하고 출발 게이트로 이동했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '오랜만에 친구를 만나서 저녁을 먹고 이야기를 나눴습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 1), '책을 읽고 중요한 내용을 노트에 정리한 후에 복습까지 했습니다', '기본');

-- Skill ID 186
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '열심히 준비했지만 시험이 예상보다 어려웠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '방은 작지만 필요한 것이 다 있어서 편안합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '가고 싶었지만 너무 피곤해서 집에서 쉬기로 했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '몸이 피곤했지만 마감이 있어서 끝까지 일했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '비가 왔지만 우산을 가지고 나왔기 때문에 괜찮았습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '가격이 비싼 반면에 품질이 좋아서 오래 쓸 수 있습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 2), '배가 고팠지만 회의가 길어져서 먹을 시간이 없었습니다', '기본');

-- Skill ID 187
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '비가 올 것 같아서 우산을 가지고 나왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '날씨가 좋아서 밖에서 점심을 먹기로 했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '날씨가 추웠기 때문에 두꺼운 재킷을 입고 나갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '몸이 아팠기 때문에 회사에 연락하고 집에서 쉬었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '길이 막힐까 봐 일찍 출발했더니 제시간에 도착했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '아침을 못 먹어서 배가 고파서 근처 식당에 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 3), '하루 종일 일해서 피곤했기 때문에 일찍 자기로 했습니다', '기본');

-- Skill ID 188
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '커피를 마시거나 차를 마시거나 원하시는 대로 하세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '지금 바로 가거나 준비가 되면 나중에 가도 됩니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '급한 일이면 전화하거나 직접 찾아오시는 게 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '오늘은 집에 있거나 근처 공원에 가서 산책할 생각입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '택시를 타거나 지하철을 타면 30분 안에 도착합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '색상은 빨간색이나 파란색 중에서 마음에 드는 것을 고르세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 47 AND s.display_order = 4), '시간이 있으면 버스를 타거나 날씨가 좋으면 걸어가도 됩니다', '기본');

-- Skill ID 189
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '3월 20일부터 3박을 예약하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '갑자기 사정이 생겨서 예약을 취소하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '다음 주에 출장이 있어서 2박으로 방을 예약하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '혼자 여행하는데 조용한 싱글룸이 있는지 확인해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '가능하다면 바다가 보이는 높은 층 방으로 부탁합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '일정이 바뀌어서 예약 날짜를 변경할 수 있을까요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 1), '1박 요금이 얼마인지 알려주시면 예산에 맞춰서 결정하겠습니다', '기본');

-- Skill ID 190
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '여기 여권이 있고 예약 확인서도 준비했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '김씨 이름으로 예약했는데 체크인하고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '온라인으로 예약했는데 지금 체크인할 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '비행기가 오후에 있어서 늦은 체크아웃이 가능한가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '체크아웃 후에 짐을 몇 시간 맡아주실 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '체크아웃이 몇 시인지 알려주시면 일정을 맞추겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 2), '열쇠를 반납하면서 미니바 사용 요금도 같이 정산하겠습니다', '기본');

-- Skill ID 191
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '조식이 몇 시부터 몇 시까지인지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '차를 가지고 왔는데 호텔에 주차장이 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '숙박 요금에 조식이 포함되어 있는지 알고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '빨래할 것이 있는데 세탁 서비스가 가능한가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '객실에서 와이파이가 되는데 비밀번호를 알려주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '내일 아침에 공항에 가야 하는데 셔틀 서비스가 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 3), '수영장이 몇 시에 열리는지 그리고 수건이 비치되어 있는지 궁금합니다', '기본');

-- Skill ID 192
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '에어컨이 작동하지 않아서 방이 너무 덥습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '뜨거운 물이 나오지 않는데 확인해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '옆방이 너무 시끄러워서 잠을 잘 수가 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '와이파이가 연결되지 않아서 업무를 할 수 없습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '수건이 부족한데 깨끗한 수건을 더 가져다주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), '방이 너무 시끄러우니까 다른 방으로 바꿀 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 48 AND s.display_order = 4), 'TV가 작동하지 않는데 수리해 주시거나 다른 방으로 옮겨 주세요', '기본');

-- Skill ID 193
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '짐이 좀 무거운데 초과 수하물 요금이 얼마인가요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '탑승권과 여권을 준비했으니까 확인해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '경치를 보고 싶으니까 가능하면 창가 좌석으로 부탁합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '부칠 짐이 하나 있는데 무게 제한이 얼마인지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '탑승 시간이 다가오는데 탑승구가 어디인지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '다리를 뻗고 싶으니까 통로 좌석으로 바꿀 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 1), '처음 이용하는 공항이라서 수속 카운터가 어디인지 알려주시겠어요?', '기본');

-- Skill ID 194
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '관광 목적으로 왔고 일주일 정도 머물 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '신고할 물건은 없고 개인 소지품만 가지고 왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '여권과 비자를 준비했으니 확인해 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '일주일간 체류할 예정이며 호텔을 이미 예약했습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '출장으로 왔는데 회의가 끝나면 바로 돌아갈 예정입니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '이번 방문에서 얼마나 오래 체류하실 건지 말씀해 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 2), '시내 중심에 있는 호텔에 머물면서 관광할 계획이라서 기대됩니다', '기본');

-- Skill ID 195
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '목이 마른데 물이나 주스를 주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '기내가 좀 추운데 담요 하나 가져다주시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '도착 시간이 궁금한데 현지 시간으로 몇 시에 착륙하나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '착륙 준비를 하고 있으니까 안전벨트를 매 주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '오늘 기내식은 닭고기와 생선이 있는데 뭘로 하시겠어요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '착륙까지 얼마나 남았는지 알려주시면 감사하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 3), '처음 입국하는 건데 입국 신고서를 어떻게 작성하는지 알려주세요', '기본');

-- Skill ID 196
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '가방이 파손되어 있어서 보상을 받을 수 있나요?', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '환승 비행이라서 짐이 어디서 나오는지 알려주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '짐이 나오지 않아서 분실된 것 같은데 도와주세요', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '비행기에서 내렸는데 수하물 찾는 곳이 어디인지 모릅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '다른 사람의 짐은 다 나왔는데 제 짐만 아직 안 나왔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '짐을 잃어버렸기 때문에 분실물 신고서를 작성하겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 49 AND s.display_order = 4), '이것은 제 가방이 아닌데 비슷하게 생겨서 실수로 가져왔습니다', '기본');

-- Skill ID 197
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '장기적으로 보면 좋은 계획이라고 생각합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '시간이 부족하니까 이 방법이 더 효율적이라고 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '여러 가지를 고려하면 이것이 좋은 생각이라고 봅니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '제 생각에는 그가 옳지만 방법을 좀 바꿔야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '제 의견으로는 가격이 너무 비싸서 다시 검토해야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '실력을 키우기 위해서는 꾸준한 연습이 중요하다고 생각합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 1), '모든 사람에게 기회가 주어져야 하므로 이 방법은 공정하지 않다고 봅니다', '기본');

-- Skill ID 198
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '이해는 하지만 저는 그렇게 생각하지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '일리가 있지만 꼭 그렇다고는 생각하지 않습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '그 의견에 동의하며 저도 같은 생각을 하고 있었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '그 점은 맞지만 다른 측면도 고려해 봐야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '완전히 동의하는데 그 점을 더 강조했으면 좋겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '존중하지만 저는 다른 의견이라서 말씀드리고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 2), '좋은 지적인데 한 가지 더 추가하고 싶은 것이 있어서 말씀드립니다', '기본');

-- Skill ID 199
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '건강에 좋기 때문에 매일 운동하려고 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '아직 경험이 부족하기 때문에 더 배우고 싶습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '가격이 너무 비싸기 때문에 다른 곳을 알아봐야 합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '날씨가 갑자기 나빠져서 행사가 취소될 수밖에 없었습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '가격이 합리적이고 서비스도 좋기 때문에 추천합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '일이 늦게 끝나서 시간이 없었기 때문에 못 갔습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 3), '교통이 편리하고 주변에 식당이 많아서 이 호텔을 선택하게 되었습니다', '기본');

-- Skill ID 200
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '커피도 좋지만 건강을 위해 차를 더 자주 마십니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '요리하는 것도 좋지만 바쁠 때는 외식이 더 편합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '오늘은 피곤하니까 나가는 것보다 집에 있는 게 낫겠습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '비행기가 빠르지만 경치를 볼 수 있어서 기차를 더 좋아합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '자유롭게 일정을 정할 수 있어서 혼자 여행하는 것을 선호합니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '아침에 집중이 잘 되기 때문에 아침에 일하는 것이 더 좋습니다', '기본');
INSERT INTO sentences (skill_id, meaning, sentence_type) VALUES ((SELECT s.id FROM skills s JOIN levels l ON s.level_id = l.id WHERE l.level_number = 50 AND s.display_order = 4), '상상력을 자극하기 때문에 영화보다 책을 읽는 것을 더 선호합니다', '기본');

COMMIT;
