# FlipFlip 상세요구사항 질의서 (Requirements Questionnaire)

> **목적**: PRD-BASE.md 기반으로 구현 착수 전 Product Owner로부터 확인이 필요한 상세 요구사항을 수집합니다.
>
> **Purpose**: Collect detailed requirements from the Product Owner before implementation begins, based on PRD-BASE.md.
>
> **작성일**: 2026-03-14
>
> **응답방법**: 각 질문에 대해 답변을 작성하거나, "기본추천안 수용" 시 "OK"로 표기해 주세요.

---

## 1. 시스템 아키텍처 (System Architecture)

### Q1.1 모노레포 구조 (Monorepo Structure)

**[KR]** 관리자웹, 사용자웹, API, 모바일앱을 Turborepo 기반 모노레포로 구성할 예정입니다. 각 앱의 패키지명과 디렉터리 구조에 대해 선호하는 형태가 있습니까?

**[EN]** We plan to use a Turborepo-based monorepo for admin web, user web, API, and mobile app. Do you have a preferred naming convention or directory structure?

**Why this matters**: 프로젝트 초기 scaffolding과 CI/CD 파이프라인 구성에 직접 영향을 줍니다.

**기본추천안**: `apps/admin`, `apps/web`, `apps/mobile`, `packages/shared-ui`, `packages/shared-utils`, `packages/db` 구조

**답변**: OK

---

### Q1.2 API 서버 구성 (API Server Configuration)

**[KR]** PRD에서 API가 별도 시스템으로 언급되어 있습니다. Supabase Edge Functions만으로 구성할 것인지, 별도 Next.js API Routes 또는 독립 서버(Express/Fastify 등)를 사용할 것인지 확인이 필요합니다.

**[EN]** The PRD mentions API as a separate system. Should we use Supabase Edge Functions only, Next.js API Routes, or a standalone server (Express/Fastify)?

**Why this matters**: 서버 인프라 비용, 배포 전략, 콜드 스타트 이슈에 영향을 줍니다.

**기본추천안**: Supabase Edge Functions(Deno) 기본 + 복잡한 비즈니스 로직은 Next.js API Routes에서 처리

**답변**: OK

---

### Q1.3 실시간 기능 필요 여부 (Real-time Features)

**[KR]** 학습 데이터 동기화, 알림 등에 실시간 기능(WebSocket/Supabase Realtime)이 필요합니까? 아니면 REST 폴링 방식으로 충분합니까?

**[EN]** Do learning data sync or notifications require real-time features (WebSocket/Supabase Realtime), or is REST polling sufficient?

**Why this matters**: 아키텍처 복잡도와 Supabase 요금 티어 선택에 영향을 줍니다.

**기본추천안**: 초기에는 REST 방식, 향후 필요 시 Supabase Realtime 도입

**답변**: OK

---

### Q1.4 CDN 및 정적 자산 관리 (CDN & Static Assets)

**[KR]** 프로필 이미지, 온보딩 콘텐츠, 레벨업 공유 이미지 등 정적 자산의 저장소를 어디로 할 예정입니까?

**[EN]** Where should static assets (profile images, onboarding content, level-up share images) be stored?

**Why this matters**: 이미지 업로드/리사이징 파이프라인과 비용에 영향을 줍니다.

**기본추천안**: Supabase Storage + Vercel/Cloudflare CDN 캐싱

**답변**: OK

---

## 2. 인증 및 회원관리 (Auth & User Management)

### Q2.1 전화번호 인증 제공자 (Phone Verification Provider)

**[KR]** 회원가입 시 전화번호 인증(필수)을 위한 SMS 인증 서비스 제공자는 어디를 사용할 예정입니까? 국내/해외 각각 다른 제공자를 사용합니까?

**[EN]** Which SMS verification provider will be used for required phone verification during sign-up? Different providers for domestic vs. international?

**Why this matters**: API 연동 개발, 비용 산출, 국가별 발송 가능 여부에 영향을 줍니다.

**기본추천안**: 국내 - Naver Cloud SENS 또는 NHN Toast, 해외 - Twilio

**답변**: OK

---

### Q2.2 성인 인증 기준 (Age Verification Standard)

**[KR]** PRD에 "성인만 이용가능"으로 되어 있습니다. 성인 기준 나이는 국가별로 다릅니다 (한국 만 19세, 미국/EU 만 18세 등). 국가별로 다르게 적용합니까, 일괄 기준입니까?

**[EN]** PRD states "adults only." Age of majority varies by country (Korea: 19, US/EU: 18). Should this be country-specific or a single global threshold?

**Why this matters**: 생년월일 검증 로직과 법적 준수 범위에 영향을 줍니다.

**기본추천안**: 사용자 국가 기준으로 해당 국가 성인 기준 적용. 판별 불가 시 만 18세 기본.

**답변**: OK

---

### Q2.3 닉네임 규칙 (Nickname Rules)

**[KR]** 닉네임의 최소/최대 길이, 허용 문자(한글, 영문, 숫자, 특수문자), 금칙어 필터링 적용 여부를 확인해 주십시오.

**[EN]** Please specify: min/max length, allowed characters (Korean, English, numbers, special chars), and profanity filter requirements for nicknames.

**Why this matters**: 입력 밸리데이션, DB 컬럼 설계, 검색 기능에 영향을 줍니다.

**기본추천안**: 2~16자, 한글/영문/숫자 허용, 특수문자 불가, 기본 금칙어 필터 적용

**답변**: OK

---

### Q2.4 계정 삭제 및 휴면 정책 (Account Deletion & Dormancy)

**[KR]** 회원 탈퇴 시 데이터 처리 방식(즉시 삭제, 30일 유예 후 삭제 등)과 장기 미접속 시 휴면 전환 정책이 있습니까?

**[EN]** What is the data handling policy for account deletion (immediate vs. 30-day grace period)? Is there a dormancy policy for long-term inactive users?

**Why this matters**: 개인정보보호법 준수, 데이터 보관 정책, soft delete 설계에 영향을 줍니다.

**기본추천안**: 탈퇴 요청 후 30일 유예(복원 가능), 이후 개인정보 파기. 1년 미접속 시 휴면 전환.

**답변**: OK

---

### Q2.5 추천인 보상 정책 상세 (Referral Reward Details)

**[KR]** PRD에 "친구가입 완료하면 일주일 무료쿠폰 지급"이라고 되어 있는데, 이 쿠폰은 추천인에게 지급되는 것입니까, 피추천인에게 지급되는 것입니까, 양쪽 모두입니까?

**[EN]** PRD says "one week free coupon on friend sign-up completion." Is this coupon for the referrer, the referee, or both?

**Why this matters**: 쿠폰 발급 로직과 마일리지 시스템 설계에 영향을 줍니다.

**기본추천안**: 양쪽 모두에게 1주일 무료쿠폰 지급

**답변**: OK

---

### Q2.6 관리자 계정 확장 (Admin Account Expansion)

**[KR]** 현재 관리자 로그인은 help@cookieapps.kr 이메일만 허용됩니다. 향후 관리자를 추가할 계획이 있습니까? 역할 기반 접근 제어(RBAC)가 필요합니까?

**[EN]** Currently only help@cookieapps.kr is allowed for admin login. Are there plans to add more admins? Is role-based access control (RBAC) needed?

**Why this matters**: 관리자 인증 구조를 화이트리스트 방식 vs RBAC 방식으로 설계할지 결정합니다.

**기본추천안**: 초기에는 화이트리스트 방식(DB 테이블에 허용 이메일 관리), 향후 RBAC 확장 가능하도록 설계

**답변**: 초기부터 RBAC 확장가능하도록 설계

---

## 3. 콘텐츠 관리 시스템 (Content Management - Admin)

### Q3.1 콘텐츠 대량 입력 (Bulk Content Import)

**[KR]** 레벨 100개 x 스킬 5개 x 문장 다수 x 표현 다수로 콘텐츠 양이 상당합니다. CSV/Excel 파일을 통한 대량 업로드 기능이 필요합니까?

**[EN]** With 100 levels x ~5 skills x many sentences x many expressions, content volume is substantial. Is CSV/Excel bulk upload needed?

**Why this matters**: 콘텐츠 초기 세팅과 운영 효율성에 직접 영향을 줍니다.

**기본추천안**: CSV 업로드 + 다운로드(백업) 기능 제공. 검증 로직 포함.

**답변**: OK

---

### Q3.2 콘텐츠 버전 관리 (Content Versioning)

**[KR]** 문장이나 표현이 수정될 때 이전 버전을 보관해야 합니까? 학습 중인 사용자의 데이터와 충돌 처리는 어떻게 합니까?

**[EN]** Should previous versions be preserved when sentences or expressions are modified? How should conflicts with active learners' data be handled?

**Why this matters**: 콘텐츠 수정 시 기존 학습 데이터의 정합성 유지 방안이 필요합니다.

**기본추천안**: 수정 시 변경 이력 테이블에 기록. 학습 중인 데이터는 다음 동기화 시점에 업데이트.

**답변**: 변경이력 필요없음. 일부 문장 변경은 큰 이슈가 아니므로 사용자에게 일반론적 관점에서 서비스약관이나 서비스화면에서 고지 하는 정도로 처리하면 됨.

---

### Q3.3 문장당 표현 언어 범위 (Expression Language Scope)

**[KR]** 표현은 "언어별"로 관리된다고 되어 있습니다. 초기 지원 표현 언어 목록을 확인해 주십시오. (예: 영어, 일본어, 중국어, 스페인어 등)

**[EN]** Expressions are managed "per language." Please confirm the initial set of expression languages (e.g., English, Japanese, Chinese, Spanish, etc.).

**Why this matters**: DB 스키마의 언어 코드 관리, 콘텐츠 제작 분량 산정에 영향을 줍니다.

**기본추천안**: 초기 영어만 (학습 언어). 의미는 한국어 + 영어. 향후 일본어, 중국어 확장.

**답변**: 초기부터 영어, 스페인어, 중국어, 일어 4개국어 적용

---

### Q3.4 응용 문장 구조 (Applied/Variation Sentences)

**[KR]** PRD에 "응용문장 개념"이 언급되어 있습니다. 응용문장은 기본문장과 어떤 관계(1:N)로 관리되며, 별도 테이블입니까 아니면 같은 문장 테이블에 parent_id 방식입니까?

**[EN]** PRD mentions "applied/variation sentences." How are they related to base sentences (1:N)? Separate table or same table with parent_id?

**Why this matters**: DB 스키마 설계와 학습 엔진의 문장 선택 로직에 영향을 줍니다.

**기본추천안**: 같은 문장 테이블에 `parent_sentence_id` 필드 추가 (null이면 기본 문장)

**답변**: 응용문장 개념은 없애주세요. 기초요건에서 삭제해야 하는데 삭제가 되지 않았습니다. 기초요건도 수정가능하다면 해당 부분은 수정해주세요.

---

### Q3.5 상황 태그 아이콘/색상 관리 (Context Tag Icons & Colors)

**[KR]** 시제, 용도, 톤, 장소 등 상황표시 태그의 아이콘과 색상은 고정값입니까, 관리자가 관리할 수 있어야 합니까?

**[EN]** Are the icons and colors for context tags (tense, purpose, tone, place) fixed or should they be admin-configurable?

**Why this matters**: 유형관리 시스템의 확장 범위와 디자인 시스템 설계에 영향을 줍니다.

**기본추천안**: 유형관리에서 부가속성으로 아이콘명, 색상 코드를 관리하여 운영 중 변경 가능하게 함

**답변**: 유형관리 부가속성에서 아이콘명, 색상코드를 관리하려고 합니다. 그 관점에서 유형관리의 속성을 value, description외에 color, icon 도 비필수요건으로 컬럼을 추가해주세요.

---

## 4. 학습 엔진 (Learning Engine)

### Q4.1 망각곡선 알고리즘 상세 (Forgetting Curve Algorithm Details)

**[KR]** PRD에 익힘수준별 다음학습간격이 유형관리에서 관리된다고 되어 있습니다. 기본 초기값(분 단위)을 확인해 주십시오. 예시가 "매우익숙 = 7일, 익숙 = 1일"로 언급되었는데, "완벽", "미비", "첫암기"의 간격도 확인이 필요합니다.

**[EN]** PRD mentions review intervals managed via type management. Please confirm initial default values (in minutes) for all mastery levels: "Perfect," "Very Familiar," "Familiar," "Weak," and "First Memorization."

**Why this matters**: 학습 엔진의 핵심 로직으로, 전체 학습 경험과 효과에 직결됩니다.

**기본추천안**: 첫암기=30분, 미비=4시간(240분), 익숙=1일(1440분), 매우익숙=7일(10080분), 완벽=30일(43200분)

**답변**: 네. 그렇게 해주세요. 다만 해당 시간또한 유형관리에서 value 값으로 관리가능하도록 해야 합니다.

---

### Q4.2 체크점수 감소 메커니즘 (Score Decrease Mechanism)

**[KR]** "못 맞춤" 시 점수가 0점으로 되어 있는데, 기존 누적점수에서 감점이 발생합니까? 예를 들어 익힘점수가 5점(매우익숙)인 상태에서 "못 맞춤"을 선택하면 점수가 어떻게 변합니까?

**[EN]** When "Missed" (0 points), does the accumulated score decrease? For example, if mastery score is 5 (Very Familiar) and user selects "Missed," what happens to the score?

**Why this matters**: 점수 계산 로직과 레벨 다운 가능성 여부에 영향을 줍니다.

**기본추천안**: "못 맞춤" 시 누적 점수에서 -1점 감점 (최소 0점). 이에 따라 익힘수준도 하향 조정.

**답변**: 네. 그렇게 해주십시오. 다만, 감소점수 또한 유형관리에서 체크유형의 value 값으로 관리할 수 있어야 하며, 누적점수는 0점이 하한선이라 음수는 되지 않도록 제약을 해야 ㅎ바니다.

---

### Q4.3 하루 학습 완료 기준 (Daily Learning Completion Criteria)

**[KR]** 마일리지에서 "하루 학습완료 시 10pt"라고 되어 있습니다. "학습완료"의 정의가 필요합니다. 최소 체크 횟수, 최소 학습 시간, 또는 해당일 도래한 문장 전부 학습 등?

**[EN]** PRD mentions "10pt for daily learning completion." What defines "completion"? Minimum checks, minimum time, or all due sentences reviewed?

**Why this matters**: 마일리지 정책, 연속학습 판정, UI 표시 로직에 영향을 줍니다.

**기본추천안**: 해당일 도래한 학습 문장 중 최소 20개 이상 체크 완료 시 학습완료로 인정

**답변**: 중요한 질문입니다. 하루학습완료 기준은 최소학습개수 이상 체크완료 시 학습완료로 인정하는데, 일학습목표시간 유형에 따라 달라져야 일학습목표시간은 회원가입 후 진단단계에서 언어와 하루학습시간을 선택하는데 이때 선택한 학습시간 유형 (5분, 15분, 30분, 1시간, 2시간, 2시간이상)에 따라 해당 유형의 부가속성1의 값을 기준으로 합니다. 분당 1문장을 기준으로 합니다. 또한 하루의 기준은 24시 이전을 의미합니다.

---

### Q4.4 레벨 테스트 문제 형식 (Level Test Question Format)

**[KR]** 레벨 테스트 시 "의미를 표시하고 맞추면"이라고 되어 있습니다. 맞추는 방식이 무엇입니까? 객관식(4지선다), 주관식 타이핑, 또는 일반 학습처럼 자기 판단(완벽/대부분/못맞춤)?

**[EN]** During level test, "show meaning and check if correct" - what is the answer format? Multiple choice, typed input, or self-assessment like regular learning?

**Why this matters**: 레벨 테스트 UI 설계와 정답 판정 로직에 영향을 줍니다.

**기본추천안**: 일반 학습과 동일한 자기 판단 방식 (카드 뒤집기 후 완벽/대부분/못맞춤 선택)

**답변**: OK

---

### Q4.5 학습 세션 문장 수 제한 (Session Sentence Limit)

**[KR]** 한 학습 세션에서 표시되는 문장의 최대 수에 제한이 있습니까? 도래한 문장이 100개 이상일 때 전부 보여줍니까?

**[EN]** Is there a maximum number of sentences per learning session? If 100+ sentences are due, are all shown?

**Why this matters**: UX 및 로컬 DB 메모리 사용량, 학습 부담도에 영향을 줍니다.

**기본추천안**: 한 세션 최대 50문장. 추가 학습은 "더 학습하기" 버튼으로 진행.

**답변**: OK

---

### Q4.6 레벨 다운 가능 여부 (Level Downgrade)

**[KR]** 레벨업 후 해당 레벨의 스킬들이 오랜 기간 학습하지 않아 익힘수준이 떨어질 경우 레벨이 다시 내려갈 수 있습니까?

**[EN]** Can a user's level decrease if mastery scores drop after leveling up due to long absence?

**Why this matters**: 학습 데이터 모델과 레벨 관리 로직의 복잡도에 영향을 줍니다.

**기본추천안**: 레벨 다운 없음. 한번 클리어한 레벨은 유지. 단, 해당 레벨 문장은 망각곡선에 따라 계속 복습 대상에 포함.

**답변**: OK

---

## 5. 유료화 및 결제 (Monetization & Payments)

### Q5.1 결제 PG사 선정 (Payment Gateway Selection)

**[KR]** 국내 PG사(토스페이먼츠, 이니시스, KG이니시스 등)와 해외 PG사(Stripe, PayPal 등) 중 어떤 것을 사용할 예정입니까?

**[EN]** Which payment gateways will be used? Domestic (TossPayments, Inicis, etc.) and international (Stripe, PayPal, etc.)?

**Why this matters**: 결제 SDK 연동, 수수료율, 지원 결제 수단에 영향을 줍니다.

**기본추천안**: 국내 - 토스페이먼츠, 해외 - Stripe

**답변**: OK

---

### Q5.2 인앱결제 수수료 대응 (In-App Purchase Commission Strategy)

**[KR]** 모바일 인앱결제(Apple 30%, Google 15~30%)와 외부결제를 모두 제공한다고 되어 있습니다. 인앱결제와 외부결제의 가격을 동일하게 합니까, 차등 적용합니까?

**[EN]** Both in-app and external payments are offered. Will pricing be identical or differentiated to account for app store commissions (Apple 30%, Google 15-30%)?

**Why this matters**: 가격 정책과 앱스토어 심사 규정 준수에 영향을 줍니다.

**기본추천안**: 동일 가격 적용. 앱스토어 정책상 외부결제 유도 시 리젝 위험이 있으므로 신중하게 접근.

**답변**: OK

---

### Q5.3 구독 갱신 및 해지 정책 (Subscription Renewal & Cancellation)

**[KR]** 구독은 자동 갱신입니까, 수동 갱신입니까? 중도 해지 시 잔여 기간 환불 정책은 어떻게 됩니까?

**[EN]** Is subscription auto-renewal or manual? What is the refund policy for mid-term cancellations?

**Why this matters**: 결제 시스템의 recurring billing 구현과 환불 로직에 영향을 줍니다.

**기본추천안**: 자동 갱신. 중도 해지 시 잔여 기간까지 서비스 이용 가능 (잔여분 환불 없음).

**답변**: OK

---

### Q5.4 무료 체험 기간 기산점 (Free Trial Start Point)

**[KR]** "30일간 무료사용"의 시작점은 가입일 기준입니까, 첫 학습일 기준입니까? 가입 후 바로 사용하지 않으면 어떻게 됩니까?

**[EN]** Does the 30-day free trial start from sign-up date or first learning session? What if the user doesn't start learning immediately?

**Why this matters**: 무료 기간 만료 계산 로직에 영향을 줍니다.

**기본추천안**: 가입일 기준으로 30일

**답변**: OK

---

### Q5.5 쿠폰 시스템 상세 (Coupon System Details)

**[KR]** 마일리지 교환 쿠폰(10,000pt = 1주 학습권)과 추천인 쿠폰 외에 관리자가 직접 쿠폰을 발급하는 기능이 필요합니까? 쿠폰 유효기간은 어떻게 됩니까?

**[EN]** Beyond mileage exchange coupons and referral coupons, does the admin need manual coupon issuance capability? What are coupon expiration rules?

**Why this matters**: 쿠폰 관리 시스템의 범위와 복잡도에 영향을 줍니다.

**기본추천안**: 관리자 수동 발급 기능 포함. 쿠폰 유효기간 30일 기본. 유효기간 만료 시 자동 비활성화.

**답변**: OK

---

## 6. 다국어 지원 (i18n)

### Q6.1 UI 다국어 범위 (UI i18n Scope)

**[KR]** "최초 영문, 국문 2가지만 제공"이라고 되어 있습니다. 이는 앱 UI 언어를 의미합니까? 관리자 웹도 다국어가 필요합니까?

**[EN]** "Initially English and Korean only." Does this refer to app UI language? Does the admin web also need i18n?

**Why this matters**: 번역 리소스 범위와 관리자 웹 설계에 영향을 줍니다.

**기본추천안**: 사용자 웹/앱은 한국어+영어. 관리자 웹은 한국어 단일 (향후 확장 고려하여 i18n 구조는 적용).

**답변**: OK

---

### Q6.2 모국어-학습언어 조합 (Mother Tongue - Learning Language Combinations)

**[KR]** 사용자가 선택할 수 있는 모국어와 학습언어 조합에 제한이 있습니까? 예: 한국어 모국어 → 영어 학습만 가능? 일본어 모국어 → 영어 학습도 가능?

**[EN]** Are there restrictions on mother tongue - learning language combinations? e.g., Korean speaker → English only? Japanese speaker → English also available?

**Why this matters**: 콘텐츠 관리 구조와 학습 엔진의 언어 매핑 로직에 영향을 줍니다.

**기본추천안**: 초기에는 학습 언어 = 영어 고정. 모국어 = 한국어/영어 선택 가능. 향후 확장.

**답변**: 초기 학습언어를 영어, 스페인어, 중국어, 일어, 한국어 5가지로 하며, 모국어는 한국어/영어만 선택가능하고 향후 확장가능.

---

### Q6.3 날짜/통화 형식 (Date & Currency Formatting)

**[KR]** 날짜 형식(YYYY-MM-DD vs MM/DD/YYYY), 통화 표시(원/달러)는 사용자 locale에 따라 자동 적용합니까?

**[EN]** Should date format and currency display automatically adapt to user locale?

**Why this matters**: 국제화 라이브러리 선택과 표시 로직에 영향을 줍니다.

**기본추천안**: 사용자 기기/브라우저 locale 기준 자동 적용. Intl API 활용.

**답변**: OK

---

## 7. UI/UX 설계 (UI/UX Design)

### Q7.1 디자인 시안 및 디자인 시스템 (Design Mockups & Design System)

**[KR]** Figma 등 디자인 시안이 별도로 존재합니까? 없다면 개발 중 디자인도 함께 진행합니까? 디자인 토큰(색상, 타이포그래피, 간격)은 어떻게 정의합니까?

**[EN]** Are there existing design mockups (Figma, etc.)? If not, will design be done during development? How should design tokens (colors, typography, spacing) be defined?

**Why this matters**: 개발 착수 가능 시점과 UI 품질에 직접 영향을 줍니다.

**기본추천안**: 디자인 시안 없이 TailwindCSS 기반 개발 동시 진행. 디자인 토큰은 `design-tokens.json`으로 관리.

**답변**: 추천안대로 하되, 중간에 Figma mcp를 이용해서 디자인토큰을 업데이트 하는 과정을 거칠 것임.

---

### Q7.2 반응형 브레이크포인트 (Responsive Breakpoints)

**[KR]** 사용자 웹의 반응형 지원 범위를 확인해 주십시오. 모바일 웹까지 지원합니까, 데스크톱 전용입니까? 관리자 웹은 데스크톱 전용으로 해도 됩니까?

**[EN]** What is the responsive support range for user web? Mobile web included or desktop only? Is admin web desktop-only acceptable?

**Why this matters**: CSS 설계와 컴포넌트 레이아웃 구조에 영향을 줍니다.

**기본추천안**: 사용자 웹 = 모바일 우선 반응형 (320px~1440px). 관리자 웹 = 데스크톱 전용 (최소 1280px).

**답변**: OK

---

### Q7.3 학습 카드 애니메이션 (Learning Card Animation)

**[KR]** 카드 넘기기 애니메이션의 구체적인 모션을 확인해 주십시오. 3D 플립, 슬라이드, 페이드 등 선호하는 방식이 있습니까?

**[EN]** What specific animation style is preferred for card flipping? 3D flip, slide, fade, or other?

**Why this matters**: 애니메이션 라이브러리 선택과 성능 최적화에 영향을 줍니다.

**기본추천안**: 세로 방향 슬라이드(아래에서 위로) + 페이드 조합. Framer Motion 사용.

**답변**: OK

---

### Q7.4 다크 모드 지원 (Dark Mode Support)

**[KR]** 다크 모드를 지원합니까? 지원한다면 초기 출시부터 포함합니까, 향후 업데이트입니까?

**[EN]** Is dark mode supported? If so, from initial launch or as a future update?

**Why this matters**: 디자인 토큰 체계와 CSS 변수 구조에 영향을 줍니다.

**기본추천안**: 초기 라이트 모드 전용. 다크 모드는 2차 릴리즈. 단, CSS 변수 기반으로 설계하여 전환 용이하게.

**답변**: 초기부터 다크모드도 지원하도록 개발필요

---

### Q7.5 레이더 차트 라이브러리 (Radar Chart Library)

**[KR]** 문장용도별 레이더 차트 통계 기능에 사용할 차트 라이브러리 선호도가 있습니까?

**[EN]** Any preference for the chart library to use for the purpose-based radar chart statistics?

**Why this matters**: 번들 크기와 커스터마이징 가능 범위에 영향을 줍니다.

**기본추천안**: Recharts (React 친화적, 번들 경량)

**답변**: OK

---

## 8. 데이터베이스 설계 (Database Design)

### Q8.1 로컬 DB 기술 선택 (Local DB Technology)

**[KR]** "로컬DB우선전략"이 명시되어 있습니다. 웹과 모바일에서 사용할 로컬 DB 기술을 확인해 주십시오. (IndexedDB, SQLite, WatermelonDB 등)

**[EN]** "Local DB first strategy" is specified. Which local DB technology for web and mobile? (IndexedDB, SQLite, WatermelonDB, etc.)

**Why this matters**: 오프라인 학습 가능 여부, 동기화 전략, 데이터 구조에 영향을 줍니다.

**기본추천안**: 웹 - Dexie.js(IndexedDB 래퍼), 모바일 - WatermelonDB (SQLite 기반, 동기화 친화적)

**답변**: OK

---

### Q8.2 Supabase RLS 정책 범위 (Supabase RLS Policy Scope)

**[KR]** 모든 테이블에 RLS를 적용합니까? 관리자 전용 테이블(콘텐츠, 유형관리 등)의 접근 제어 수준은 어떻게 합니까?

**[EN]** Should RLS be applied to all tables? What access control level for admin-only tables (content, type management, etc.)?

**Why this matters**: 보안 수준과 API 설계 복잡도에 영향을 줍니다.

**기본추천안**: 모든 테이블 RLS 적용. 관리자 테이블은 service_role key 또는 관리자 role 기반 정책.

**답변**: OK

---

### Q8.3 학습 데이터 동기화 충돌 해결 (Learning Data Sync Conflict Resolution)

**[KR]** 로컬 DB와 원격 DB 간 동기화 시 충돌이 발생할 경우(예: 두 기기에서 동시 학습) 어떤 전략을 사용합니까? Last Write Wins, 병합, 사용자 선택?

**[EN]** How should sync conflicts between local and remote DB be resolved (e.g., learning on two devices simultaneously)? Last Write Wins, merge, or user choice?

**Why this matters**: 동기화 엔진의 복잡도와 데이터 정합성에 영향을 줍니다.

**기본추천안**: Last Write Wins (최신 타임스탬프 기준). 학습 데이터 특성상 병합보다 단순 전략이 적합.

**답변**: OK

---

### Q8.4 데이터 보관 기간 (Data Retention Period)

**[KR]** 학습 기록, 체크 로그 등 상세 데이터의 보관 기간에 제한이 있습니까? 전체 이력을 영구 보관합니까?

**[EN]** Is there a retention period limit for detailed learning records and check logs? Permanent storage for all history?

**Why this matters**: DB 스토리지 비용과 쿼리 성능에 영향을 줍니다.

**기본추천안**: 요약 데이터는 영구 보관. 상세 체크 로그는 1년 보관 후 아카이브.

**답변**: OK.

---

## 9. API 설계 (API Design)

### Q9.1 API 통신 방식 (API Communication Pattern)

**[KR]** REST API로 구성합니까, GraphQL로 구성합니까? Supabase 자동 생성 API (PostgREST)를 직접 사용합니까?

**[EN]** REST or GraphQL? Will Supabase auto-generated API (PostgREST) be used directly?

**Why this matters**: API 계층의 아키텍처와 클라이언트 SDK 선택에 영향을 줍니다.

**기본추천안**: Supabase Client SDK (PostgREST 기반 REST) 직접 사용. 복잡한 로직은 Edge Functions.

**답변**: OK

---

### Q9.2 API 버전 관리 (API Versioning)

**[KR]** 모바일 앱 배포 후 API 변경 시 하위 호환성 유지를 위한 버전 관리 전략이 필요합니까?

**[EN]** After mobile app deployment, is API versioning needed for backward compatibility?

**Why this matters**: 모바일 앱은 강제 업데이트가 어려우므로 API 호환성이 중요합니다.

**기본추천안**: URL 기반 버전 관리 (`/v1/`, `/v2/`). Edge Functions에 적용.

**답변**: OK

---

### Q9.3 Rate Limiting 정책 (Rate Limiting Policy)

**[KR]** API 요청 제한(Rate Limiting)이 필요합니까? 무료/유료 사용자별 차등 적용합니까?

**[EN]** Is API rate limiting needed? Different limits for free vs. paid users?

**Why this matters**: 서버 보호와 비용 관리에 영향을 줍니다.

**기본추천안**: Supabase 기본 Rate Limiting 사용. 무료 사용자 하루 3문장 제한은 클라이언트 레벨에서 처리.

**답변**: OK

---

## 10. 테스트 및 품질 (Testing & QA)

### Q10.1 테스트 커버리지 목표 (Test Coverage Target)

**[KR]** 단위 테스트, 통합 테스트, E2E 테스트 각각의 커버리지 목표가 있습니까?

**[EN]** Are there specific coverage targets for unit tests, integration tests, and E2E tests?

**Why this matters**: 테스트 작성 범위와 CI/CD 통과 기준에 영향을 줍니다.

**기본추천안**: 단위 테스트 80%+, E2E 주요 흐름(학습, 결제, 인증) 100% 커버.

**답변**: OK

---

### Q10.2 테스트 환경 (Test Environment)

**[KR]** Staging 환경을 별도로 운영합니까? Supabase 프로젝트를 dev/staging/production으로 분리합니까?

**[EN]** Will there be a separate staging environment? Separate Supabase projects for dev/staging/production?

**Why this matters**: 환경 구성 비용과 배포 안전성에 영향을 줍니다.

**기본추천안**: dev(로컬) + production(Supabase 1개 프로젝트). 테스트 데이터는 별도 스키마 또는 테스트 prefix.

**답변**: OK

---

### Q10.3 모바일 테스트 전략 (Mobile Testing Strategy)

**[KR]** 모바일 앱 테스트에 Detox를 사용한다고 되어 있습니다. 실기기 테스트 범위와 지원 OS 최소 버전을 확인해 주십시오.

**[EN]** Detox is specified for mobile testing. What is the real device test scope and minimum supported OS versions?

**Why this matters**: 테스트 인프라 구축과 호환성 대응 범위에 영향을 줍니다.

**기본추천안**: iOS 16+, Android 12+. CI에서는 시뮬레이터/에뮬레이터 기반 Detox.

**답변**: OK

---

## 11. 배포 및 운영 (Deployment & Ops)

### Q11.1 CI/CD 파이프라인 (CI/CD Pipeline)

**[KR]** CI/CD 도구는 GitHub Actions를 사용합니까? 브랜치 전략(Git Flow, GitHub Flow 등)은 무엇입니까?

**[EN]** Will GitHub Actions be used for CI/CD? What branching strategy (Git Flow, GitHub Flow, etc.)?

**Why this matters**: 개발 워크플로우와 배포 자동화 구성에 영향을 줍니다.

**기본추천안**: GitHub Actions + GitHub Flow (main + feature branches). PR 머지 시 자동 배포.

**답변**: OK (github action과 flow에 대해서 정확히 알지 못합니다. 배포를 위한 가이드도 추가로 만들어주세요)

---

### Q11.2 모니터링 및 알림 (Monitoring & Alerts)

**[KR]** PRD에 Slack/Telegram 웹훅이 언급되어 있습니다. 어떤 이벤트에 대해 알림을 받고 싶습니까? (에러, 결제 실패, 신규 가입 등)

**[EN]** PRD mentions Slack/Telegram webhooks. Which events should trigger alerts? (errors, payment failures, new sign-ups, etc.)

**Why this matters**: 모니터링 구현 범위와 알림 채널 설정에 영향을 줍니다.

**기본추천안**: Slack으로 통일. 에러(500), 결제 실패, 일일 KPI 요약 알림.

**답변**: OK. 매일 오전 8시 전일 가입회원수, 유료회원가입자수, 탈퇴회원수도 같이 알려주세요.

---

### Q11.3 에러 추적 서비스 (Error Tracking Service)

**[KR]** 프론트엔드/백엔드 에러 추적에 Sentry 등 외부 서비스를 사용합니까?

**[EN]** Will external error tracking services like Sentry be used for frontend/backend?

**Why this matters**: 에러 디버깅 효율성과 운영 비용에 영향을 줍니다.

**기본추천안**: Sentry 무료 티어 적용 (웹 + 모바일)

**답변**: OK (사용법을 잘 알지 못합니다. 관련 가이드도 추가로 만들어주세요. )

---

### Q11.4 백업 전략 (Backup Strategy)

**[KR]** Supabase 기본 백업 외에 추가 백업 전략이 필요합니까? DB 백업 주기와 보관 기간은?

**[EN]** Beyond Supabase default backups, is additional backup strategy needed? Backup frequency and retention?

**Why this matters**: 데이터 복구 가능성과 비용에 영향을 줍니다.

**기본추천안**: Supabase Pro 플랜 자동 백업 (일 1회, 7일 보관) 사용. 추가 백업 불필요.

**답변**: OK

---

## 12. 법률 및 규정 (Legal & Compliance)

### Q12.1 개인정보 처리 방침 범위 (Privacy Policy Scope)

**[KR]** GDPR(유럽), CCPA(미국 캘리포니아), PIPA(한국 개인정보보호법) 중 어느 범위까지 대응합니까? 해외 서비스 출시 국가 범위에 따라 달라집니다.

**[EN]** Which privacy regulations should be addressed? GDPR (EU), CCPA (US-California), PIPA (Korea)? Depends on target launch countries.

**Why this matters**: 약관 내용, 데이터 수집 동의 절차, 데이터 삭제 기능에 영향을 줍니다.

**기본추천안**: 초기 한국(PIPA) + GDPR 기본 준수. CCPA는 미국 출시 시 추가 대응.

**답변**: 약관 등 법률/규정 등록 시 국가별 등록기능을 두어 대응할 수 있는 구조적 준비는 해야 합니다.

---

### Q12.2 약관 유형별 법적 검토 (Legal Review per Terms Type)

**[KR]** PRD에 6가지 약관유형이 명시되어 있습니다. "신체 및 건강정보 수집동의"가 언어학습 서비스에 필요한 이유를 확인해 주십시오. 수집하는 건강 관련 데이터가 있습니까?

**[EN]** PRD lists 6 terms types including "Health Information Collection Consent." Why is this needed for a language learning service? Is any health-related data collected?

**Why this matters**: 불필요한 약관은 가입 전환율을 낮추고 법적 복잡도를 높입니다.

**기본추천안**: 건강정보 수집이 없다면 해당 약관 제거 권고. 필요한 경우만 포함.

**답변**: 필요없는데, 기존 서비스를 그대로 하느라 포함되어 있습니다. 삭제해주세요.

---

### Q12.3 아동 보호 (Child Protection - COPPA/등)

**[KR]** 성인만 이용 가능으로 설정되어 있지만, 미성년자가 가입 시도 시 별도 차단 메커니즘이 필요합니까? 생년월일 허위 입력 대응은?

**[EN]** While "adults only" is set, is a special blocking mechanism needed for minor sign-up attempts? How to handle false birth date entries?

**Why this matters**: 법적 책임과 앱스토어 심사 기준에 영향을 줍니다.

**기본추천안**: 생년월일 기반 자동 차단 + 앱스토어 연령 등급 설정(17+). 허위 입력은 약관에서 책임 면제.

**답변**: OK

---

### Q12.4 결제 관련 법적 요구사항 (Payment Legal Requirements)

**[KR]** 한국 전자상거래법상 구독 서비스의 자동 갱신 고지, 청약 철회 기간(7일), 미성년자 결제 취소 등 법적 요구사항 대응 범위를 확인해 주십시오.

**[EN]** What is the scope of compliance with Korean e-commerce law requirements (auto-renewal notification, 7-day withdrawal period, minor payment cancellation)?

**Why this matters**: 결제 흐름 UI와 백엔드 로직에 법적 요구사항 반영이 필요합니다.

**기본추천안**: 자동 갱신 3일 전 알림, 7일 청약 철회 지원. 성인 전용 서비스이므로 미성년자 결제 이슈 최소화.

**답변**: OK

---

## 부록: 우선순위 확인 (Appendix: Priority Confirmation)

### QA.1 MVP 기능 범위 (MVP Feature Scope)

**[KR]** PRD에 기재된 기능 중 1차 출시(MVP)에 반드시 포함되어야 할 기능과 이후 릴리즈로 미룰 수 있는 기능을 구분해 주십시오.

**[EN]** Among PRD features, please distinguish must-have features for MVP vs. features that can be deferred to later releases.

**Why this matters**: 개발 일정과 리소스 배분에 직접 영향을 줍니다.

**기본추천안**:

- **MVP 포함**: 관리자(유형관리, 콘텐츠관리, 약관관리), 사용자(인증, 회원가입, 레벨테스트, 학습, 유료화), API
- **2차 릴리즈**: 마일리지, 공유기능, 레이더차트, 친구초대, 모바일앱

**답변**: OK

---

### QA.2 동시 사용자 규모 예측 (Expected Concurrent Users)

**[KR]** 서비스 출시 후 예상되는 동시 사용자 수와 6개월/1년 후 목표 사용자 수를 확인해 주십시오.

**[EN]** What are the expected concurrent users at launch and target users after 6 months / 1 year?

**Why this matters**: 인프라 스케일링, Supabase 요금 플랜, 성능 최적화 수준에 영향을 줍니다.

**기본추천안**: 출시 초기 100명, 6개월 후 1,000명, 1년 후 5,000명 기준 설계. Supabase Pro 플랜.

**답변**: OK

---

### QA.3 개발 일정 (Development Timeline)

**[KR]** 전체 개발 일정의 목표 기한이 있습니까? 관리기능 → API → 사용자웹 → 모바일앱 각 단계별 예상 기간은?

**[EN]** Is there a target deadline for the overall development timeline? Expected duration for each phase (Admin → API → User Web → Mobile App)?

**Why this matters**: 일정에 따라 기능 범위 조정과 리소스 배분이 필요합니다.

**기본추천안**: 관리기능 4주, API 2주, 사용자웹 4주, 모바일앱 4주 (총 14주)

**답변**: OK

---

> **다음 단계**: 이 질의서에 대한 답변이 완료되면 답변 내용을 반영하여 상세 PRD(PRD.md)를 작성하고, 이어서 시스템 설계 및 구현 계획을 수립합니다.
>
> **Next Step**: Once this questionnaire is answered, the responses will be incorporated into a detailed PRD (PRD.md), followed by system design and implementation planning.
