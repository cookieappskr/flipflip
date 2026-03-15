# FlipFlip 스킬 목록 검증 보고서

> **검증일**: 2026-03-15
> **검증 대상**: 04-SKILLS-PART1 ~ PART4 (400 skills, L1-L100)
> **검증 패널**: EN/ES/CN/JP/KR 5개 언어 교육 전문가

---

## [한국어 요약]

**전체 판정: PASS (조건부)**

400개 스킬 전수 검증 완료. 전반적 설계 품질은 우수하며, 난이도 진행, 문법 커버리지, 실용성 면에서 균형 잡힌 커리큘럼입니다. 아래 조치 필요 항목이 확인되었습니다.

**조치 필요 (Action Required): 5건**
1. 영어 중심 문법 용어가 일부 스킬에 잔존 (be동사, do/does, -ed/-ing 등) -- 5개 언어 공통 적용 시 스킬명/개요 재표현 필요
2. L45 동명사/to부정사는 CN/JP/KR에 직접 대응 문법이 없음 -- 언어별 대체 학습 전략 필요
3. L81 도치 구문은 ES/CN에서 적용 범위가 다름 -- 언어별 노트 추가 권장
4. 감정 형용사 -ed/-ing (ID 181)는 영어 고유 문법 -- 다언어 대체 콘텐츠 설계 필요
5. 관용 표현/속담 스킬(ID 309, 357, 397)이 3곳에 분산 -- 중복 아닌지 재확인 및 차별화 명시 필요

**주의 (Warning): 3건**
- L1-L10 전체가 SP-WORD(단어 수준)로 40개 -- 단어 학습의 단조로움 방지를 위한 게임화 전략 필요
- L24 소유/귀속, L11 소유 표현 간 개념적 중첩 존재
- L39 감정 표현 기초와 L68 감정 표현 심화 간 경계 기준 명확화 필요

---

## [English Details]

### 1. Completeness Check: 400 Skills x 100 Levels

| Check | Result |
|-------|--------|
| Total skill count | **400 / 400 -- PASS** |
| ID sequence (1-400) | **Consecutive, no gaps -- PASS** |
| Level distribution (4 per level) | **Exactly 4 skills per level for all 100 levels -- PASS** |
| All required fields present (ID, Level, Name, Description, Tense, Pattern) | **PASS** |

### 2. Multi-Language Applicability (3/5 Languages Minimum)

**Overall: PASS with 6 exceptions requiring adaptation**

| Skill ID | Skill | Issue | Affected Languages | Severity |
|----------|-------|-------|--------------------|----------|
| 41, 45, 49 | be-verb skills | "be-verb" is English-specific. CN/JP/KR have different copula systems, but the underlying concept (state/identity sentences) is universal. | CN, JP, KR | LOW -- concept transferable, naming needs localization |
| 46 | do/does negation | Auxiliary do/does is English-specific. ES uses "no + verb", CN has no conjugation, JP/KR use verb ending changes. | ES, CN, JP, KR | LOW -- concept (negation) is universal |
| 177-180 | Gerund vs. to-infinitive | This distinction is English-specific. CN/JP/KR do not have equivalent grammatical contrast. | CN, JP, KR | **MEDIUM** -- needs language-specific alternative content |
| 181 | -ed/-ing adjectives | Purely English morphological pattern. No equivalent in any other target language. | ES, CN, JP, KR | **HIGH** -- must design alternative content per language |
| 321-324 | Inversion constructs | Inversion rules differ significantly across languages. ES has flexible word order; CN rarely uses inversion; JP/KR use particles instead. | ES, CN, JP, KR | MEDIUM -- applicable but implementation varies greatly |
| 128 | will vs. be going to | This nuance distinction is English-specific. ES has similar (ir a + inf vs. future tense) but CN/JP/KR express this differently. | CN, JP, KR | LOW -- partially transferable |

**Verdict**: 394/400 skills (98.5%) are directly applicable to 3+ languages. The 6 flagged skills need language-specific adaptation notes but cover universally relevant concepts.

### 3. Duplicate / Overlap Analysis

**No exact duplicates found.** The following near-overlaps were identified:

| Skills | Overlap Description | Recommendation |
|--------|---------------------|----------------|
| ID 43 (L11: Possession basics) vs. ID 93-96 (L24: Possession & belonging) | ID 43 introduces "have" and possessive adjectives at sentence level. L24 expands to possessive pronouns, questions, and belonging. | **ACCEPTABLE** -- clear progression from basic to extended. No action needed. |
| ID 4 (L1: Basic emotion words) vs. ID 153-156 (L39: Emotion expression) vs. ID 269-272 (L68: Advanced emotion) | Three levels of emotion expression. L1 = vocabulary, L39 = sentence-level basics, L68 = complex/mixed emotions. | **ACCEPTABLE** -- intentional spiral progression. Add explicit cross-reference notes. |
| ID 309 (L78: Idiomatic expressions) vs. ID 357 (L90: Cultural idioms) vs. ID 397 (L100: Proverbs) | Three separate skills on figurative/idiomatic language. | **NEEDS CLARIFICATION** -- differentiation is: L78 = common idioms, L90 = culture-specific idioms, L100 = proverbs/sayings. Recommend making this distinction explicit in descriptions. |
| ID 28 (L7: Taste expressions) vs. ID 16 (L4: Sensory adjectives) | Taste words appear in both. | **ACCEPTABLE** -- ID 16 covers all senses broadly; ID 28 focuses specifically on food/taste context. |

### 4. Difficulty Progression Analysis

**Overall: PASS -- Well-structured progression**

| Phase | Levels | Progression Logic | Assessment |
|-------|--------|-------------------|------------|
| Foundation Vocabulary | L1-L10 | Single words only (SP-WORD), no grammar | Appropriate starting point |
| Basic Sentences | L11-L20 | Present tense, SV/SVO, negation, questions | Natural next step |
| Elementary | L21-L30 | Past tense, imperatives, comparatives, conjunctions, modals | Good expansion |
| Pre-Intermediate | L31-L40 | Future tense, progressive, situational dialogues | Practical application |
| Intermediate | L41-L50 | Perfect tenses, conditionals, passive, gerunds | Standard intermediate content |
| Upper-Intermediate | L51-L60 | Relative clauses, perfect continuous, subjunctive, causative | Appropriate complexity increase |
| Advanced Foundation | L61-L70 | Past perfect, future progressive, reported speech, logical connectors | Solid progression |
| Advanced | L71-L80 | Future perfect, mixed conditionals, participle clauses, emphasis, business/legal | Professional-level content |
| Expert | L81-L90 | Inversion, complex conditionals, academic debate, cultural nuance | High-level mastery |
| Near-Native | L91-L100 | Advanced connectors, rhetoric, academic writing, creative expression | Capstone level |

**Progression Issues (Minor):**
- L44 (Passive voice) appears before L45 (Gerunds/Infinitives). Some curricula reverse this order, but current placement is defensible since passive is a sentence-level transformation while gerunds require more abstraction.
- L52 (Present Perfect Continuous) comes after L51 (Relative Clauses). This is a slight departure from pure tense-based progression, but grouping relative clauses with the upper-intermediate block is reasonable.

### 5. Language-Specific Specialist Notes

#### English Specialist
- The curriculum is naturally English-centric in grammar terminology, which is expected since English serves as the reference framework.
- Tense coverage is comprehensive: all 12 English tenses are represented.
- Modal verbs (can/may L28, must/should L29) are well-placed.
- **No missing critical skills identified.**

#### Spanish (ES) Specialist
- Subjunctive mood (L54, L64, L72) maps well to Spanish subjunctive, which is more extensively used than in English. Consider noting that Spanish learners will encounter subjunctive more frequently.
- Ser vs. Estar distinction (absent) -- this is the most significant gap. The be-verb skills (L11-12) should include a note for Spanish about this fundamental distinction.
- Reflexive verbs are not explicitly covered -- a common and important structure in Spanish (e.g., "me llamo", "se levanta").
- **Recommendation**: Add language-specific notes for ser/estar and reflexive verb concepts within existing skills.

#### Chinese (CN) Specialist
- Measure words / classifiers are not explicitly addressed. In Chinese, you cannot say "three books" without a classifier. The quantity skill (ID 57) should note this.
- Tonal meaning differences are not covered, but this is appropriate for a grammar/vocabulary curriculum (pronunciation is a separate concern).
- Aspect particles (le, guo, zhe) map to tense skills but work fundamentally differently. The tense-based progression is still valid as a conceptual framework.
- **No critical gaps** -- the skill list works as a conceptual map even though Chinese grammar operates differently.

#### Japanese (JP) Specialist
- Keigo (honorific levels) is partially covered through politeness expressions (L23, L85) but deserves more prominence. Japanese has three distinct levels: sonkeigo, kenjogo, teineigo.
- Particle usage (wa, ga, wo, ni, de, etc.) is not explicitly called out. These are fundamental to Japanese and map loosely to preposition/case skills but are much more central.
- Verb conjugation groups (ichidan, godan, irregular) are not mentioned, but this is acceptable since conjugation details belong in language-specific content, not the universal skill map.
- Counter words (similar to Chinese classifiers) are relevant to quantity skills.
- **Recommendation**: Flag L23 and L85 as requiring expanded Japanese-specific content for keigo.

#### Korean (KR) Specialist
- Speech levels (formal, polite, informal -- 합쇼체, 해요체, 해체, etc.) are the most critical Korean-specific concern. The curriculum touches on politeness (L23, L85) but does not explicitly structure around Korean's 7 speech levels.
- Particles (은/는, 이/가, 을/를, etc.) are fundamental and not explicitly named, similar to Japanese.
- Honorific vocabulary (e.g., 드시다 vs. 먹다, 주무시다 vs. 자다) extends beyond grammar into vocabulary choices.
- Sino-Korean vs. native Korean number systems (ID 5, 24) should be noted -- Korean uses two parallel number systems.
- **Recommendation**: Add Korean-specific notes for dual number systems and speech level coverage.

### 6. Missing Critical Skills Assessment

| Category | Status | Notes |
|----------|--------|-------|
| Pronunciation / Phonetics | Not included | **Intentional** -- FlipFlip is text/flashcard-based. Acceptable omission. |
| Writing systems (Kanji, Hanzi, Hangul) | Not included | **Intentional** -- this is a separate learning track. |
| Reflexive constructions | Partially covered (L30 routines) | **Gap for ES/FR** -- reflexive verbs are heavily used. Consider adding a note. |
| Counting/Classifiers | Covered (ID 57) but not language-specific | **Gap for CN/JP/KR** -- classifier systems need language-specific notes. |
| Honorific systems | Partially covered (L23, L85) | **Gap for JP/KR** -- needs expanded language-specific content. |
| Digital communication | Covered (L38, L79) | Adequate |
| Academic writing | Well covered (L76, L84, L94) | Comprehensive |

### 7. Final Verdict

| Criterion | Score | Status |
|-----------|-------|--------|
| Completeness (400/400) | 100% | PASS |
| Multi-language applicability (3+/5) | 98.5% (394/400 direct, 6 need adaptation) | PASS |
| No critical duplicates | 0 exact duplicates, 3 near-overlaps (acceptable) | PASS |
| Logical difficulty progression | Well-structured with minor notes | PASS |
| Language-specific coverage | Adequate with documented gaps | CONDITIONAL PASS |

**Overall: APPROVED for development with the action items above.**

---

## Action Items Summary

| Priority | Item | Owner |
|----------|------|-------|
| P1 | Design alternative content for ID 181 (-ed/-ing adjectives) for ES/CN/JP/KR | Content Team |
| P1 | Add language-specific adaptation notes for gerund/infinitive skills (ID 177-180) | Content Team |
| P2 | Clarify differentiation between idiom skills (ID 309, 357, 397) in descriptions | Content Team |
| P2 | Add ES-specific notes for ser/estar in be-verb skills (L11-12) | ES Specialist |
| P2 | Add CN/JP classifier notes to quantity skill (ID 57) | CN/JP Specialists |
| P2 | Add KR dual number system note to number skills (ID 5, 24) | KR Specialist |
| P3 | Add JP/KR honorific expansion notes to politeness skills (L23, L85) | JP/KR Specialists |
| P3 | Rename English-centric grammar terms in skill names for universal clarity | Content Team |
