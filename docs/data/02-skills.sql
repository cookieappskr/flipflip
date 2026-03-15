-- FlipFlip Level & Skill Data
-- 100 Levels + 400 Skills
-- Generated: 2026-03-15

BEGIN;


-- ============================================
-- SKILLS (1-400)
-- ============================================

-- Level 1
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 1), '기본 인사 표현', '안녕하세요, 안녕히 가세요, 감사합니다, 미안합니다 등 일상에서 가장 먼저 사용하는 기초 인사말과 예의 표현을 단어 수준에서 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 1), '인칭대명사', '나, 너, 그, 그녀, 그것, 우리, 그들 등 사람과 사물을 가리키는 가장 기초적인 대명사를 학습합니다. 모든 문장의 주어가 되는 핵심 단어입니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 1), '기초 지시어', '이것, 저것, 여기, 저기 등 사물과 장소를 가리키는 지시 표현을 학습합니다. 눈앞의 대상을 지칭할 때 사용하는 기본 표현입니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 1), '기초 감정 단어', '좋다, 나쁘다, 행복하다, 슬프다, 배고프다, 피곤하다 등 기본적인 감정과 상태를 나타내는 형용사를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 2
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 2), '기초 숫자 (1-10)', '1부터 10까지의 기본 숫자를 학습합니다. 수량, 나이, 시간 등 모든 수 표현의 기초가 됩니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 2), '가족 호칭', '엄마, 아빠, 형/오빠, 누나/언니, 동생, 할머니, 할아버지 등 가족 구성원을 부르는 기초 호칭을 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 2), '기초 신체 부위', '머리, 눈, 코, 입, 귀, 손, 발 등 사람의 주요 신체 부위를 나타내는 단어를 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 2), '기본 색상', '빨강, 파랑, 노랑, 초록, 하양, 검정 등 기본 색상을 나타내는 단어를 학습합니다. 사물 묘사의 기초입니다.', 4, 'T-NA', 'SP-WORD');

-- Level 3
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 3), '집 관련 사물', '집, 문, 창문, 탁자, 의자, 침대 등 가정에서 매일 접하는 사물의 이름을 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 3), '기초 음식과 음료', '물, 밥, 빵, 고기, 과일, 우유 등 매일 먹고 마시는 기본 음식과 음료 단어를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 3), '기초 동물', '개, 고양이, 새, 물고기, 소, 말 등 일상에서 흔히 접하는 동물 이름을 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 3), '기초 장소', '학교, 가게, 공원, 병원, 은행, 역 등 일상생활에서 자주 방문하는 장소를 나타내는 단어를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 4
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 4), '기초 동작 동사', '가다, 오다, 먹다, 마시다, 자다, 보다, 듣다 등 일상에서 가장 많이 사용하는 동작을 나타내는 기본 동사를 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 4), '기초 상태 동사', '이다, 있다, 좋아하다, 원하다, 알다, 필요하다 등 상태나 감정을 나타내는 기본 동사를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 4), '기초 크기/양 형용사', '크다, 작다, 많다, 적다, 길다, 짧다, 높다, 낮다 등 크기와 양을 나타내는 기본 형용사를 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 4), '기초 감각 형용사', '뜨겁다, 차갑다, 달다, 짜다, 밝다, 어둡다 등 오감으로 느끼는 감각을 표현하는 형용사를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 5
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 5), '요일', '월요일부터 일요일까지 7개 요일의 이름을 학습합니다. 일정과 약속을 잡을 때 반드시 필요한 기초 표현입니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 5), '기초 시간 표현', '아침, 오후, 저녁, 밤, 오늘, 내일, 어제 등 시간대와 날짜를 나타내는 기본 단어를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 5), '날씨 표현', '맑다, 비가 오다, 흐리다, 눈이 오다, 바람이 불다 등 날씨 상태를 나타내는 기본 표현을 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 5), '계절과 월', '봄, 여름, 가을, 겨울 4계절과 1월~12월까지 월 이름을 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 6
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 6), '기초 의류', '셔츠, 바지, 신발, 모자, 치마, 양말 등 매일 입는 옷과 관련된 단어를 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 6), '일상 물건', '전화기, 책, 가방, 열쇠, 지갑, 안경 등 매일 사용하는 일상 물건의 이름을 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 6), '기초 교통수단', '자동차, 버스, 기차, 비행기, 자전거, 택시 등 주요 교통수단을 나타내는 단어를 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 6), '숫자 확장 (11-100)', '11부터 100까지의 숫자를 학습합니다. 가격, 나이, 주소 등 실생활에서 빈번히 사용되는 수 범위입니다.', 4, 'T-NA', 'SP-WORD');

-- Level 7
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 7), '과일과 채소', '사과, 바나나, 토마토, 당근, 양파 등 주요 과일과 채소의 이름을 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 7), '음료와 간식', '커피, 차, 주스, 케이크, 쿠키 등 음료와 간식 종류를 나타내는 단어를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 7), '식사 관련 단어', '아침식사, 점심, 저녁식사, 메뉴, 주문, 계산 등 식사 상황에서 사용하는 기본 단어를 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 7), '맛 표현', '맛있다, 맵다, 싱겁다, 신선하다, 달콤하다 등 음식의 맛을 묘사하는 표현을 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 8
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 8), '기초 직업', '선생님, 의사, 학생, 운전사, 요리사, 경찰관 등 흔히 접하는 직업을 나타내는 단어를 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 8), '학교 관련 단어', '수업, 숙제, 시험, 교과서, 교실, 선생님 등 학교생활에서 사용하는 기본 단어를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 8), '사무실 관련 단어', '사무실, 컴퓨터, 회의, 이메일, 전화, 일 등 직장에서 사용하는 기초 단어를 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 8), '기초 취미 단어', '음악, 운동, 영화, 여행, 요리, 독서, 게임 등 취미와 여가활동을 나타내는 단어를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 9
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 9), '위치 표현', '안에, 위에, 아래에, 옆에, 앞에, 뒤에 등 사물의 위치를 설명하는 전치사/조사 표현을 학습합니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 9), '방향 표현', '왼쪽, 오른쪽, 위, 아래, 직진, 돌다 등 방향과 이동을 나타내는 단어를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 9), '거리와 크기 표현', '가깝다, 멀다, 넓다, 좁다, 깊다, 얕다 등 거리와 공간의 크기를 나타내는 표현을 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 9), '순서 표현', '첫 번째, 두 번째, 마지막, 다음, 이전 등 순서와 차례를 나타내는 서수/순서 단어를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 10
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 10), '기초 의문사', '무엇, 누구, 어디, 언제, 왜, 어떻게 등 질문을 만드는 데 필수적인 의문사를 학습합니다. 모든 질문문의 기초입니다.', 1, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 10), '기초 접속사와 부사', '그리고, 하지만, 매우, 또한, 정말 등 문장을 연결하고 의미를 강조하는 기초 접속사와 부사를 학습합니다.', 2, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 10), '긍정/부정 표현', '네, 아니요, ~않다, 아마도, 물론 등 긍정과 부정을 나타내는 기본 표현을 학습합니다.', 3, 'T-NA', 'SP-WORD');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 10), '양과 빈도 표현', '항상, 가끔, 절대 ~않다, 많이, 조금 등 행동의 빈도와 양을 나타내는 부사를 학습합니다.', 4, 'T-NA', 'SP-WORD');

-- Level 11
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 11), 'be동사 현재 긍정문', '"나는 학생이다", "그녀는 행복하다"처럼 be동사를 사용하여 주어의 상태나 신분을 설명하는 가장 기본적인 문장 구조를 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 11), '일반동사 현재 긍정문', '"나는 아침을 먹는다", "그는 학교에 간다"처럼 일반동사를 사용한 현재 시제 기본 문장을 학습합니다. 3인칭 단수 변화도 포함합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 11), '소유 표현 기초', '"나는 책이 있다", "이것은 내 가방이다"처럼 소유를 나타내는 have동사와 소유격을 활용한 기본 문장을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 11), '존재 표현 기초', '"고양이가 있다", "책이 세 권 있다"처럼 사물의 존재를 나타내는 there is/are 구문과 동등 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 12
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 12), 'be동사 현재 부정문', '"나는 피곤하지 않다", "그는 여기 없다"처럼 be동사를 부정하는 문장을 학습합니다. 축약형 사용법도 포함합니다.', 1, 'T-PRES', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 12), '일반동사 현재 부정문', '"나는 커피를 좋아하지 않는다", "그녀는 고기를 먹지 않는다"처럼 do/does + not을 활용한 부정문을 학습합니다.', 2, 'T-PRES', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 12), '부정 형용사/부사 활용', '"좋지 않다", "모르겠다"처럼 부정어를 다양하게 활용하는 표현을 학습합니다. no, not, never의 차이도 다룹니다.', 3, 'T-PRES', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 12), '금지 표현', '"만지지 마세요", "금연입니다"처럼 금지와 제한을 나타내는 짧은 명령/금지 표현을 학습합니다.', 4, 'T-NA', 'SP-IMP');

-- Level 13
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 13), 'be동사 의문문', '"당신은 행복합니까?", "이것은 당신의 책입니까?"처럼 be동사를 주어 앞에 놓아 질문하는 기본 의문문을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 13), '일반동사 의문문', '"음악을 좋아합니까?", "그녀는 공부합니까?"처럼 do/does를 사용한 일반동사 의문문을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 13), 'what/who 의문문', '"이것은 무엇입니까?", "그녀는 누구입니까?"처럼 사물과 사람을 묻는 의문사 의문문을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 13), 'where/when 의문문', '"역은 어디입니까?", "회의는 언제입니까?"처럼 장소와 시간을 묻는 의문사 의문문을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 14
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 14), '자기소개', '"제 이름은 ~입니다", "저는 ~에서 왔습니다"처럼 이름, 출신, 직업 등을 소개하는 기본 자기소개 문장을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 14), '안부 인사 대화', '"어떻게 지내세요?", "잘 지냅니다"처럼 일상적인 안부를 주고받는 기본 인사 대화 표현을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 14), '감사와 사과 표현', '"정말 감사합니다", "죄송합니다", "괜찮습니다"처럼 감사와 사과, 그에 대한 응답 표현을 문장으로 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 14), '작별 인사', '"내일 봐요", "만나서 반가웠어요", "좋은 하루 되세요"처럼 작별과 재회 상황에서 사용하는 인사 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 15
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 15), '수량 표현', '"커피 두 잔 주세요", "사과 세 개 있어요"처럼 사물의 수량을 세고 표현하는 문장을 학습합니다. 수량 단위 표현도 포함합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 15), '가격 표현', '"이것은 얼마입니까?", "만 원입니다"처럼 물건의 가격을 묻고 답하는 기본 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 15), '비교 기초 (더/덜)', '"물 더 주세요", "설탕은 적게 넣어주세요"처럼 양의 많고 적음을 요청하는 기초 비교 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 15), '충분/부족 표현', '"충분합니다", "시간이 더 필요합니다"처럼 양의 충분함과 부족함을 나타내는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 16
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 16), '시각 말하기', '"3시입니다", "5시 반입니다"처럼 시계 시간을 읽고 말하는 문장을 학습합니다. 정각, 반, 분 표현을 다룹니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 16), '일과 표현', '"7시에 일어납니다", "11시에 잠자리에 듭니다"처럼 하루 일과를 시간과 함께 설명하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 16), '빈도 부사 활용문', '"항상 아침을 먹습니다", "가끔 운동합니다"처럼 행동의 빈도를 나타내는 부사를 문장에 활용하는 방법을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 16), '기간 표현', '"두 시간 동안", "3일 동안"처럼 시간의 길이와 기간을 나타내는 표현을 문장에서 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 17
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 17), '장소 묻기와 안내', '"화장실은 어디입니까?", "2층에 있습니다"처럼 장소의 위치를 묻고 안내하는 기본 대화 표현을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 17), '이동 수단 표현', '"버스로 학교에 갑니다", "걸어서 갑시다"처럼 교통수단과 이동 방법을 설명하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 17), '소요시간 표현', '"30분 걸립니다", "5분 거리입니다"처럼 목적지까지의 소요시간과 거리를 표현하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 17), '위치 설명 문장', '"은행은 우체국 옆에 있습니다"처럼 건물이나 장소의 상대적 위치를 설명하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 18
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 18), '좋아하는 것 표현', '"독서를 좋아합니다", "요리하는 것을 즐깁니다"처럼 자신이 좋아하는 활동이나 사물을 표현하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 18), '싫어하는 것 표현', '"기다리는 것을 싫어합니다", "소음이 싫습니다"처럼 싫어하거나 꺼리는 것을 표현하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 18), '취미 말하기', '"취미는 그림 그리기입니다", "기타를 칩니다"처럼 자신의 취미와 여가활동을 소개하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 18), '관심사 표현', '"과학에 관심이 있습니다", "역사를 좋아합니다"처럼 자신의 관심 분야를 표현하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 19
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 19), '날씨 묘사 문장', '"오늘 매우 덥습니다", "밖에 비가 옵니다"처럼 현재 날씨 상태를 문장으로 묘사하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 19), '날씨 관련 대화', '"우산 있으세요?", "내일 눈이 올 수도 있어요"처럼 날씨와 관련된 일상 대화 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 19), '계절 활동 표현', '"여름에 수영을 좋아합니다", "겨울에 스키를 탑니다"처럼 계절별 활동을 연결하여 표현하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 19), '기온 표현', '"30도입니다", "날씨가 좋습니다"처럼 기온과 전반적인 기후 상태를 표현하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 20
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 20), '물건 찾기', '"셔츠를 찾고 있습니다", "파란색으로 있나요?"처럼 가게에서 원하는 물건을 찾을 때 사용하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 20), '사이즈와 색상 선택', '"사이즈가 어떻게 되세요?", "빨간색으로 주세요"처럼 물건의 사이즈와 색상을 선택하는 대화 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 20), '결제 표현', '"카드로 결제하겠습니다", "영수증 주세요"처럼 물건을 구매하고 결제하는 상황의 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 20), '교환과 환불', '"이것을 교환할 수 있나요?", "환불을 원합니다"처럼 구매 후 교환이나 환불을 요청하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 21
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 21), 'be동사 과거형', '"어제 행복했습니다", "그들은 집에 있었습니다"처럼 be동사의 과거형(was/were)을 사용한 문장을 학습합니다.', 1, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 21), '규칙 동사 과거형', '"영어를 공부했습니다", "저녁을 요리했습니다"처럼 -ed를 붙이는 규칙 동사의 과거형 문장을 학습합니다.', 2, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 21), '불규칙 동사 과거형', '"가게에 갔습니다", "점심을 먹었습니다"처럼 불규칙하게 변하는 주요 동사의 과거형 문장을 학습합니다.', 3, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 21), '과거 시간 표현 활용', '"지난주에", "어제", "이틀 전에"처럼 과거를 나타내는 시간 표현을 문장에 적용하는 방법을 학습합니다.', 4, 'T-PAST', 'SP-SVO');

-- Level 22
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 22), '과거 부정문', '"거기에 가지 않았습니다", "행복하지 않았습니다"처럼 과거의 행동이나 상태를 부정하는 문장을 학습합니다.', 1, 'T-PAST', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 22), '과거 의문문', '"점심 먹었습니까?", "어디에 갔습니까?"처럼 과거의 행동이나 사건에 대해 질문하는 의문문을 학습합니다.', 2, 'T-PAST', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 22), '과거 경험 대화', '"어제 뭐 했어요?", "주말은 어땠어요?"처럼 과거 경험과 일에 대해 대화하는 표현을 학습합니다.', 3, 'T-PAST', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 22), '과거 사건 묘사', '"전화를 잃어버렸습니다", "버스가 늦었습니다"처럼 과거에 일어난 사건이나 상황을 묘사하는 문장을 학습합니다.', 4, 'T-PAST', 'SP-SVO');

-- Level 23
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 23), '긍정 명령문', '"앉으세요", "창문을 여세요"처럼 상대방에게 행동을 요구하는 긍정 명령문을 학습합니다. 공손한 표현도 포함합니다.', 1, 'T-NA', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 23), '부정 명령문', '"뛰지 마세요", "열쇠를 잊지 마세요"처럼 하지 말아야 할 행동을 지시하는 부정 명령문을 학습합니다.', 2, 'T-NA', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 23), '청유/제안 표현', '"같이 갑시다", "점심 먹읍시다"처럼 함께 하자는 제안이나 청유를 나타내는 문장을 학습합니다.', 3, 'T-NA', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 23), '정중한 요청', '"도와주실 수 있나요?", "소금 좀 건네주시겠어요?"처럼 공손하게 부탁하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 24
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 24), '소유격과 소유대명사', '"이것은 제 것입니다", "그 가방은 그녀의 것입니다"처럼 소유격과 소유대명사를 사용한 문장을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 24), '~의 것 표현', '"내 친구의 것입니다", "누구의 것입니까?"처럼 소유 관계를 나타내는 다양한 표현을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 24), '소유 관련 질문', '"이 책은 누구 것입니까?", "이것은 당신 것입니까?"처럼 소유를 확인하는 질문 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 24), '귀속 표현', '"팀의 일원입니다", "이 방은 학생용입니다"처럼 소속이나 용도를 나타내는 귀속 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 25
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 25), '형용사 비교급', '"이것이 저것보다 큽니다", "그녀가 나보다 키가 큽니다"처럼 두 대상을 형용사로 비교하는 기본 비교급 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 25), '부사 비교급', '"그는 나보다 빨리 뜁니다", "그녀가 더 유창하게 말합니다"처럼 행동의 정도를 비교하는 부사 비교급을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 25), '동등 비교', '"그녀는 어머니만큼 키가 큽니다", "이것은 내 것과 같습니다"처럼 두 대상이 같은 정도임을 나타내는 동등 비교를 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 25), '비교 의문문', '"어느 것이 더 좋습니까?", "누가 더 나이가 많습니까?"처럼 비교를 묻는 의문문을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 26
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 26), '형용사 최상급', '"이것이 가장 큰 방입니다", "그녀가 가장 똑똑한 학생입니다"처럼 셋 이상 중 최고를 나타내는 최상급 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 26), '부사 최상급', '"그가 반에서 가장 빨리 뜁니다"처럼 행동의 정도에서 최상을 나타내는 부사 최상급 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 26), '최상급 활용 표현', '"마을에서 최고의 식당", "가장 인기 있는 노래"처럼 최상급을 일상 대화에서 자연스럽게 활용하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 26), '선호와 최상급 결합', '"여름을 가장 좋아합니다", "무엇을 제일 좋아하세요?"처럼 선호 표현과 최상급을 결합한 문장을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 27
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 27), 'and/but/or 연결', '"차와 커피를 좋아합니다", "피곤하지만 행복합니다"처럼 대등 접속사로 두 문장을 연결하는 방법을 학습합니다.', 1, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 27), 'because/so 인과 연결', '"교통 때문에 늦었습니다", "비가 와서 택시를 탔습니다"처럼 원인과 결과를 연결하는 접속사 활용을 학습합니다.', 2, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 27), 'when/while 시간 연결', '"도착하면 전화하겠습니다", "자는 동안"처럼 시간 관계를 나타내는 접속사로 문장을 연결하는 방법을 학습합니다.', 3, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 27), 'before/after 순서 연결', '"점심 전에 운동합니다", "일이 끝난 후 쉽니다"처럼 행동의 순서를 나타내는 접속사 활용을 학습합니다.', 4, 'T-PRES', 'SP-COMP');

-- Level 28
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 28), 'can/can''t 능력 표현', '"수영할 수 있습니다", "운전을 못합니다"처럼 능력의 유무를 나타내는 can/can''t 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 28), 'may/might 가능성', '"들어가도 됩니까?", "비가 올지도 모릅니다"처럼 허가를 구하거나 가능성을 나타내는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 28), '능력 질문', '"영어를 할 수 있나요?", "피아노를 칠 수 있나요?"처럼 상대방의 능력을 묻는 의문문을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 28), '허가 요청', '"이것을 써도 됩니까?", "질문해도 될까요?"처럼 공손하게 허가를 구하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 29
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 29), 'must/have to 의무', '"안전벨트를 매야 합니다", "공부해야 합니다"처럼 반드시 해야 하는 의무를 나타내는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 29), 'should 권고', '"쉬어야 합니다", "너무 많이 먹지 않는 게 좋습니다"처럼 권고나 조언을 나타내는 should 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 29), 'need to 필요', '"우유를 사야 합니다", "조심할 필요가 있습니다"처럼 필요성을 나타내는 need to 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 29), '의무 부정 표현', '"기다릴 필요 없습니다", "늦으면 안 됩니다"처럼 의무의 부재나 금지를 나타내는 부정 표현을 학습합니다.', 4, 'T-PRES', 'SP-NEG');

-- Level 30
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 30), '아침 루틴 표현', '"일어나면 양치질을 합니다", "샤워 후 아침을 먹습니다"처럼 아침 일과를 순서대로 묘사하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 30), '직장/학교 루틴', '"보통 9시에 출근합니다", "수업은 3시에 끝납니다"처럼 직장이나 학교에서의 일과를 설명하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 30), '저녁 루틴 표현', '"저녁 식사 후 TV를 봅니다", "자기 전에 책을 읽습니다"처럼 퇴근 후 저녁 일과를 묘사하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 30), '주말 활동 표현', '"주말에는 부모님을 방문합니다", "일요일에 청소합니다"처럼 주말의 정기적 활동을 설명하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 31
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 31), 'will 긍정문', '"내일 전화하겠습니다", "곧 도착할 것입니다"처럼 미래의 행동이나 예측을 will로 표현하는 긍정문을 학습합니다.', 1, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 31), 'will 부정문', '"늦지 않을 것입니다", "오래 걸리지 않을 것입니다"처럼 미래 행동의 부정을 나타내는 will not 문장을 학습합니다.', 2, 'T-FUT', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 31), 'will 의문문', '"같이 가시겠습니까?", "언제 도착합니까?"처럼 미래의 행동이나 계획을 묻는 will 의문문을 학습합니다.', 3, 'T-FUT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 31), 'will 약속/의지 표현', '"최선을 다하겠습니다", "영원히 사랑할 것입니다"처럼 강한 의지나 약속을 나타내는 will 문장을 학습합니다.', 4, 'T-FUT', 'SP-SVO');

-- Level 32
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 32), 'be going to 계획', '"유학을 갈 예정입니다", "이사할 계획입니다"처럼 이미 결정된 계획이나 의도를 be going to로 표현하는 문장을 학습합니다.', 1, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 32), 'be going to 예측', '"비가 올 것 같습니다", "그가 화낼 것 같습니다"처럼 현재 증거에 기반한 예측을 be going to로 표현하는 문장을 학습합니다.', 2, 'T-FUT', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 32), 'be going to 의문문', '"올 건가요?", "뭘 할 건가요?"처럼 계획이나 의도를 묻는 be going to 의문문을 학습합니다.', 3, 'T-FUT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 32), 'will vs be going to', '"도와드리겠습니다(즉흥)" vs "도와드릴 예정입니다(계획)"처럼 will과 be going to의 뉘앙스 차이를 학습합니다.', 4, 'T-FUT', 'SP-SVO');

-- Level 33
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 33), '현재진행 긍정문', '"점심을 먹고 있습니다", "책을 읽고 있습니다"처럼 지금 진행 중인 행동을 나타내는 현재진행형 문장을 학습합니다.', 1, 'T-PCONT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 33), '현재진행 부정문', '"지금 일하고 있지 않습니다", "자고 있지 않습니다"처럼 현재 진행하지 않는 행동을 부정하는 문장을 학습합니다.', 2, 'T-PCONT', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 33), '현재진행 의문문', '"뭐 하고 있어요?", "그녀가 오고 있나요?"처럼 현재 진행 중인 행동을 묻는 의문문을 학습합니다.', 3, 'T-PCONT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 33), '현재형 vs 현재진행형', '"아침을 먹는다(습관)" vs "아침을 먹고 있다(지금)"처럼 현재형과 현재진행형의 의미 차이를 학습합니다.', 4, 'T-PCONT', 'SP-SVO');

-- Level 34
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 34), '과거진행 긍정문', '"전화 왔을 때 TV를 보고 있었습니다"처럼 과거 특정 시점에 진행 중이던 행동을 나타내는 문장을 학습합니다.', 1, 'T-PACONT', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 34), '과거진행 부정문', '"그 시간에 자고 있지 않았습니다"처럼 과거에 진행 중이지 않았던 행동을 부정하는 문장을 학습합니다.', 2, 'T-PACONT', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 34), '과거진행 의문문', '"8시에 뭐 하고 있었어요?"처럼 과거 특정 시점의 행동을 묻는 과거진행 의문문을 학습합니다.', 3, 'T-PACONT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 34), '과거 vs 과거진행 구분', '"먹었다(완료)" vs "먹고 있었다(진행 중)"처럼 과거형과 과거진행형의 의미 차이를 학습합니다.', 4, 'T-PACONT', 'SP-SVO');

-- Level 35
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 35), '제안 표현', '"영화 보러 가는 게 어때요?", "외식합시다"처럼 상대방에게 활동을 제안하는 다양한 표현을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 35), '초대 표현', '"파티에 오시겠어요?", "저녁 같이 하실래요?"처럼 모임이나 활동에 초대하는 공손한 표현을 학습합니다.', 2, 'T-FUT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 35), '수락과 거절', '"좋아요!", "죄송하지만 안 될 것 같아요"처럼 제안이나 초대에 수락하거나 정중히 거절하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 35), '약속 잡기', '"토요일에 시간 있으세요?", "3시에 만납시다"처럼 만남의 시간과 장소를 정하는 대화 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 36
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 36), '예약과 입장', '"예약이 있습니다", "2명이요"처럼 식당에 도착해서 자리를 안내받는 상황의 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 36), '음식 주문', '"파스타로 하겠습니다", "치킨을 주세요"처럼 메뉴를 보고 음식을 주문하는 표현을 학습합니다.', 2, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 36), '특별 요청', '"양파 빼주세요", "이거 매운가요?"처럼 음식에 대한 특별 요청이나 재료를 확인하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 36), '계산하기', '"계산서 주세요", "따로 계산할 수 있나요?"처럼 식사 후 계산하는 상황의 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 37
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 37), '길 묻기', '"역까지 어떻게 가나요?", "여기서 먼가요?"처럼 목적지까지의 길을 묻는 표현을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 37), '길 안내하기', '"직진해서 오른쪽으로 도세요", "공원 건너편에 있습니다"처럼 길을 안내하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 37), '대중교통 이용', '"시내로 가는 버스가 어느 건가요?", "어디서 환승하나요?"처럼 대중교통을 이용할 때 쓰는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 37), '택시 이용', '"이 주소로 가주세요", "얼마나 걸리나요?"처럼 택시를 이용할 때 필요한 표현을 학습합니다.', 4, 'T-PRES', 'SP-IMP');

-- Level 38
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 38), '전화 받기/걸기', '"여보세요, 저는 ~입니다", "~씨 좀 바꿔주세요"처럼 전화를 걸고 받는 기본 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 38), '메시지 남기기', '"메시지 남겨도 될까요?", "다시 전화해 주세요"처럼 부재 시 메시지를 남기는 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 38), '약속 확인 전화', '"회의를 확인하려고 전화했습니다"처럼 전화로 약속이나 일정을 확인하는 표현을 학습합니다.', 3, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 38), '통화 마무리', '"나중에 다시 얘기해요", "전화해 주셔서 감사합니다"처럼 통화를 마무리하는 예의 바른 표현을 학습합니다.', 4, 'T-FUT', 'SP-SVO');

-- Level 39
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 39), '기쁨/만족 표현', '"정말 행복합니다", "놀라운 소식이네요!"처럼 기쁨과 만족을 표현하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 39), '슬픔/실망 표현', '"그 일이 슬프네요", "실망스럽습니다"처럼 슬픔과 실망의 감정을 표현하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 39), '놀람 표현', '"정말요?", "믿을 수가 없어요!"처럼 놀라움과 경악을 나타내는 감탄 표현을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 39), '걱정 표현', '"시험이 걱정됩니다", "걱정하지 마세요"처럼 걱정과 염려를 표현하고 안심시키는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 40
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 40), '증상 설명', '"두통이 있습니다", "배가 아픕니다"처럼 몸의 불편한 증상을 의사에게 설명하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 40), '병원 방문', '"의사를 만나야 합니다", "예약이 필요한가요?"처럼 병원 방문과 진료를 위한 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 40), '처방과 조언', '"이 약을 드세요", "며칠 쉬어야 합니다"처럼 의료 처방과 건강 조언을 나타내는 표현을 학습합니다.', 3, 'T-PRES', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 40), '안부 묻기', '"좀 나아졌어요?", "빨리 나으세요"처럼 아픈 사람에게 안부를 묻고 위로하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 41
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 41), '현재완료 경험 긍정문', '"일본에 가본 적이 있습니다", "초밥을 먹어본 적이 있습니다"처럼 과거의 경험을 현재완료로 표현하는 문장을 학습합니다.', 1, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 41), '현재완료 경험 부정문', '"눈을 본 적이 없습니다", "해외여행을 한 적이 없습니다"처럼 경험의 부재를 나타내는 현재완료 부정문을 학습합니다.', 2, 'T-PPERF', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 41), '현재완료 경험 의문문', '"파리에 가본 적 있나요?", "운전해 본 적 있나요?"처럼 상대방의 경험을 묻는 현재완료 의문문을 학습합니다.', 3, 'T-PPERF', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 41), '횟수 표현', '"거기에 두 번 갔습니다", "처음입니다"처럼 경험의 횟수를 나타내는 표현을 현재완료와 함께 학습합니다.', 4, 'T-PPERF', 'SP-SVO');

-- Level 42
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 42), '현재완료 완료 표현', '"숙제를 끝냈습니다", "이미 떠났습니다"처럼 행동의 완료와 그 결과를 나타내는 현재완료 문장을 학습합니다.', 1, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 42), '현재완료 미완료 표현', '"아직 먹지 않았습니다", "아직 전화가 없었습니다"처럼 아직 완료되지 않은 상태를 나타내는 문장을 학습합니다.', 2, 'T-PPERF', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 42), '현재완료 완료 의문문', '"빨래 했어요?", "우편물이 왔나요?"처럼 완료 여부를 묻는 현재완료 의문문을 학습합니다.', 3, 'T-PPERF', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 42), 'just/already/yet 활용', '"방금 도착했습니다", "벌써 먹었어요?", "아직 안 먹었어요"처럼 just, already, yet을 현재완료와 함께 사용하는 방법을 학습합니다.', 4, 'T-PPERF', 'SP-SVO');

-- Level 43
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 43), '1형 조건문 기본', '"비가 오면 집에 있겠습니다"처럼 현실적으로 가능한 미래 조건과 결과를 나타내는 1형 조건문을 학습합니다.', 1, 'T-PRES', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 43), '1형 조건문 부정', '"서두르지 않으면 버스를 놓칩니다"처럼 부정 조건을 포함한 1형 조건문을 학습합니다.', 2, 'T-PRES', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 43), '1형 조건문 의문', '"떨어지면 어떻게 하실 건가요?"처럼 조건부 상황에 대해 질문하는 표현을 학습합니다.', 3, 'T-FUT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 43), 'unless 조건', '"비가 오지 않으면 갈 것입니다", "부탁하지 않으면 아무도 돕지 않습니다"처럼 unless를 활용한 조건문을 학습합니다.', 4, 'T-PRES', 'SP-COND');

-- Level 44
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 44), '현재 수동태', '"여기서 영어가 사용됩니다", "가게가 닫혀 있습니다"처럼 현재 시제의 수동태 문장을 학습합니다.', 1, 'T-PRES', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 44), '과거 수동태', '"창문이 깨졌습니다", "케이크가 엄마에 의해 만들어졌습니다"처럼 과거 시제의 수동태 문장을 학습합니다.', 2, 'T-PAST', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 44), '수동태 의문문', '"한국에서 만들어졌나요?", "저녁이 준비되었나요?"처럼 수동태 의문문을 학습합니다.', 3, 'T-PAST', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 44), '능동태 vs 수동태', '"누군가 가방을 훔쳤다" → "가방이 도난당했다"처럼 능동태와 수동태 간의 전환을 학습합니다.', 4, 'T-PAST', 'SP-PASS');

-- Level 45
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 45), '동명사 목적어', '"독서를 즐깁니다", "식사를 마쳤습니다"처럼 동사 뒤에 동명사(-ing)를 목적어로 쓰는 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 45), 'to부정사 목적어', '"여행하고 싶습니다", "그만두기로 결심했습니다"처럼 동사 뒤에 to부정사를 목적어로 쓰는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 45), '동명사 vs to부정사', '"수영하는 것을 좋아합니다" 두 가지 표현 방식의 의미 차이와 호환성을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 45), '동명사 주어', '"언어를 배우는 것은 시간이 걸립니다"처럼 동명사가 문장의 주어로 쓰이는 구문을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 46
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 46), '감정 형용사 (-ed/-ing)', '"지루합니다" vs "지루한 영화"처럼 감정을 느끼는 사람(-ed)과 감정을 유발하는 것(-ing)의 차이를 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 46), '부사의 위치와 용법', '"유창하게 영어를 합니다", "조심스럽게 열었습니다"처럼 부사의 올바른 위치와 다양한 활용법을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 46), '정도 부사', '"꽤 비쌉니다", "극도로 재능이 있습니다"처럼 형용사/부사의 정도를 강조하는 정도 부사를 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 46), '빈도부사 심화', '"패스트푸드를 거의 먹지 않습니다", "불평하는 일이 드뭅니다"처럼 세밀한 빈도를 나타내는 부사를 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 47
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 47), '대등 접속 심화', '"가게에 가서 우유를 샀습니다"처럼 연속된 행동을 대등하게 연결하는 복합문을 학습합니다.', 1, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 47), '대조 접속 심화', '"가고 싶었지만 너무 피곤했습니다"처럼 대조되는 두 상황을 but/however로 연결하는 문장을 학습합니다.', 2, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 47), '인과 접속 심화', '"추웠기 때문에 재킷을 입었습니다"처럼 원인과 결과를 so/because로 연결하는 복합문을 학습합니다.', 3, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 47), '선택 접속 심화', '"전화하거나 이메일을 보내세요"처럼 선택지를 or로 제시하는 복합문을 학습합니다.', 4, 'T-PRES', 'SP-COMP');

-- Level 48
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 48), '숙소 예약', '"2박으로 방을 예약하고 싶습니다"처럼 호텔 예약 시 필요한 표현을 학습합니다.', 1, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 48), '체크인/체크아웃', '"김씨로 예약이 있습니다", "체크아웃은 몇 시인가요?"처럼 숙소 입실/퇴실 시 사용하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 48), '시설 문의', '"조식이 포함되어 있나요?", "와이파이가 되나요?"처럼 숙소 시설과 서비스를 문의하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 48), '문제 신고', '"에어컨이 작동하지 않습니다", "방이 너무 시끄럽습니다"처럼 숙소에서 문제를 신고하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 49
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 49), '수속 표현', '"탑승 수속 카운터가 어디인가요?", "창가 좌석으로 부탁합니다"처럼 공항 수속 시 필요한 표현을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 49), '출입국 심사', '"얼마나 체류하실 건가요?", "관광 목적입니다"처럼 출입국 심사에서 사용하는 질문과 답변을 학습합니다.', 2, 'T-FUT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 49), '기내 서비스', '"물 좀 주시겠어요?", "몇 시에 도착하나요?"처럼 비행기 안에서 승무원과 대화하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 49), '수하물 관련', '"짐이 없어졌습니다", "수하물 찾는 곳이 어디인가요?"처럼 수하물 관련 문제 상황의 표현을 학습합니다.', 4, 'T-PAST', 'SP-QUES');

-- Level 50
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 50), '의견 말하기', '"좋은 생각이라고 봅니다", "제 생각에는..."처럼 자신의 의견을 명확히 표현하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 50), '동의와 반대', '"동의합니다", "그렇게 생각하지 않습니다"처럼 상대방 의견에 동의하거나 반대하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 50), '이유 설명', '"이유는 ~이기 때문입니다", "날씨 때문에..."처럼 자신의 의견이나 행동에 대한 이유를 설명하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 50), '선호 표현 심화', '"집에 있는 게 낫겠습니다", "커피보다 차를 선호합니다"처럼 비교를 통해 선호를 표현하는 심화 문장을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 51
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 51), 'who 관계절', '"전화한 사람은 제 친구입니다"처럼 사람을 수식하는 who 관계절을 사용한 복문을 학습합니다.', 1, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 51), 'which/that 관계절', '"내가 산 책은 재미있습니다"처럼 사물을 수식하는 which/that 관계절을 학습합니다.', 2, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 51), '관계대명사 생략', '"내가 본 영화는 훌륭했습니다"처럼 목적격 관계대명사를 생략할 수 있는 경우를 학습합니다.', 3, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 51), 'where 관계부사', '"우리가 먹은 식당은 비쌌습니다"처럼 장소를 수식하는 where 관계부사를 학습합니다.', 4, 'T-PAST', 'SP-REL');

-- Level 52
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 52), '현재완료진행 긍정문', '"3시간째 공부하고 있습니다"처럼 과거부터 현재까지 계속되는 행동을 나타내는 현재완료진행 문장을 학습합니다.', 1, 'T-PPCON', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 52), '현재완료진행 의문문', '"얼마나 기다리셨어요?"처럼 행동의 지속 기간을 묻는 현재완료진행 의문문을 학습합니다.', 2, 'T-PPCON', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 52), '현재완료 vs 현재완료진행', '"책 3권을 읽었다(완료)" vs "책을 읽고 있는 중이다(진행)"처럼 두 시제의 초점 차이를 학습합니다.', 3, 'T-PPCON', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 52), 'since/for 기간 표현', '"2020년부터 여기 살고 있습니다", "3년간 공부하고 있습니다"처럼 since와 for를 활용한 기간 표현을 학습합니다.', 4, 'T-PPCON', 'SP-SVO');

-- Level 53
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 53), '의문사 간접 의문문', '"그녀가 어디 사는지 아세요?"처럼 의문사가 포함된 간접 의문문의 어순 변화를 학습합니다.', 1, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 53), 'if/whether 간접 의문문', '"그가 올지 궁금합니다"처럼 예/아니오 질문을 간접화하는 if/whether 구문을 학습합니다.', 2, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 53), '간접 의문 요청', '"어떻게 가는지 알려주시겠어요?"처럼 간접 의문문으로 정중하게 정보를 요청하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 53), '간접 의문 보고', '"몇 시에 시작하는지 잘 모르겠습니다"처럼 불확실한 정보를 간접 의문문으로 전달하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

-- Level 54
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 54), '2형 조건문 긍정', '"돈이 있다면 세계여행을 할 텐데"처럼 현재 사실과 반대되는 가정을 표현하는 2형 조건문을 학습합니다.', 1, 'T-PAST', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 54), '2형 조건문 부정', '"바쁘지 않다면 도와줄 수 있을 텐데"처럼 부정 조건의 2형 조건문을 학습합니다.', 2, 'T-PAST', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 54), '2형 조건문 의문', '"복권에 당첨되면 뭘 하실 건가요?"처럼 가상 상황에 대해 질문하는 2형 조건 의문문을 학습합니다.', 3, 'T-PAST', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 54), 'wish + 과거형', '"프랑스어를 할 수 있으면 좋겠다", "비가 안 오면 좋겠다"처럼 현재의 소망을 wish로 표현하는 문장을 학습합니다.', 4, 'T-PAST', 'SP-SUBJ');

-- Level 55
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 55), '비교급 강조 표현', '"이것이 훨씬 좋습니다", "그녀가 많이 더 큽니다"처럼 비교급을 much, far, a lot 등으로 강조하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 55), '이중 비교급', '"연습할수록 실력이 늡니다"처럼 ''the + 비교급, the + 비교급'' 구문을 학습합니다.', 2, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 55), '배수 비교', '"이것은 저것의 두 배 비쌉니다"처럼 배수를 사용한 비교 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 55), '비교급/최상급 관용 표현', '"내가 본 최고의 영화 중 하나"처럼 비교급과 최상급을 활용한 관용적 표현을 학습합니다.', 4, 'T-PPERF', 'SP-SVO');

-- Level 56
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 56), 'make/let/have 사역', '"그녀가 나를 웃게 했습니다", "도와주게 해주세요"처럼 다른 사람에게 행동을 시키는 사역 구문을 학습합니다.', 1, 'T-PAST', 'SP-SVOC');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 56), '지각 동사 활용', '"그가 나가는 것을 봤습니다", "누군가 소리치는 것을 들었습니다"처럼 감각으로 인지한 행동을 표현하는 문장을 학습합니다.', 2, 'T-PAST', 'SP-SVOC');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 56), 'get + 목적어 + to부정사', '"그에게 고치게 했습니다"처럼 get을 사용한 사역 표현을 학습합니다. make와의 뉘앙스 차이도 다룹니다.', 3, 'T-PAST', 'SP-SVOC');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 56), 'help + 목적어 + 동사', '"이해하도록 도와주었습니다"처럼 help를 사용한 보조 사역 표현과 to 생략 가능 여부를 학습합니다.', 4, 'T-PAST', 'SP-SVOC');

-- Level 57
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 57), '면접 표현', '"5년 경력이 있습니다", "제 강점은 ~입니다"처럼 취업 면접에서 자신을 소개하고 경력을 설명하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 57), '업무 보고 표현', '"프로젝트가 예정대로 진행 중입니다", "금요일까지 마치겠습니다"처럼 업무 진행 상황을 보고하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 57), '회의 표현', '"화면을 공유하겠습니다", "한 가지 추가하고 싶습니다"처럼 회의에서 자주 사용하는 비즈니스 표현을 학습합니다.', 3, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 57), '이메일 표현', '"알려드리기 위해 글을 씁니다", "첨부 파일을 확인해 주세요"처럼 업무 이메일에서 사용하는 정형화된 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 58
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 58), '뉴스 이해 표현', '"보고서에 따르면...", "~라고 발표되었습니다"처럼 뉴스나 보도 내용을 전달하는 표현을 학습합니다.', 1, 'T-PAST', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 58), '사건 설명 표현', '"화재가 발생했습니다", "사고가 ~에서 일어났습니다"처럼 사건과 사고를 객관적으로 설명하는 문장을 학습합니다.', 2, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 58), '통계/수치 표현', '"매출이 20% 증가했습니다", "인구가 두 배가 되었습니다"처럼 숫자와 통계를 포함한 정보를 전달하는 표현을 학습합니다.', 3, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 58), '의견 교환 표현', '"~~에 대해 어떻게 생각하세요?", "~~라고 봅니다"처럼 시사 주제에 대해 의견을 교환하는 대화 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 59
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 59), '영화/드라마 감상', '"연기가 인상적이었습니다", "줄거리가 예측 가능했습니다"처럼 영상 콘텐츠에 대한 감상과 평가를 표현하는 문장을 학습합니다.', 1, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 59), '음악/공연 감상', '"~의 열렬한 팬입니다", "콘서트가 놀라웠습니다"처럼 음악과 공연에 대한 감상을 표현하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 59), '전시/박물관 표현', '"이 그림은 18세기 작품입니다"처럼 전시물과 예술작품에 대해 설명하거나 감상하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 59), '독서/문학 표현', '"이 이야기는 ~에 관한 것입니다", "작가는 ~를 묘사합니다"처럼 책이나 문학작품에 대해 이야기하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 60
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 60), '환경 문제 표현', '"오염이 심해지고 있습니다", "재활용을 더 해야 합니다"처럼 환경 이슈에 대해 논의하는 표현을 학습합니다.', 1, 'T-PCONT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 60), '사회 이슈 표현', '"교육은 모든 사람에게 중요합니다"처럼 사회 문제와 가치에 대해 의견을 제시하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 60), '건강 생활 표현', '"규칙적인 운동은 스트레스를 줄여줍니다"처럼 건강한 생활습관에 대해 조언하거나 설명하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 60), '기술과 생활 표현', '"기술이 우리 삶을 크게 바꿨습니다"처럼 기술 발전이 생활에 미치는 영향을 설명하는 표현을 학습합니다.', 4, 'T-PPERF', 'SP-SVO');

-- Level 61
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 61), '과거완료 긍정문', '"그녀가 도착했을 때 이미 먹었습니다"처럼 과거의 특정 시점 이전에 완료된 행동을 나타내는 과거완료를 학습합니다.', 1, 'T-PAPERF', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 61), '과거완료 부정문', '"종이 울렸을 때 아직 끝내지 못했습니다"처럼 과거의 특정 시점까지 미완료된 상태를 나타내는 문장을 학습합니다.', 2, 'T-PAPERF', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 61), '과거완료 의문문', '"전에 거기 가본 적 있었나요?"처럼 과거 이전의 경험이나 완료를 묻는 과거완료 의문문을 학습합니다.', 3, 'T-PAPERF', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 61), '과거완료 + 과거 연결', '"공부를 마친 후 잠자리에 들었습니다"처럼 과거완료와 과거를 연결하여 사건의 순서를 명확히 하는 문장을 학습합니다.', 4, 'T-PAPERF', 'SP-COMP');

-- Level 62
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 62), '미래진행 긍정문', '"내일 3시에 일하고 있을 것입니다"처럼 미래의 특정 시점에 진행 중일 행동을 나타내는 미래진행형을 학습합니다.', 1, 'T-FCONT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 62), '미래진행 의문문', '"오늘 밤 차를 사용하실 건가요?"처럼 미래의 예정된 행동을 정중하게 묻는 미래진행 의문문을 학습합니다.', 2, 'T-FCONT', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 62), '미래진행 예정 표현', '"그때 태평양 위를 비행하고 있을 것입니다"처럼 미래의 확정된 일정을 진행형으로 표현하는 문장을 학습합니다.', 3, 'T-FCONT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 62), '미래진행 정중한 질문', '"저녁 식사에 참석하실 건가요?"처럼 미래진행형을 활용한 공손하고 부드러운 질문 표현을 학습합니다.', 4, 'T-FCONT', 'SP-QUES');

-- Level 63
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 63), '평서문 간접화법', '"그는 피곤하다고 말했습니다", "그녀는 오겠다고 말했습니다"처럼 다른 사람의 말을 간접적으로 전달하는 표현을 학습합니다.', 1, 'T-PAST', 'SP-IND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 63), '의문문 간접화법', '"어디에 사는지 물었습니다"처럼 다른 사람의 질문을 간접적으로 전달하는 표현을 학습합니다.', 2, 'T-PAST', 'SP-IND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 63), '명령문 간접화법', '"기다리라고 했습니다", "나가지 말라고 부탁했습니다"처럼 명령이나 요청을 간접적으로 전달하는 표현을 학습합니다.', 3, 'T-PAST', 'SP-IND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 63), '시제 일치 규칙', '"지난주에 아팠다고 말했습니다"처럼 간접화법에서의 시제 변화 규칙(시제 후퇴)을 학습합니다.', 4, 'T-PAST', 'SP-IND');

-- Level 64
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 64), '3형 조건문 긍정', '"더 열심히 공부했다면 합격했을 텐데"처럼 과거 사실과 반대되는 가정을 표현하는 3형 조건문을 학습합니다.', 1, 'T-PAPERF', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 64), '3형 조건문 부정', '"그가 도와주지 않았다면 실패했을 것입니다"처럼 부정 조건의 3형 조건문을 학습합니다.', 2, 'T-PAPERF', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 64), '3형 조건문 의문', '"만약 ~했다면 어떻게 했을까요?"처럼 과거 가상 상황에 대한 질문을 학습합니다.', 3, 'T-PAPERF', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 64), 'wish + 과거완료', '"당신 말을 들었어야 했는데"처럼 과거에 대한 후회나 아쉬움을 wish + 과거완료로 표현하는 문장을 학습합니다.', 4, 'T-PAPERF', 'SP-SUBJ');

-- Level 65
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 65), '완료 수동태', '"다리가 수리되었습니다"처럼 현재완료 수동태로 완료된 상태를 나타내는 문장을 학습합니다.', 1, 'T-PPERF', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 65), '진행 수동태', '"집이 칠해지고 있습니다"처럼 현재 진행 중인 수동 행위를 나타내는 진행 수동태를 학습합니다.', 2, 'T-PCONT', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 65), '조동사 수동태', '"할 수 있습니다", "고쳐져야 합니다"처럼 조동사와 결합한 수동태 표현을 학습합니다.', 3, 'T-PRES', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 65), '전치사 수동태 관용', '"미술에 관심이 있습니다", "재능으로 유명합니다"처럼 by 이외의 전치사를 사용하는 수동태 관용 표현을 학습합니다.', 4, 'T-PRES', 'SP-PASS');

-- Level 66
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 66), 'whose 관계대명사', '"차가 도난당한 그 남자는 신고했습니다"처럼 소유를 나타내는 whose 관계절을 학습합니다.', 1, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 66), '전치사 + 관계대명사', '"제가 이야기한 그 분은 도움이 되었습니다"처럼 전치사와 관계대명사의 결합 구문을 학습합니다.', 2, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 66), '관계부사 심화', '"늦은 이유는...", "태어난 곳은..."처럼 where, when, why 관계부사를 활용한 복문을 학습합니다.', 3, 'T-PAST', 'SP-REL');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 66), '복합관계대명사', '"먼저 오는 사람이 상을 받습니다"처럼 whoever, whatever, whichever 등 복합관계대명사를 학습합니다.', 4, 'T-PRES', 'SP-REL');

-- Level 67
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 67), '설득 표현', '"강력히 추천합니다", "꼭 시도해 보셔야 합니다"처럼 상대방을 설득하는 강한 권유 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 67), '양보/타협 표현', '"말씀은 알겠지만...", "타협안은 어떨까요?"처럼 상대 의견을 인정하면서 자기 주장을 하는 양보 표현을 학습합니다.', 2, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 67), '조건 제시 표현', '"~라는 조건으로 동의하겠습니다"처럼 협상에서 조건을 제시하는 표현을 학습합니다.', 3, 'T-FUT', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 67), '결론 유도 표현', '"따라서 ~라고 봅니다", "결론적으로..."처럼 논의를 마무리하고 결론으로 이끄는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 68
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 68), '복합 감정 표현', '"안도되면서도 약간 실망합니다"처럼 복합적이고 미묘한 감정을 동시에 표현하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 68), '공감 표현', '"기분을 이해합니다", "힘드셨겠네요"처럼 상대방의 감정에 공감하고 이해를 표현하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 68), '위로/격려 표현', '"포기하지 마세요", "다 잘될 거예요"처럼 어려움에 처한 사람을 위로하고 격려하는 표현을 학습합니다.', 3, 'T-FUT', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 68), '후회 표현', '"가지 않은 것이 후회됩니다", "그런 말을 하지 말았어야 했는데"처럼 과거에 대한 후회를 표현하는 문장을 학습합니다.', 4, 'T-PAST', 'SP-SVO');

-- Level 69
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 69), '인물 묘사', '"곱슬머리의 키 큰 여성입니다"처럼 사람의 외모, 성격, 특징을 묘사하는 복합 형용사 표현을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 69), '장소 묘사', '"방은 작지만 아늑했습니다"처럼 장소의 분위기와 특징을 구체적으로 묘사하는 문장을 학습합니다.', 2, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 69), '과정 설명', '"먼저 ~을 해야 합니다", "그 다음에 ~을 해야 합니다"처럼 절차나 과정을 순서대로 설명하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 69), '비유 표현 기초', '"꿈만 같습니다", "천사처럼 노래합니다"처럼 직유와 은유를 활용한 기초 비유 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 70
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 70), '원인/결과 표현', '"비 때문에 행사가 취소되었습니다"처럼 원인과 결과를 논리적으로 연결하는 due to, as a result 등의 표현을 학습합니다.', 1, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 70), '조건/가정 표현', '"모든 것이 잘 된다면...", "~라는 전제하에"처럼 조건과 가정을 나타내는 다양한 접속 표현을 학습합니다.', 2, 'T-PRES', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 70), '대조/양보 표현', '"비싸긴 했지만 그만한 가치가 있었습니다"처럼 although, despite 등을 활용한 양보/대조 표현을 학습합니다.', 3, 'T-PAST', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 70), '추가/강조 표현', '"게다가 서비스도 훌륭했습니다", "더욱이..."처럼 moreover, furthermore 등을 활용한 추가/강조 연결 표현을 학습합니다.', 4, 'T-PAST', 'SP-COMP');

-- Level 71
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 71), '미래완료 긍정문', '"그때까지 끝낼 것입니다"처럼 미래의 특정 시점까지 완료될 행동을 나타내는 미래완료를 학습합니다.', 1, 'T-FPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 71), '미래완료 부정문', '"정오까지 도착하지 못할 것입니다"처럼 미래 특정 시점까지 완료되지 못할 행동을 나타내는 문장을 학습합니다.', 2, 'T-FPERF', 'SP-NEG');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 71), '미래완료 의문문', '"금요일까지 완료하셨을까요?"처럼 미래 완료 여부를 묻는 의문문을 학습합니다.', 3, 'T-FPERF', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 71), '미래완료 + 기간 표현', '"내년이면 여기 산 지 10년이 됩니다"처럼 미래완료와 기간 표현을 결합한 문장을 학습합니다.', 4, 'T-FPERF', 'SP-SVO');

-- Level 72
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 72), '혼합 가정법', '"의학을 전공했다면 지금 의사일 텐데"처럼 과거 가정이 현재에 미치는 영향을 표현하는 혼합 가정법을 학습합니다.', 1, 'T-MIX', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 72), 'as if/as though 표현', '"모든 것을 아는 것처럼 행동합니다"처럼 가정법과 결합한 as if/as though 표현을 학습합니다.', 2, 'T-PAST', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 72), 'It''s time + 가정법', '"이제 떠날 시간입니다", "진작 사과했어야 합니다"처럼 It''s time 구문에 가정법을 적용하는 표현을 학습합니다.', 3, 'T-PAST', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 72), 'would rather + 가정법', '"여기서 담배를 피우지 않았으면 합니다"처럼 would rather를 사용한 정중한 선호/요청 표현을 학습합니다.', 4, 'T-PAST', 'SP-SUBJ');

-- Level 73
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 73), '현재분사 구문', '"길을 걷다가 옛 친구를 만났습니다"처럼 현재분사로 시작하는 부사절 축약 구문을 학습합니다.', 1, 'T-PAST', 'SP-PAR');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 73), '과거분사 구문', '"일에 지쳐서 바로 잠들었습니다"처럼 과거분사로 시작하는 분사 구문을 학습합니다.', 2, 'T-PAST', 'SP-PAR');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 73), '분사구문 부정', '"뭐라고 말해야 할지 몰라 침묵을 지켰습니다"처럼 Not + 분사로 시작하는 부정 분사 구문을 학습합니다.', 3, 'T-PAST', 'SP-PAR');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 73), '독립분사구문', '"날씨가 허락한다면 소풍을 갈 것입니다"처럼 주절과 주어가 다른 독립분사구문을 학습합니다.', 4, 'T-PRES', 'SP-PAR');

-- Level 74
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 74), 'It is... that 강조', '"꽃병을 깬 것은 존이었습니다"처럼 문장의 특정 요소를 강조하는 it is... that 강조 구문을 학습합니다.', 1, 'T-PAST', 'SP-EMPH');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 74), 'do/does/did 강조', '"도움에 정말 감사합니다"처럼 do/does/did를 사용하여 동사를 강조하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-EMPH');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 74), '부정어 도치 강조 기초', '"그런 아름다움은 본 적이 없습니다"처럼 부정어를 문두에 놓아 의미를 강조하는 도치 구문의 기초를 학습합니다.', 3, 'T-PPERF', 'SP-EMPH');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 74), 'what 강조절', '"내가 필요한 것은 휴가입니다"처럼 what절을 사용한 강조 구문을 학습합니다.', 4, 'T-PRES', 'SP-EMPH');

-- Level 75
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 75), '프레젠테이션 표현', '"데이터를 설명하겠습니다", "이 그래프에서 보시다시피..."처럼 업무 발표에서 사용하는 표현을 학습합니다.', 1, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 75), '협상 표현', '"10% 할인을 제안할 용의가 있습니다"처럼 비즈니스 협상에서 조건을 제시하고 조율하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 75), '클레임/불만 표현', '"~에 대해 불만을 접수하고 싶습니다"처럼 서비스 불만이나 문제를 공식적으로 제기하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 75), '공식 서신 표현', '"~에 대한 우려를 표명하기 위해 글을 씁니다"처럼 공식 서신이나 이메일에서 사용하는 격식 있는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 76
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 76), '연구 결과 표현', '"연구 결과 ~임이 밝혀졌습니다", "결과는 ~을 시사합니다"처럼 학술 연구 결과를 보고하는 표현을 학습합니다.', 1, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 76), '인용/참조 표현', '"보고서에 의하면...", "~에 따르면..."처럼 출처를 밝히며 정보를 전달하는 인용/참조 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 76), '가설/추론 표현', '"~일 가능성이 있습니다", "이것은 ~을 시사합니다"처럼 학술적 가설과 추론을 표현하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 76), '정의/분류 표현', '"이것은 ~로 정의될 수 있습니다", "세 가지 유형이 있습니다"처럼 개념을 정의하고 분류하는 학술 표현을 학습합니다.', 4, 'T-PRES', 'SP-PASS');

-- Level 77
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 77), '철학적 표현', '"행복은 사람마다 다른 의미입니다"처럼 추상적 개념에 대해 깊이 있는 사고를 표현하는 문장을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 77), '가치관 표현', '"평등을 믿습니다", "자유는 필수적입니다"처럼 개인의 가치관과 신념을 명확히 표현하는 문장을 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 77), '윤리적 판단 표현', '"~~하는 것이 옳은가?", "~~인지 고려해야 합니다"처럼 윤리적 문제에 대한 판단과 질문을 표현하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 77), '미래 전망 표현', '"장기적으로...", "결국에는 상황이 변할 것입니다"처럼 미래에 대한 전망과 예측을 표현하는 문장을 학습합니다.', 4, 'T-FUT', 'SP-SVO');

-- Level 78
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 78), '관용 표현', '"비가 억수같이 옵니다", "행운을 빕니다!"처럼 각 언어의 대표적인 관용 표현과 그 의미를 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 78), '비유/은유 표현', '"시간은 돈이다", "인생은 여행이다"처럼 은유를 활용한 표현과 그 문화적 의미를 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 78), '완곡 표현', '"돌아가셨습니다", "현재 구직 중입니다"처럼 직접적 표현을 피하는 완곡한 표현(euphemism)을 학습합니다.', 3, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 78), '반어/아이러니', '"좋았어, 또 비가 오는군", "딱 필요했던 거야"처럼 반어적 표현과 아이러니의 뉘앙스를 학습합니다.', 4, 'T-PAST', 'SP-SV');

-- Level 79
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 79), '뉴스 보도 스타일', '"~로 보도되었습니다", "소식통이 확인합니다"처럼 뉴스 보도에서 사용되는 객관적 서술 스타일을 학습합니다.', 1, 'T-PPERF', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 79), '소셜미디어 표현', '"이것이 화제가 되었습니다", "소셜미디어에서 유행 중입니다"처럼 디지털 미디어 관련 현대 표현을 학습합니다.', 2, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 79), '광고/마케팅 표현', '"기간 한정 특가", "놓치지 마세요"처럼 광고와 마케팅에서 사용되는 설득력 있는 표현을 학습합니다.', 3, 'T-PRES', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 79), '리뷰/평가 표현', '"5점 만점에 4점을 주겠습니다", "강력 추천합니다"처럼 제품/서비스를 평가하고 추천하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 80
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 80), '계약 표현', '"양 당사자는 이에 동의합니다"처럼 계약서와 합의서에서 사용되는 법률적 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 80), '규정/정책 표현', '"직원은 ~~해야 합니다", "~~하는 것은 금지됩니다"처럼 규정과 정책을 명시하는 공식 표현을 학습합니다.', 2, 'T-PRES', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 80), '권리/의무 표현', '"~~할 권리가 있습니다", "~~할 책임이 있습니다"처럼 법적 권리와 의무를 표현하는 문장을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 80), '면책/조건 표현', '"다음 조건에 따라...", "~에도 불구하고..."처럼 법적 면책과 조건을 나타내는 공식 표현을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

-- Level 81
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 81), '부정어 도치', '"앉자마자 전화가 울렸습니다"처럼 hardly, scarcely 등 부정어를 문두에 놓는 도치 구문을 학습합니다.', 1, 'T-PAST', 'SP-INV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 81), '장소부사 도치', '"버스가 옵니다", "기회가 갔습니다"처럼 here, there 등 장소부사를 문두에 놓는 도치 구문을 학습합니다.', 2, 'T-PRES', 'SP-INV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 81), 'so/neither 도치', '"저도 그렇습니다", "그녀도 못합니다"처럼 동의를 나타내는 so/neither 도치 표현을 학습합니다.', 3, 'T-PRES', 'SP-INV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 81), '조건절 도치', '"알았더라면 더 일찍 왔을 것입니다"처럼 if를 생략하고 도치하는 가정법 조건절을 학습합니다.', 4, 'T-PAPERF', 'SP-INV');

-- Level 82
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 82), '장기간 지속 표현', '"몇 달째 이 프로젝트를 진행하고 있습니다"처럼 장기간에 걸친 행동의 지속을 강조하는 표현을 학습합니다.', 1, 'T-PPCON', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 82), '원인 설명 표현', '"뛰어왔기 때문에 피곤합니다"처럼 현재 상태의 원인을 현재완료진행으로 설명하는 표현을 학습합니다.', 2, 'T-PPCON', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 82), '불만/강조 표현', '"1시간 넘게 기다리고 있습니다!"처럼 현재완료진행으로 불만이나 인내를 강조하는 표현을 학습합니다.', 3, 'T-PPCON', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 82), '변화 추세 표현', '"물가가 꾸준히 오르고 있습니다"처럼 점진적인 변화의 추세를 현재완료진행으로 나타내는 표현을 학습합니다.', 4, 'T-PPCON', 'SP-SVO');

-- Level 83
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 83), '혼합 시제 조건문', '"비가 오지 않았다면 땅이 젖어있지 않을 텐데"처럼 과거 조건과 현재 결과를 혼합하는 조건문을 학습합니다.', 1, 'T-MIX', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 83), '조건 연쇄 표현', '"A가 일어나면 B가 따를 것이고, 그러면 C가 됩니다"처럼 연쇄적 조건-결과를 표현하는 복합 문장을 학습합니다.', 2, 'T-FUT', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 83), 'but for / if it weren''t for', '"당신의 도움이 아니었다면 실패했을 것입니다"처럼 but for 구문을 활용한 강조 가정 표현을 학습합니다.', 3, 'T-PAPERF', 'SP-SUBJ');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 83), '조건 관용표현', '"무슨 일이 있더라도...", "그렇다 하더라도..."처럼 come what may, be that as it may 등 조건 관용 표현을 학습합니다.', 4, 'T-PRES', 'SP-COND');

-- Level 84
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 84), '주장 제시', '"~~라고 주장합니다", "~~라고 주장될 수 있습니다"처럼 학술 토론에서 주장을 제시하는 격식 있는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 84), '반론 표현', '"반면에...", "그러나 ~라고 반박할 수도 있습니다"처럼 반대 의견을 논리적으로 제시하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-COMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 84), '근거 제시', '"증거가 ~을 시사합니다", "연구 결과에 기반하여..."처럼 주장을 뒷받침하는 근거를 제시하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 84), '결론 도출', '"위 내용에 비추어...", "종합하면..."처럼 논의를 정리하고 결론을 도출하는 학술적 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 85
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 85), '완곡한 거절', '"유감이지만 그것은 어려울 것 같습니다"처럼 상대방의 기분을 배려하면서 거절하는 외교적 표현을 학습합니다.', 1, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 85), '정중한 비동의', '"실례지만 동의하기 어렵습니다"처럼 존중을 유지하면서 반대 의견을 표현하는 방법을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 85), '우회적 비판', '"~에 개선의 여지가 있을 수 있습니다"처럼 직접적 비판을 피하고 건설적으로 의견을 전달하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 85), '조심스러운 제안', '"대안적 접근을 제안해도 될까요?"처럼 자신의 제안을 겸손하고 조심스럽게 전달하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-QUES');

-- Level 86
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 86), '서사 기법 표현', '"옛날 옛적에...", "그가 몰랐던 것은..."처럼 이야기를 시작하고 긴장감을 조성하는 서사적 표현을 학습합니다.', 1, 'T-PAST', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 86), '감각적 묘사 표현', '"갓 구운 빵의 향기가 방을 가득 채웠습니다"처럼 오감을 활용한 생동감 있는 묘사 표현을 학습합니다.', 2, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 86), '심리 묘사 표현', '"의무와 욕망 사이에서 갈등했습니다"처럼 인물의 내면 심리를 묘사하는 문학적 표현을 학습합니다.', 3, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 86), '시적 표현', '"침묵이 말보다 크게 울렸습니다"처럼 시적 감수성이 담긴 은유적/문학적 표현을 학습합니다.', 4, 'T-PAST', 'SP-SV');

-- Level 87
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 87), '과학적 설명 표현', '"실험은 ~을 입증합니다"처럼 과학적 사실과 실험 결과를 설명하는 전문 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 87), '기술적 설명 표현', '"시스템은 데이터를 실시간으로 처리합니다"처럼 기술 시스템의 작동 원리를 설명하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 87), '통계 해석 표현', '"데이터는 ~간의 유의미한 상관관계를 보여줍니다"처럼 통계 데이터를 해석하고 설명하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 87), '추세/전망 표현', '"현재 추세에 기반하여 ~을 예측할 수 있습니다"처럼 데이터 기반 예측과 전망을 표현하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

-- Level 88
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 88), '경제 지표 표현', '"인플레이션이 10년래 최고를 기록했습니다"처럼 경제 지표와 동향을 설명하는 표현을 학습합니다.', 1, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 88), '시장/투자 표현', '"주식시장이 급락했습니다"처럼 금융시장의 변동과 투자에 관한 전문 표현을 학습합니다.', 2, 'T-PAST', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 88), '거래/계약 표현', '"거래가 500만 달러에 성사되었습니다"처럼 비즈니스 거래와 계약 체결에 관한 표현을 학습합니다.', 3, 'T-PAST', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 88), '재정 계획 표현', '"~을 위한 예산을 배정해야 합니다"처럼 재정 계획과 예산 관련 전문 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 89
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 89), '법적 용어 활용', '"피고는 ~의 혐의로 유죄 판결을 받았습니다"처럼 법적 절차와 판결에 관한 전문 표현을 학습합니다.', 1, 'T-PAST', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 89), '공식 통보 표현', '"~을 알려드립니다"처럼 공식적 통보와 안내에 사용되는 격식 있는 표현을 학습합니다.', 2, 'T-PRES', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 89), '조약/협정 표현', '"본 협정은 ~일에 발효됩니다"처럼 국제 조약이나 공식 협정에서 사용되는 표현을 학습합니다.', 3, 'T-FUT', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 89), '면책 조항 표현', '"회사는 ~에 대해 책임을 지지 않습니다"처럼 면책과 책임 제한을 명시하는 법적 표현을 학습합니다.', 4, 'T-PRES', 'SP-NEG');

-- Level 90
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 90), '문화적 관용표현', '"로마에 가면 로마 법을 따르라"처럼 문화적 배경을 담고 있는 각 언어의 대표적 관용 표현을 학습합니다.', 1, 'T-PRES', 'SP-COND');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 90), '세대별 표현 차이', '"대박이다(구어)" vs "매우 인상적이다(격식)"처럼 세대, 격식에 따른 표현 차이를 이해하고 학습합니다.', 2, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 90), '유머/위트 표현', '"말장난은 의도한 게 아닙니다", "장난이에요"처럼 유머와 위트가 담긴 표현과 그 문화적 맥락을 학습합니다.', 3, 'T-PAST', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 90), '지역 특색 표현', '"미국에서는 ~라고 합니다", "영국에서는 ~라고 합니다"처럼 같은 언어의 지역별 표현 차이를 학습합니다.', 4, 'T-PRES', 'SP-COMP');

-- Level 91
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 91), '복합 연결어 표현', '"도전에도 불구하고...", "~라는 사실에도 불구하고..."처럼 고급 연결어를 활용한 복잡한 문장 연결을 학습합니다.', 1, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 91), '논리 전개 표현', '"같은 맥락에서...", "반대로..."처럼 논리를 전개하고 전환하는 고급 연결 표현을 학습합니다.', 2, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 91), '부연/예시 심화 표현', '"이 점을 설명하자면...", "대표적인 사례는..."처럼 주장을 구체적 예시로 뒷받침하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 91), '요약/결론 심화 표현', '"모든 것을 고려하면...", "전반적으로 보았을 때..."처럼 논의를 종합하여 결론짓는 고급 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 92
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 92), '강한 추측 표현', '"틀림없이 지쳤을 것입니다", "사실일 리가 없습니다"처럼 강한 확신의 추측을 나타내는 조동사 표현을 학습합니다.', 1, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 92), '약한 추측 표현', '"잊었을지도 모릅니다", "더 나빴을 수도 있습니다"처럼 불확실한 추측을 나타내는 표현을 학습합니다.', 2, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 92), '과거 추측 표현', '"지금쯤 도착했을 것입니다", "알았을 것입니다"처럼 과거 사실에 대한 추측을 표현하는 문장을 학습합니다.', 3, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 92), '추론 표현', '"~~은 당연한 일입니다", "~~라고 추론할 수 있습니다"처럼 논리적 추론을 표현하는 학술적 문장을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

-- Level 93
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 93), '수사 의문문', '"좋은 이야기를 싫어하는 사람이 있을까요?"처럼 답을 기대하지 않는 수사적 의문문의 효과적 활용을 학습합니다.', 1, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 93), '점층법 표현', '"왔노라, 보았노라, 이겼노라"처럼 의미를 점진적으로 강화하는 점층법(climax) 표현을 학습합니다.', 2, 'T-PAST', 'SP-MIX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 93), '대구법 표현', '"쉽게 왔다 쉽게 간다", "눈에서 멀어지면 마음에서도 멀어진다"처럼 구조적 균형을 갖춘 대구 표현을 학습합니다.', 3, 'T-PRES', 'SP-MIX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 93), '역설 표현', '"적은 것이 더 많은 것이다", "유일한 변치 않는 것은 변화다"처럼 모순 속 진리를 담은 역설 표현을 학습합니다.', 4, 'T-PRES', 'SP-SV');

-- Level 94
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 94), '논문 서론 표현', '"본 논문은 ~을 검토합니다", "이 연구의 목적은..."처럼 학술 논문의 서론에서 사용되는 정형 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 94), '방법론 표현', '"질적 연구 방법이 사용되었습니다"처럼 연구 방법론을 기술하는 학술적 표현을 학습합니다.', 2, 'T-PAST', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 94), '결과 보고 표현', '"연구 결과는 유의미한 ~을 보여줍니다"처럼 연구 결과를 객관적으로 보고하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 94), '한계/향후 연구 표현', '"~에 대한 추가 연구가 필요합니다"처럼 연구의 한계를 인정하고 향후 방향을 제시하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-PASS');

-- Level 95
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 95), '정치/사회 담론 표현', '"이 정책은 불평등을 해소하는 것을 목표로 합니다"처럼 정치적/사회적 담론에서 사용되는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 95), '찬반 토론 표현', '"찬성측은 ~라고 주장합니다", "반대측은 ~라고 반박합니다"처럼 찬반 양측의 입장을 정리하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 95), '중재/합의 표현', '"균형 잡힌 접근이 필요합니다", "양측 모두 일리가 있습니다"처럼 토론을 중재하고 합의를 이끄는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 95), '미래 제언 표현', '"앞으로 ~이 필수적입니다"처럼 사회적 문제에 대한 미래 지향적 제언을 표현하는 문장을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 96
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 96), '감정 전달 서신 표현', '"얼마나 감사한지 말로 표현할 수 없습니다"처럼 깊은 감정을 서면으로 전달하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-CPLX');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 96), '축사/조사 표현', '"대단히 기쁜 마음으로...", "무거운 마음으로..."처럼 축하와 조의를 전하는 격식 있는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 96), '동기부여 표현', '"천 리 길도 한 걸음부터"처럼 용기와 동기를 부여하는 명언/격언 형태의 표현을 학습합니다.', 3, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 96), '회고/성찰 표현', '"돌이켜보면 ~을 깨닫습니다"처럼 과거를 돌아보고 교훈을 이끌어내는 성찰적 표현을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

-- Level 97
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 97), '문화 민감성 표현', '"일부 문화에서는 ~이 무례하게 여겨집니다"처럼 문화적 차이를 인지하고 존중하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-PASS');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 97), '다양성 표현', '"다양성이 우리의 시야를 넓혀줍니다"처럼 다양성의 가치를 표현하는 포용적 언어를 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 97), '글로벌 에티켓 표현', '"일본에서는 인사할 때 고개 숙이는 것이 관례입니다"처럼 각국의 문화적 예절을 설명하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 97), '포용적 표현', '"모든 사람은 동등한 기회를 누릴 자격이 있습니다"처럼 포용성과 평등을 강조하는 현대적 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 98
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 98), '연설 도입 표현', '"오늘 이 자리에 서게 되어 영광입니다"처럼 공식 연설이나 발표를 시작하는 격식 있는 도입부 표현을 학습합니다.', 1, 'T-PRES', 'SP-SV');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 98), '핵심 메시지 전달', '"전하고 싶은 메시지는..."처럼 연설의 핵심 주제를 명확하고 임팩트 있게 전달하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 98), '청중 참여 유도 표현', '"한 가지 여쭤볼게요...", "동의하시면 손을 들어주세요"처럼 청중의 참여와 반응을 이끌어내는 표현을 학습합니다.', 3, 'T-PRES', 'SP-QUES');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 98), '연설 마무리 표현', '"마무리하면서 ~을 당부드립니다", "감사합니다"처럼 연설을 인상적으로 마무리하는 표현을 학습합니다.', 4, 'T-PRES', 'SP-SVO');

-- Level 99
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 99), '스토리텔링 표현', '"~한 세상을 상상해보세요", "이런 상황을 그려보세요"처럼 청중의 상상력을 자극하는 서사적 표현을 학습합니다.', 1, 'T-PRES', 'SP-IMP');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 99), '설득적 글쓰기 표현', '"~의 영향을 고려해보세요", "증거가 압도적입니다"처럼 글을 통해 독자를 설득하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 99), '비평/분석 표현', '"이 작품은 ~를 포착하는 데 성공합니다", "자세히 살펴보면..."처럼 작품이나 현상을 비평하고 분석하는 표현을 학습합니다.', 3, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 99), '창작 표현', '"새벽이 하늘을 황금빛으로 물들였습니다"처럼 문학적 감수성이 돋보이는 창작 수준의 표현을 학습합니다.', 4, 'T-PAST', 'SP-SVO');

-- Level 100
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 100), '속담/격언 활용', '"옛말에 ~~라고 하죠", "~~라고들 합니다"처럼 속담과 격언을 대화에 자연스럽게 인용하는 표현을 학습합니다.', 1, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 100), '미묘한 뉘앙스 표현', '"~와 ~ 사이에는 미묘한 차이가 있습니다"처럼 단어와 표현 간의 미세한 뉘앙스 차이를 설명하는 표현을 학습합니다.', 2, 'T-PRES', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 100), '자유 의사표현', '"이보다 더 잘 표현할 수 없을 것입니다"처럼 원어민 수준의 자유로운 의사표현과 감탄을 학습합니다.', 3, 'T-PPERF', 'SP-SVO');
INSERT INTO skills (level_id, skill_name, skill_summary, display_order, tense_type_code, pattern_type_code) VALUES ((SELECT id FROM levels WHERE level_number = 100), '종합 표현력', '"위 모든 사항을 고려하면 ~이 분명해집니다"처럼 다양한 문법과 어휘를 종합 활용하는 최상위 수준의 표현을 학습합니다.', 4, 'T-PRES', 'SP-CPLX');

COMMIT;
