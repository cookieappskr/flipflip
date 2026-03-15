# FlipFlip 스킬 유형 분류 체계 (Skill Type Taxonomy)

> **Purpose**: Define major/minor categories for skill types used in learner analytics (radar chart) and content tagging.
>
> **작성일**: 2026-03-15
>
> **적용 기준**: 기초 단어 스킬(Level 1-10)에는 스킬 유형을 적용하지 않음. Level 11 이상부터 적용.

---

## 유형 배치 원칙 (Type Assignment Principle)

CQ1.4 질의서 기본추천안에 따른 **하이브리드 방식**:

| 유형 | 배치 레벨 | 이유 |
|------|-----------|------|
| **시제 (Tense)** | 스킬 레벨 | 스킬의 핵심 학습 목표 |
| **문형 (Sentence Pattern)** | 스킬 레벨 | 스킬의 핵심 학습 목표 |
| **용도 (Purpose)** | 문장 레벨 | 같은 스킬 내 문장마다 다를 수 있음 |
| **톤 (Tone)** | 문장 레벨 | 같은 스킬 내 문장마다 다를 수 있음 |
| **상황 (Situation)** | 문장 레벨 | 같은 스킬 내 문장마다 다를 수 있음 |

---

## 1. 시제 (Tense) — 스킬 레벨 부여

> 스킬이 주로 다루는 시제를 나타냅니다. 기초 단어 스킬(L1-10)에는 해당 없음.

| 코드 | 대구분 | 소구분 코드 | 소구분명 (KR) | 소구분명 (EN) | 적용 레벨 범위 |
|------|--------|------------|---------------|---------------|---------------|
| T | 시제 | T-PRES | 현재 | Present | L11+ |
| T | 시제 | T-PAST | 과거 | Past | L21+ |
| T | 시제 | T-FUT | 미래 | Future | L31+ |
| T | 시제 | T-PPERF | 현재완료 | Present Perfect | L41+ |
| T | 시제 | T-PAPERF | 과거완료 | Past Perfect | L51+ |
| T | 시제 | T-FPERF | 미래완료 | Future Perfect | L71+ |
| T | 시제 | T-PCONT | 현재진행 | Present Continuous | L21+ |
| T | 시제 | T-PACONT | 과거진행 | Past Continuous | L41+ |
| T | 시제 | T-FCONT | 미래진행 | Future Continuous | L61+ |
| T | 시제 | T-PPCON | 현재완료진행 | Present Perfect Continuous | L61+ |
| T | 시제 | T-MIX | 혼합시제 | Mixed Tenses | L71+ |
| T | 시제 | T-NA | 시제 무관 | Tense N/A | L11+ |

**참고**: 중국어는 시제 변화가 아닌 시간부사/조사(了, 过, 着)로 시제를 표현하므로, 스킬의 시제 유형은 "의미적 시제"를 기준으로 합니다.

---

## 2. 문형 (Sentence Pattern) — 스킬 레벨 부여

> 스킬이 다루는 문장의 구조적 형태를 나타냅니다.

| 코드 | 대구분 | 소구분 코드 | 소구분명 (KR) | 소구분명 (EN) | 적용 레벨 범위 |
|------|--------|------------|---------------|---------------|---------------|
| SP | 문형 | SP-WORD | 단어 | Single Word | L1-10 |
| SP | 문형 | SP-SV | 주어+동사 | Subject+Verb | L11+ |
| SP | 문형 | SP-SVO | 주어+동사+목적어 | Subject+Verb+Object | L11+ |
| SP | 문형 | SP-SVOO | 주어+동사+간접목적어+직접목적어 | S+V+IO+DO | L21+ |
| SP | 문형 | SP-SVOC | 주어+동사+목적어+보어 | S+V+O+Complement | L31+ |
| SP | 문형 | SP-NEG | 부정문 | Negative | L11+ |
| SP | 문형 | SP-QUES | 의문문 | Question | L11+ |
| SP | 문형 | SP-IMP | 명령/청유문 | Imperative | L21+ |
| SP | 문형 | SP-PASS | 수동태 | Passive Voice | L41+ |
| SP | 문형 | SP-COND | 조건문 | Conditional | L41+ |
| SP | 문형 | SP-REL | 관계절 | Relative Clause | L51+ |
| SP | 문형 | SP-COMP | 복합문 | Compound Sentence | L41+ |
| SP | 문형 | SP-CPLX | 복문 | Complex Sentence | L51+ |
| SP | 문형 | SP-SUBJ | 가정법 | Subjunctive | L61+ |
| SP | 문형 | SP-IND | 간접화법 | Indirect Speech | L61+ |
| SP | 문형 | SP-EMPH | 강조구문 | Emphatic Structure | L71+ |
| SP | 문형 | SP-INV | 도치구문 | Inverted Structure | L81+ |
| SP | 문형 | SP-PAR | 분사구문 | Participial Phrase | L71+ |
| SP | 문형 | SP-MIX | 혼합문형 | Mixed Patterns | L81+ |

---

## 3. 용도 (Purpose) — 문장 레벨 부여

> 해당 문장이 의사소통에서 수행하는 기능을 나타냅니다.

| 코드 | 대구분 | 소구분 코드 | 소구분명 (KR) | 소구분명 (EN) | 아이콘 제안 |
|------|--------|------------|---------------|---------------|-----------|
| P | 용도 | P-STATE | 서술/진술 | Statement | 💬 |
| P | 용도 | P-QUEST | 질문 | Question | ❓ |
| P | 용도 | P-REQ | 요청 | Request | 🙏 |
| P | 용도 | P-CMD | 명령 | Command | ⚡ |
| P | 용도 | P-SUG | 제안/권고 | Suggestion | 💡 |
| P | 용도 | P-PERS | 설득 | Persuasion | 🎯 |
| P | 용도 | P-EXPL | 설명 | Explanation | 📖 |
| P | 용도 | P-GREET | 인사 | Greeting | 👋 |
| P | 용도 | P-THANK | 감사 | Gratitude | 🙂 |
| P | 용도 | P-APOL | 사과 | Apology | 😔 |
| P | 용도 | P-AGREE | 동의/반대 | Agreement/Disagreement | 👍 |
| P | 용도 | P-COMP | 비교 | Comparison | ⚖️ |
| P | 용도 | P-OPIN | 의견 표현 | Opinion | 🗣️ |
| P | 용도 | P-EMOT | 감정 표현 | Emotion | ❤️ |
| P | 용도 | P-WARN | 경고/주의 | Warning | ⚠️ |
| P | 용도 | P-PROM | 약속 | Promise | 🤝 |
| P | 용도 | P-NARR | 서사/이야기 | Narration | 📝 |

---

## 4. 톤 (Tone) — 문장 레벨 부여

> 해당 문장의 격식/존대 수준을 나타냅니다.

| 코드 | 대구분 | 소구분 코드 | 소구분명 (KR) | 소구분명 (EN) | 색상 제안 |
|------|--------|------------|---------------|---------------|----------|
| TN | 톤 | TN-CASU | 비격식 (반말/일상) | Casual/Informal | #4CAF50 (Green) |
| TN | 톤 | TN-NEUT | 중립 (일반) | Neutral | #2196F3 (Blue) |
| TN | 톤 | TN-FORM | 격식 (존대/공식) | Formal/Polite | #9C27B0 (Purple) |
| TN | 톤 | TN-PROF | 전문/비즈니스 | Professional/Business | #FF9800 (Orange) |

---

## 5. 상황 (Situation) — 문장 레벨 부여

> 해당 문장이 사용되는 장소/맥락을 나타냅니다.

| 코드 | 대구분 | 소구분 코드 | 소구분명 (KR) | 소구분명 (EN) | 아이콘 제안 |
|------|--------|------------|---------------|---------------|-----------|
| S | 상황 | S-HOME | 집/가정 | Home/Family | 🏠 |
| S | 상황 | S-WORK | 직장/사무실 | Workplace/Office | 💼 |
| S | 상황 | S-SCHOOL | 학교/교육 | School/Education | 🎓 |
| S | 상황 | S-TRAVEL | 여행/교통 | Travel/Transportation | ✈️ |
| S | 상황 | S-SHOP | 쇼핑/상점 | Shopping/Store | 🛒 |
| S | 상황 | S-REST | 식당/카페 | Restaurant/Cafe | 🍽️ |
| S | 상황 | S-HOSP | 병원/의료 | Hospital/Medical | 🏥 |
| S | 상황 | S-SOCIAL | 사교/모임 | Social Gathering | 🎉 |
| S | 상황 | S-PHONE | 전화/온라인 | Phone/Online | 📱 |
| S | 상황 | S-BANK | 은행/관공서 | Bank/Government Office | 🏦 |
| S | 상황 | S-SPORT | 운동/레저 | Sports/Leisure | ⚽ |
| S | 상황 | S-MEDIA | 미디어/문화 | Media/Culture | 🎬 |
| S | 상황 | S-NATURE | 자연/날씨 | Nature/Weather | 🌿 |
| S | 상황 | S-GENERAL | 일반/기타 | General/Others | 📌 |

---

## 유형 관리 DB 매핑

위 유형들은 관리자 웹의 **유형관리** 기능을 통해 관리됩니다.

```
유형관리 구조:
├── TENSE (시제) — parent
│   ├── T-PRES (현재)
│   ├── T-PAST (과거)
│   └── ...
├── SENT_PATTERN (문형) — parent
│   ├── SP-SV (주어+동사)
│   └── ...
├── PURPOSE (용도) — parent
│   ├── P-STATE (서술)
│   └── ...
├── TONE (톤) — parent
│   ├── TN-CASU (비격식)
│   └── ...
└── SITUATION (상황) — parent
    ├── S-HOME (집)
    └── ...
```

### 유형 테이블 컬럼 매핑

| 유형관리 컬럼 | 용도 |
|--------------|------|
| 유형명 | 소구분명 (KR) |
| 유형코드 | 소구분 코드 |
| 표시순번 | 표시 순서 |
| value | 해당 유형의 값 (시제 없음, 익힘수준 기준점수 등) |
| description | 소구분명 (EN) + 부가 설명 |
| color | 색상 코드 (예: #4CAF50) |
| icon | 아이콘명 (예: home, briefcase 등) |
| 부가속성1~5 | 예비 필드 |
| 사용여부 | 활성/비활성 |

---

## 레이더 차트 분석 기준

학습자 강약점 레이더 차트는 **문장 레벨 유형**(용도, 톤, 상황)을 기준으로 집계합니다:

1. **용도별 레이더 차트**: 17개 용도별 익힘수준 평균을 원어민 기준 대비 백분율로 표시
2. **상황별 레이더 차트**: 14개 상황별 익힘수준 평균을 원어민 기준 대비 백분율로 표시
3. **톤별 바 차트**: 4개 톤별 익힘수준 분포 표시

이를 통해 학습자는 "질문 표현이 약하다", "직장 상황 대화가 부족하다" 등 구체적인 약점을 파악할 수 있습니다.
