# FlipFlip 학습 콘텐츠 상세요건 질의서

> **목적**: 언어스킬 도출, 문장 도출, 표현 작성에 앞서 추가로 확인이 필요한 세부 요건을 정리합니다.
>
> **Purpose**: Clarify detailed requirements before deriving language skills, sentences, and expressions.
>
> **작성일**: 2026-03-15
>
> **응답방법**: 각 질문에 답변을 작성하거나, "기본추천안 수용" 시 "OK"로 표기해 주세요.

---

## 1. 스킬 체계 관련 (Skill Framework)

### CQ1.1 스킬의 언어 중립성 수준 (Language Neutrality Level)

**[KR]** 스킬은 5개 언어(영어, 스페인어, 중국어, 일어, 한국어)에 공통 적용됩니다. 그러나 일부 문법 개념은 특정 언어에만 존재합니다 (예: 영어 관사, 중국어 양사, 일본어 경어법, 스페인어 접속법). 이런 언어 고유 문법을 어떻게 처리합니까?

**[EN]** Skills apply across 5 languages, but some grammar concepts are language-specific (e.g., English articles, Chinese classifiers, Japanese honorifics, Spanish subjunctive). How should language-specific grammar be handled?

**Why this matters**: 스킬 프레임워크의 추상화 수준과 언어별 매핑 전략에 영향을 줍니다.

**기본추천안**: 언어 고유 문법은 상위 공통 개념으로 추상화하여 스킬화합니다. 예: "관사/한정사 사용" → 영어(a/the), 스페인어(el/la/un/una), 중국어(이/그 지시대명사), 일본어(この/その), 한국어(이/그/저). 3개 이상 언어에 의미 있는 대응이 없는 개념은 스킬에서 제외하되, 해당 언어 표현의 힌트에서 보충 설명합니다.

**답변**: OK

---

### CQ1.2 발음/음운 스킬 포함 여부 (Pronunciation/Phonetics Skills)

**[KR]** FlipFlip은 카드 기반 텍스트 학습 앱입니다. 음성 기능(TTS/STT)이 없는 상황에서 발음, 성조(중국어), 악센트(스페인어) 관련 스킬을 포함합니까?

**[EN]** FlipFlip is a text-based card learning app. Without audio features (TTS/STT), should pronunciation, tones (Chinese), and accent (Spanish) skills be included?

**Why this matters**: 스킬 목록의 범위와 향후 음성 기능 확장 시 콘텐츠 준비 수준에 영향을 줍니다.

**기본추천안**: 발음 스킬은 제외합니다. 대신 기초 레벨 힌트에서 발음 관련 참고사항을 텍스트로 제공합니다 (예: 병음, 후리가나 등). 향후 TTS 기능 추가 시 별도 발음 스킬 세트를 추가할 수 있도록 스킬 체계에 확장 여지를 남깁니다.

**답변**: OK (향후 TTS 기능 추가예정입니다)

---

### CQ1.3 문자 체계 학습 (Writing System Learning)

**[KR]** 중국어(한자), 일본어(히라가나/가타카나/한자), 한국어(한글)는 별도의 문자 체계를 가지고 있습니다. 문자 자체의 학습(획순, 읽기 규칙 등)을 스킬로 포함합니까?

**[EN]** Chinese (hanzi), Japanese (hiragana/katakana/kanji), and Korean (hangul) have unique writing systems. Should learning the writing systems themselves (stroke order, reading rules) be included as skills?

**Why this matters**: 기초 레벨 스킬 구성과 각 언어별 학습 시작점에 영향을 줍니다.

**기본추천안**: 문자 체계 학습은 스킬로 포함하지 않습니다. 카드 학습 형태에서는 문자를 "보고 의미를 파악하는" 수준이 목표이며, 쓰기는 별도 기능 영역입니다. 단, Level 1-3 힌트에서 각 언어 문자 체계에 대한 기본 안내를 제공합니다.

**답변**: OK

---

### CQ1.4 스킬 유형 배치 레벨 (Skill Type Assignment Level)

**[KR]** PRD-CONTENT-BASE.md에서 "학습을 위한 유형이 스킬레벨에 있는 것이 맞을지 아니면 문장 레벨에 있는 것이 나을지 확인"이라고 되어 있습니다. 시제, 용도, 톤, 상황 유형을 스킬에 부여합니까, 문장에 부여합니까, 또는 둘 다입니까?

**[EN]** PRD-CONTENT-BASE.md asks whether skill types (tense, purpose, tone, situation) should be at the skill level or sentence level. Which approach?

**Why this matters**: 데이터 구조, 레이더 차트 분석, 학습자 강약점 파악 정확도에 직접 영향을 줍니다.

**기본추천안**: **하이브리드 방식** 권장합니다.

- **스킬 레벨**: 시제(Tense), 문형(Sentence Pattern) → 스킬의 핵심 학습 목표를 나타내므로 스킬에 부여
- **문장 레벨**: 용도(Purpose), 톤(Tone), 상황(Situation) → 같은 스킬 내에서도 문장마다 다를 수 있으므로 문장에 부여
- 레이더 차트 분석은 문장 레벨 유형을 기준으로 집계하여 세밀한 강약점 분석 가능

**답변**: OK (단 레이더차트 분석에서 문장의 상위스킬에 있는 스킬유형도 같이 포함하여 분석할 필요있음.) 이렇게 되면 현재 개발 중인 요구사항에 위배되는데 이 부분도 추후 요구사항 문서에 반영해서 시제, 문형은 스킬레벨에, 용도, 톤, 상황은 문장레벨에 적용하도록 함.

---

### CQ1.5 기초 레벨(1-10) 단어 학습 상세 (Foundation Level Vocabulary Details)

**[KR]** 기초 레벨에서 "문장을 구성하기 위한 최소 단어를 문장으로 취급하여 학습"한다고 되어 있습니다. 이때 단어 학습 카드의 형식을 확인합니다:

- 앞면(의미): 한국어 의미만 표시? 이미지 포함?
- 뒷면(표현): 단어만 표시? 발음 가이드 포함?

**[EN]** Foundation levels treat single words as sentences. What is the card format for word learning?

- Front (meaning): Korean meaning only? Include images?
- Back (expression): Word only? Include pronunciation guide?

**Why this matters**: 기초 레벨 콘텐츠 제작 형식과 데이터 구조에 영향을 줍니다.

**기본추천안**: 앞면에 한국어 의미(모국어 설정에 따라 영어 의미), 뒷면에 학습 언어 단어 + 힌트에 발음 가이드/부가 설명. 이미지는 초기 버전에서는 미포함.

**답변**: OK

---

## 2. 문장 관련 (Sentences)

### CQ2.1 스킬당 문장 수 기준 (Sentences per Skill Criteria)

**[KR]** "각 스킬을 학습하기에 적절한 스킬별 문장 개수를 스킬별로 산정"하라고 되어 있습니다. 모든 스킬에 동일한 문장 수를 적용합니까, 스킬 복잡도에 따라 차등 적용합니까?

**[EN]** Should all skills have the same number of sentences, or vary by skill complexity?

**Why this matters**: 전체 콘텐츠 양 산정, 개발 공수, 데이터 규모에 직접 영향을 줍니다.

**기본추천안**: 스킬 복잡도에 따라 차등 적용:

- 기초 단어 스킬(L1-10): 8-12개 (반복 노출 극대화)
- 기초 문법 스킬(L11-30): 7-10개
- 중급 스킬(L31-60): 5-8개
- 고급 스킬(L61-100): 5-7개

**답변**: OK

---

### CQ2.2 문장 길이 제한 (Sentence Length Limit)

**[KR]** 학습 문장의 최대 길이에 제한이 있습니까? 카드 UI에서 표시 가능한 글자 수와도 관련됩니다.

**[EN]** Is there a maximum sentence length? This relates to card UI display capacity.

**Why this matters**: UI 디자인, 폰트 크기, 카드 레이아웃에 영향을 줍니다.

**기본추천안**:

- 의미(한국어): 최대 50자
- 표현(학습 언어): 최대 10자 (영어 기준, 언어에 따라 조정)
- 기초 레벨 단어: 최대 20자

**답변**: 의미 70자, 표현 150자, 기초레벨 단어 20자

---

### CQ2.3 문장의 문화적 중립성 (Cultural Neutrality of Sentences)

**[KR]** 학습 문장이 특정 문화권에 편향되지 않아야 합니까? 아니면 각 언어 문화권의 특색을 반영해도 됩니까? (예: "추수감사절에 칠면조를 먹어요" vs "명절에 특별한 음식을 먹어요")

**[EN]** Should sentences be culturally neutral, or can they reflect specific cultural contexts?

**Why this matters**: 문장 도출 시 내용 선정 기준에 영향을 줍니다.

**기본추천안**: 의미 문장은 **문화 중립적**으로 작성합니다. 특정 문화 요소는 고급 레벨(L70+)의 "문화적 표현" 스킬에서만 다룹니다.

**답변**: OK

---

### CQ2.4 점진적 학습을 위한 어휘 관리 (Vocabulary Management for Progressive Learning)

**[KR]** "이전에 학습한 내용을 적절히 반복사용"하라고 되어 있습니다. 이를 위해 레벨별 허용 어휘 목록(controlled vocabulary)을 별도로 관리합니까?

**[EN]** PRD requires "appropriate repetition of previously learned content." Should a controlled vocabulary list be maintained per level?

**Why this matters**: 문장 작성 시 사용 가능한 단어 범위를 결정하며, 콘텐츠 품질 관리의 핵심입니다.

**기본추천안**: 레벨별 누적 어휘 목록을 관리합니다. 각 문장은 해당 레벨까지 학습된 단어로만 구성하되, 1-2개의 새 단어를 포함할 수 있으며 이 경우 힌트로 설명합니다 (Level 10 이후 적용).

**답변**: 기본적인 로직에는 동의합니다만, 새로 추가되는 단어의 수는 학습에 따라 목표한 수준의 언어능력에 필요한 단어를 알수 있도록 개수가 정해질 필요가 있겠습니다.

---

### CQ2.5 응용문장 처리 확인 (Variation Sentences Confirmation)

**[KR]** 기존 질의서(REQUIREMENTS-QUESTIONNAIRE.md) Q3.4에서 "응용문장 개념은 없애주세요"라고 답변하셨습니다. PRD-CONTENT-BASE.md 4.4절의 응용문장 도출과 관련 데이터 구조(문장형태, 기본문장ID)를 모두 제거하는 것이 맞습니까?

**[EN]** In Q3.4 of the requirements questionnaire, you requested removal of the "variation sentence" concept. Should we remove all related elements from PRD-CONTENT-BASE.md section 4.4 and the data structure (sentence_type, base_sentence_id)?

**Why this matters**: 데이터 구조 설계, 문장 수 산정, 콘텐츠 제작 분량에 직접 영향을 줍니다.

**기본추천안**: 응용문장 관련 전체 제거:

- PRD-CONTENT-BASE.md 4.4절(응용문장 도출) 삭제
- 문장 데이터 구조에서 "문장형태", "기본문장ID" 필드 삭제
- PRD-BASE.md에서 응용문장 관련 언급 삭제
- 대신, 같은 스킬 내 문장들이 난이도/패턴 다양성을 확보하도록 기본 문장 수를 충분히 확보

**답변**: 요구사항 정리 중 다시 응용문장의 개념이 필요해졌습니다. 다만, 구조적으로 문장세트 내 기본문장/응용문장을 담는 것이 아니라 문장 수준에서 기본과 응용을 구분해서 추후에 두가지 문장을 연관지어 기능을 제공하는 것을 검토 하고 있습니다. (기본문장 학습 후 응용문장 학습에 가중치를 두어 랜덤하게 출력한다와 같은 것을 고려)

---

## 3. 표현 관련 (Expressions)

### CQ3.1 표현 스타일 기준 (Expression Style Standard)

**[KR]** 각 언어 표현 작성 시 교과서적 표현과 실생활 구어체 중 어느 쪽을 우선합니까?

**[EN]** When writing expressions per language, should textbook-style or conversational expressions be prioritized?

**Why this matters**: 표현의 톤과 스타일이 학습 효과와 실용성에 직접 영향을 줍니다.

**기본추천안**: **실생활 구어체 우선**, 단 기초 레벨(L1-20)에서는 표준어/교과서 표현을 기본으로 하고, 중급 이상(L21+)부터 자연스러운 구어체를 점진적으로 도입합니다.

**답변**: OK

---

### CQ3.2 표현의 지역 변형 (Regional Variants in Expressions)

**[KR]** 각 언어의 지역별 차이를 어떻게 처리합니까?

- 영어: 미국식 vs 영국식
- 스페인어: 스페인 vs 중남미
- 중국어: 간체(대륙) vs 번체(대만)

**[EN]** How should regional variants be handled per language?

**Why this matters**: 표현 데이터의 일관성과 학습자 혼란 방지에 영향을 줍니다.

**기본추천안**: 각 언어 1개 표준 변형을 기본으로 합니다:

- 영어: 미국식 영어 기본
- 스페인어: 중립 스페인어 (중남미 + 스페인 공통)
- 중국어: 간체/보통화 기본
- 일본어: 표준어(東京標準語) 기본
- 한국어: 표준어(서울말) 기본

**답변**: OK

---

### CQ3.3 힌트 내용 범위 (Hint Content Scope)

**[KR]** 힌트는 "문장 내 새로 나온 어려운 단어나 숙어"를 설명합니다. 힌트의 언어는 모국어로 작성됩니까, 학습 언어로 작성됩니까? 또한 문법 설명도 힌트에 포함합니까?

**[EN]** Hints explain "new difficult words or idioms in sentences." Are hints in the native language or learning language? Should grammar explanations be included?

**Why this matters**: 힌트 콘텐츠 작성 언어와 범위에 영향을 줍니다.

**기본추천안**: 힌트는 **해당 표현의 언어로** 작성하되, 괄호 안에 모국어 번역을 포함합니다. 문법 설명은 간단한 경우만 포함합니다 (100자 제한 내).
예: "take off: 이륙하다, (옷을) 벗다 / phrasal verb"

**답변**: 문법을 포함하므로 300자 이내로 제한하겠습니다. 힌트UI에서 힌트의 양에 따라 힌트표시 UI가 가변되도록 할 예정입니다.

---

### CQ3.4 한국어 표현의 역할 (Korean Expression Role)

**[KR]** 한국어는 "의미" 문장의 기본 언어이면서 동시에 학습 대상 언어이기도 합니다. 한국어를 모국어로 설정한 학습자가 한국어를 학습 언어로 선택할 수 있습니까? 이 경우 의미와 표현이 동일 언어가 되는 문제가 있습니다.

**[EN]** Korean serves as both the default "meaning" language and a learning target language. Can a Korean native speaker select Korean as a learning language? This creates a meaning=expression conflict.

**Why this matters**: 학습 언어 선택 UI와 콘텐츠 표시 로직에 영향을 줍니다.

**기본추천안**: 모국어와 학습 언어가 동일한 경우는 선택 불가로 제한합니다. 모국어가 한국어인 학습자는 영어/스페인어/중국어/일어 중 선택, 모국어가 영어인 학습자는 한국어/스페인어/중국어/일어 중 선택.

**답변**: OK

---

## 4. 데이터 및 기술 관련 (Data & Technical)

### CQ4.1 콘텐츠 데이터 형식 (Content Data Format)

**[KR]** 최종 콘텐츠 데이터는 어떤 형식으로 생성합니까?

- SQL INSERT문 (Supabase PostgreSQL 직접 입력)
- CSV/Excel (관리자 웹 업로드 기능 활용)
- JSON (API 일괄 입력)

**[EN]** What format should final content data be generated in?

**Why this matters**: 콘텐츠 입력 파이프라인과 검증 프로세스에 영향을 줍니다.

**기본추천안**: SQL INSERT문 기본 생성 + CSV 백업 파일 동시 생성. SQL은 트랜잭션 단위로 레벨별 분할.

**답변**: OK (단, 데이터 입력은 양을 고려해서 10레벨 단위로 입력할 수 있도록 준비하면 좋겠습니다. )

---

### CQ4.2 콘텐츠 양 예측 확인 (Content Volume Estimation)

**[KR]** 현재 요건으로 예상되는 전체 콘텐츠 양을 확인합니다:

- 스킬: 300~500개
- 문장: 스킬당 평균 7개 = 약 2,100~3,500개
- 표현: 문장당 5개 언어 = 약 10,500~17,500개
- 합계: 약 13,000~21,000개 레코드

이 규모가 초기 버전으로 적절합니까?

**[EN]** Estimated content volume: ~300-500 skills, ~2,100-3,500 sentences, ~10,500-17,500 expressions. Is this appropriate for initial version?

**Why this matters**: 콘텐츠 제작 일정, DB 스토리지, 초기 데이터 로딩 시간에 영향을 줍니다.

**기본추천안**: 적절한 규모입니다. 단, 초기 출시 시 Level 1-30까지만 우선 제작하고, 이후 레벨은 순차적으로 추가하는 방안도 검토합니다.

**답변**: 초기 출시 시 모든 레벨의 콘텐츠를 작성해주십시오. 단, 데이터 입력은 양을 고려해서 10레벨 단위로 입력할 수 있도록 준비하면 좋겠습니다.

---

### CQ4.3 콘텐츠 품질 검증 프로세스 (Content QA Process)

**[KR]** 생성된 콘텐츠(스킬, 문장, 표현)의 검증은 AI 에이전트 자동 검증만으로 충분합니까, 사람의 검수가 필요합니까?

**[EN]** Is AI agent auto-verification sufficient for content QA, or is human review required?

**Why this matters**: 콘텐츠 품질 보증 수준과 일정에 영향을 줍니다.

**기본추천안**: AI 에이전트 교차 검증 후, 1차 산출물에 대해 PO(Product Owner) 샘플 검수 진행. 전수 검수는 비효율적이므로 레벨당 1-2개 스킬 랜덤 샘플링.

**답변**: AI 에이전트는 전수검수하고, PO는 샘플검수합니다.

---

> **다음 단계**: 질의서 답변이 완료되면, 답변을 반영하여 스킬 유형 분류 → 스킬 도출 → 문장 도출 → 표현 작성 순서로 콘텐츠 제작을 진행합니다.
