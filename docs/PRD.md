# FlipFlip - 상세 제품 요구사항 정의서 (Product Requirements Document)

> **문서 버전**: v1.0
> **작성일**: 2026-03-14
> **서비스명**: FlipFlip
> **컨셉**: 세상에서 가장 쉬운 언어학습앱
> **회사**: 쿠키앱스 (CookieApps)
> **담당자**: 김무현 / help@cookieapps.kr

---

## 목차 (Table of Contents)

1. [서비스 개요 (Service Overview)](#1-서비스-개요-service-overview)
2. [시스템 아키텍처 (System Architecture)](#2-시스템-아키텍처-system-architecture)
3. [기능 명세 (Feature Specifications)](#3-기능-명세-feature-specifications)
4. [데이터 모델 개요 (Data Model Overview)](#4-데이터-모델-개요-data-model-overview)
5. [다국어 전략 (i18n Strategy)](#5-다국어-전략-i18n-strategy)
6. [UI/UX 설계 (UI/UX Design)](#6-uiux-설계-uiux-design)
7. [결제 시스템 (Payment System)](#7-결제-시스템-payment-system)
8. [마일리지 시스템 (Mileage System)](#8-마일리지-시스템-mileage-system)
9. [보안 및 규정 (Security & Compliance)](#9-보안-및-규정-security--compliance)
10. [기술 스택 (Tech Stack)](#10-기술-스택-tech-stack)
11. [개발 로드맵 (Development Roadmap)](#11-개발-로드맵-development-roadmap)
12. [콘텐츠 제작 (Content Production)](#12-콘텐츠-제작-content-production)
13. [제약사항 (Constraints)](#13-제약사항-constraints)
14. [추가 산출물 요청 (Additional Deliverables)](#14-추가-산출물-요청-additional-deliverables)

---

## 1. 서비스 개요 (Service Overview)

### 1.1 배경 (Background)

기존 언어학습 앱은 문법, 다양한 학습 방식 등 너무 많은 콘텐츠를 포함하고 있어 오히려 학습에 부담이 된다. FlipFlip은 카드를 넘기는 간단한 UI를 통해 모국어 의미를 확인하고 학습언어를 반복 연습하는 방식으로, 문장 단위의 쉬운 언어학습을 제공한다.

Existing language learning apps overwhelm users with grammar rules and complex content. FlipFlip provides a simple card-flip UI where users see a meaning in their mother tongue, guess the expression in the target language, and build mastery through spaced repetition at the sentence level.

### 1.2 핵심 가치 (Value Proposition)

| 항목 | 설명 |
|------|------|
| **심플한 UI** | 카드를 넘기는 형태의 메인 학습 UI로 손쉬운 사용성 제공 |
| **체계화된 학습** | 레벨 > 스킬 > 문장 > 표현의 계층 구조로 단계적 학습 |
| **기억 최적화** | 망각곡선 이론 기반 다음 학습 시점 자동 조정 |
| **상황 인지** | 시제, 용도, 톤, 장소 태그를 아이콘/색상으로 표시하여 맥락 학습 지원 |
| **저렴한 가격** | 월 990원(KRW) / $0.99(USD) |

### 1.3 타겟 사용자 (Target Users)

- **주요 타겟**: 중등교육을 받아 영어에 대해 기본적인 이해가 있고, 언어학습에 관심이 있는 성인
- **연령 제한**: 성인만 이용 가능 (국가별 성인 기준 적용, 기본 만 18세)
- **지역**: 한국 우선, 글로벌 확장 대비

### 1.4 학습 콘텐츠 구조 (Learning Content Structure)

```
레벨 (Level) 1~100
  └─ 스킬 (Skill) ~5개/레벨
       └─ 문장 (Sentence) 다수/스킬
            └─ 표현 (Expression) 언어별/문장
```

- **레벨**: 1~100 레벨, 원어민 기준 수준. 하위에 5개 내외의 스킬로 구성
- **스킬**: 주요단어, 시제, 문형, 표현 등 언어 스킬. 시제/용도/톤/장소 유형 태그 포함
- **문장**: 스킬을 학습할 수 있는 문장. 의미는 국문(한국어 모국어 사용자용) + 영문(기타 모국어 사용자용) 2가지 버전
- **표현**: 의미에 대응되는 언어별 표현. 초기 4개 언어 (영어, 스페인어, 중국어, 일어)
- **응용 문장 없음**: 응용문장 개념은 적용하지 않음 (PO 확인 완료)

---

## 2. 시스템 아키텍처 (System Architecture)

### 2.1 모노레포 구조 (Monorepo Structure)

Turborepo 기반 모노레포로 구성한다.

```
flipflip/
├── apps/
│   ├── admin/          # 관리자 웹 (Next.js)
│   ├── web/            # 사용자 웹 (Next.js)
│   └── mobile/         # 모바일 앱 (React Native + Expo)
├── packages/
│   ├── shared-ui/      # 공유 UI 컴포넌트
│   ├── shared-utils/   # 공유 유틸리티
│   └── db/             # DB 스키마, 마이그레이션, 타입
├── turbo.json
└── package.json
```

### 2.2 API 구성 (API Configuration)

| 구분 | 기술 | 용도 |
|------|------|------|
| **기본 API** | Supabase Client SDK (PostgREST) | CRUD 기본 연산 |
| **비즈니스 로직** | Supabase Edge Functions (Deno) | 결제 웹훅, 스코어 계산 등 |
| **복잡한 로직** | Next.js API Routes | SSR 관련 로직, 복잡한 비즈니스 로직 |
| **버전 관리** | URL 기반 (`/v1/`, `/v2/`) | 모바일 앱 하위 호환성 보장 |

### 2.3 저장소 (Storage)

| 구분 | 기술 | 용도 |
|------|------|------|
| **원격 DB** | Supabase PostgreSQL | 마스터 데이터 |
| **로컬 DB (웹)** | Dexie.js (IndexedDB) | 오프라인 학습 데이터 |
| **로컬 DB (모바일)** | WatermelonDB (SQLite) | 오프라인 학습 데이터 |
| **파일 저장소** | Supabase Storage + CDN | 프로필 이미지, 온보딩 콘텐츠, 공유 이미지 |
| **동기화 전략** | Last Write Wins | 타임스탬프 기반 충돌 해결 |

### 2.4 실시간 기능 (Real-time Features)

- **초기**: REST 방식 (Supabase Client SDK)
- **향후**: 필요 시 Supabase Realtime 도입 (알림, 실시간 동기화)

---

## 3. 기능 명세 (Feature Specifications)

### 3.1 관리자 시스템 (Admin System)

#### 3.1.1 관리자 로그인 (Admin Login)

- **인증 방식**: Google OAuth
- **접근 제어**: 초기에는 화이트리스트 방식 (DB에 허용 이메일 관리), 단 **초기부터 RBAC(역할 기반 접근 제어) 확장 가능하도록 설계**
- **프로필**: Google 계정의 이름/프로필 이미지 활용
- **admin_users 테이블**: role 필드 포함 (superadmin, admin, editor, viewer 등)

#### 3.1.2 유형관리 (Type Management)

다단계 유형관리 시스템으로 서비스 전반의 코드성 데이터를 관리한다.

**유형 정보 필드 (Type Fields)**:

| 필드 | 설명 | 비고 |
|------|------|------|
| `type_name` | 유형명 | 필수 |
| `type_code` | 유형코드 | 필수, 중복 체크 기능 |
| `sort_order` | 표시순번 | 정수 |
| `value` | 값 | 숫자 또는 문자 (예: 점수, 시간 등) |
| `description` | 요약/설명 | 선택 |
| `color` | 색상 코드 | 선택 (HEX 코드) |
| `icon` | 아이콘명 | 선택 (아이콘 라이브러리 참조) |
| `extra_attr_1` ~ `extra_attr_5` | 부가속성 1~5 | 선택, 유형별 추가 데이터 |
| `is_active` | 사용여부 | boolean |

**관리되는 주요 유형**:

| 유형 | value 용도 | 부가속성 활용 |
|------|-----------|-------------|
| 체크유형 (완벽히맞춤/대부분맞춤/못맞춤) | 점수 (+2, +0.5, -1) | - |
| 익힘수준 (첫암기/미비/익숙/매우익숙/완벽) | 기준점수 | extra_attr_1 = 다음학습간격(분) |
| 일학습목표시간 (5분/15분/30분/1시간/2시간/2시간이상) | 분 단위 시간 | extra_attr_1 = 최소 체크 문장수 |
| 시제유형 (현재/과거/과거완료/미래 등) | - | color, icon |
| 용도유형 (질문/요구/설득/설명 등) | - | color, icon |
| 톤유형 (비공식/공식) | - | color, icon |
| 장소유형 (회사/집/여행 등) | - | color, icon |
| 원어민수준유형 | - | - |
| 모국어유형 (한국어/영어) | 언어코드 | - |
| 학습언어유형 (영어/스페인어/중국어/일어/한국어) | 언어코드 | - |
| 표현언어유형 (영어/스페인어/중국어/일어) | 언어코드 | - |
| 약관유형 | - | - |

#### 3.1.3 콘텐츠관리 (Content Management)

**레이아웃**: 세로 4단 컬럼 구성

```
┌──────────┬──────────┬──────────┬──────────┐
│ 레벨 컬럼 │ 스킬 컬럼 │ 문장 컬럼 │ 표현 컬럼 │
│          │          │          │          │
│ 1~100    │ 스킬목록  │ 문장목록  │ 표현목록  │
│ (고정)   │          │          │          │
└──────────┴──────────┴──────────┴──────────┘
```

**동작 흐름**:
1. 레벨 선택 (레벨번호, 레벨개요) → 우측 스킬 컬럼에 해당 레벨 하위 스킬 목록 표시
2. 스킬 선택 (스킬명, 스킬개요) → 우측 문장 컬럼에 해당 스킬 하위 문장 목록 표시
3. 문장 선택 → 우측 표현 컬럼에 해당 문장 하위 표현 목록 표시

**CRUD 기능**:
- 스킬/문장/표현 컬럼 헤더에 항목 추가 버튼
- 추가 버튼 클릭 시 항목 추가/수정 팝업 표시
- 각 항목 클릭 시 수정 팝업 (삭제, 수정 기능 포함)

**대량 업로드**: CSV 업로드 + 다운로드(백업) 기능 제공, 검증 로직 포함

**콘텐츠 버전 관리**: 불필요. 변경 시 약관 또는 서비스 화면에서 일반론적으로 고지.

#### 3.1.4 레벨관리 (Level Management)

- 1~100 레벨 고정
- **좌측**: 1~100 레벨 목록
- **우측**: 레벨 상세 정보 (수정 가능)
  - 레벨번호 (고정, 정수 1~100)
  - 레벨개요 (100글자)
  - 레벨설명
  - 원어민 수준유형값
- **하단**: 해당 레벨에 포함된 스킬 목록. 스킬 클릭 시 수정 팝업 표시

#### 3.1.5 정책관리 (Policy Management)

| 정책 항목 | 설명 | 비고 |
|----------|------|------|
| 스킬업 비율 | 학습성취점수 / 학습총점수 기준 비율 | 퍼센트 (%) |
| 레벨업 비율 | (현재: 모든 스킬 클리어 시 자동 레벨업) | - |
| 마일리지 정책 | 친구초대 마일리지, 무료이용 일당 마일리지 | - |

#### 3.1.6 회원관리 (Member Management)

**목록 표시 항목**: NO, 유/무료 구분 (배지), 닉네임, 이메일

**검색 기능**: 닉네임, 전화번호, 이메일 LIKE 검색

#### 3.1.7 약관관리 (Terms Management)

**국가별, 약관유형별 콘텐츠 관리**

**약관 유형 (5종)** - "신체 및 건강정보 수집동의"는 삭제됨 (PO 확인):

| No | 약관 유형 | 필수여부 |
|----|----------|---------|
| 1 | 서비스이용약관 | 필수 |
| 2 | 개인정보 처리방침 | 필수 |
| 3 | 개인정보수집 및 이용동의 | 필수 |
| 4 | 유료서비스 이용약관 | 필수 |
| 5 | 마케팅 활용동의 | 선택 |

**약관 정보 필드**:

| 필드 | 설명 |
|------|------|
| 국가선택 | 적용 국가 |
| 버전 | 약관 버전 (버전별 관리) |
| 개정개요 | 개정 사유/내용 요약 |
| 약관요약 | 200글자 |
| 비합의시 안내 | 동의하지 않을 경우 안내 문구 |
| 사용여부 | boolean |
| 필수동의 필요여부 | boolean |
| 콘텐츠 | 리치텍스트 (서식 적용 가능, 버전별 관리) |

---

### 3.2 사용자 시스템 (User System)

#### 3.2.1 온보딩 (Onboarding)

- 서비스 특장점에 대한 콘텐츠 (feature highlights) 표시
- 마지막에 "시작하기" 버튼
- **건너뛰기 플래그**: 로컬 스토리지에 `onboarding_seen = true` 저장. 이후 건너뜀

#### 3.2.2 인증 (Authentication)

| 인증 방식 | 사용자 웹 | 모바일 앱 |
|----------|----------|----------|
| Google OAuth | O | O |
| Apple Sign-In | X | O (모바일만) |

#### 3.2.3 회원가입 (Registration)

회원가입 흐름은 순차적으로 진행된다:

```
인증 완료
  → 약관동의 (국가별 5종, 필수/선택 구분)
    → 전화번호 인증 (필수, SENS/Twilio)
      → 닉네임 설정 (필수)
        → 공유용 이메일 입력 (인증 이메일 기본 입력)
          → 생년월일 입력 (필수, 성인 확인)
            → 프로필 이미지 업로드
              → 추천인 ID 입력 (선택)
                → 가입 완료
```

**닉네임 규칙**:
- 길이: 2~16자
- 허용 문자: 한글, 영문, 숫자
- 특수문자 불가
- 중복 체크 (실시간)
- 기본 금칙어 필터 적용
- 로그인 사용자 이름으로 기본 입력

**성인 확인**:
- 생년월일 기반 자동 차단
- 국가별 성인 기준 적용 (한국 만 19세, 미국/EU 만 18세 등)
- 판별 불가 시 기본 만 18세 적용
- 앱스토어 연령 등급: 17+
- 허위 입력에 대한 책임은 약관에서 면제

**전화번호 인증 제공자**:
- 국내: Naver Cloud SENS
- 해외: Twilio

#### 3.2.4 진단 (Onboarding Diagnosis)

회원가입 완료 후, 학습 시작 전에 진행하는 초기 설정:

1. **모국어 선택**: 한국어 / 영어 (2개 옵션, 향후 확장 가능)
2. **학습언어 선택**: 영어 / 스페인어 / 중국어 / 일어 / 한국어 (5개 언어)
3. **일학습목표시간 설정**: 5분 / 15분 / 30분 / 1시간 / 2시간 / 2시간이상

> 일학습목표시간은 유형관리에서 "일학습목표시간" type으로 관리되며, 설정 후 마이페이지 또는 학습설정에서 변경 가능.

#### 3.2.5 레벨테스트 (Level Test)

**형식**: 일반 학습과 동일한 자기 판단 방식 (카드 뒤집기 후 완벽/대부분/못맞춤 선택)

**알고리즘**: 이진 탐색 (Binary Search) 기반

```
1. 시작 레벨에서 3문제 출제
2. 2문제 이상 맞춤 (완벽히맞춤 + 대부분맞춤) → 10단계 위의 문제 출제
3. 2문제 이상 못맞춤 → 이전 맞춘 최고 단계와 틀린 단계의 중간 단계 출제
4. 범위가 충분히 좁아질 때까지 반복
5. 최종 레벨 결정
```

**재시험**: 학습 중간에도 가능. 재시험 시 시작 레벨 = 현재 레벨.

#### 3.2.6 학습 (Learning)

##### 학습 데이터 구성

| 구분 | 데이터 소스 |
|------|-----------|
| **새 학습 (최초)** | 시작 레벨의 첫 번째 스킬에 포함된 문장 전체 |
| **새 학습 (스킬업 시)** | 스킬업된 스킬의 문장 전체 |
| **새 학습 (레벨업 시)** | 업된 레벨의 첫 번째 스킬의 문장 전체 |
| **기존 학습** | 다음학습시간이 도래한 모든 문장 중 랜덤 선택 |

##### 카드 플립 UI (Card-Flip UI)

1. 의미(모국어) 표시 → 사용자가 학습언어로 추측
2. 정답 확인 (카드 뒤집기 또는 Down 키)
3. 자기 평가 (체크)

##### 체크 유형 및 점수 (Check Types & Scores)

유형관리에서 관리되며, value 필드에 점수를 저장한다.

| 체크 유형 | 점수 (value) | 키보드 단축키 |
|----------|-------------|-------------|
| 완벽히맞춤 | +2점 | Up (위 화살표) |
| 대부분맞춤 | +0.5점 | Left (왼쪽 화살표) |
| 못맞춤 | -1점 (유형관리 value, 기본값) | Right (오른쪽 화살표) |
| 정답보기 | - | Down (아래 화살표) |

> **점수 하한선**: 누적 점수는 0점 미만으로 내려가지 않음 (floor at 0)
> **감소 점수**: 못맞춤의 감점 또한 유형관리의 체크유형 value 값으로 관리

##### 익힘수준 (Mastery Levels)

유형관리에서 관리. value = 기준점수, extra_attr_1 = 다음학습간격(분).

| 익힘수준 | 기준점수 (value) | 다음학습간격 (extra_attr_1) | 시간 환산 |
|---------|-----------------|-------------------------|----------|
| 첫암기 | 0점 | 30분 | 30분 |
| 미비 | 1점 | 240분 | 4시간 |
| 익숙 | 3점 | 1,440분 | 1일 |
| 매우익숙 | 5점 | 10,080분 | 7일 |
| 완벽 | 8점 | 43,200분 | 30일 |

**점수 누적 및 수준 업데이트 흐름**:
1. 체크 시 체크점수를 누적
2. 누적된 체크점수로 익힘수준 업데이트 (해당 기준점수 이상인 가장 높은 수준)
3. 익힘수준의 기준점수가 익힘점수가 됨
4. 익힘수준에 따른 다음학습간격으로 다음학습시간 설정

##### 스킬업 (Skill-Up)

```
스킬업 조건:
  학습성취점수 >= 학습총점수 x 스킬업비율(정책관리)

학습성취점수 = 해당 스킬에 포함된 문장의 익힘점수의 합
학습총점수 = 해당 스킬에 포함된 문장수 x "완벽" 기준점수(8점)
```

- 스킬 게이지가 학습화면 상단에 표시됨
- 스킬업 = 해당 스킬 클리어
- 클리어 시 환영 팝업 표시

##### 레벨업 (Level-Up)

- 현재 레벨의 **모든 스킬이 클리어**(스킬업)되면 레벨업
- 레벨업 시 환영 팝업 표시
- **레벨 다운 없음**: 한번 클리어한 레벨은 유지. 단, 해당 레벨 문장은 망각곡선에 따라 계속 복습 대상에 포함

##### 일학습완료 기준 (Daily Learning Completion)

```
최소 체크 문장수 = 일학습목표시간 유형의 extra_attr_1 값 x 1문장/분

예시:
- 5분 선택 → 최소 5문장 체크 완료
- 15분 선택 → 최소 15문장 체크 완료
- 30분 선택 → 최소 30문장 체크 완료
- 1시간 선택 → 최소 60문장 체크 완료
- 2시간 선택 → 최소 120문장 체크 완료
- 2시간이상 선택 → extra_attr_1에 설정된 값 기준
```

**하루 기준**: 24시(자정) 이전

##### 세션 제한 (Session Limit)

- 한 세션 최대 **50문장**
- 50문장 완료 후 "더 학습하기" 버튼으로 추가 세션 시작

##### 연속학습 표시 (Streak Display)

- 학습화면 상단에 캘린더 컴포넌트 제공
- 이번 주 (일~토) 한 주 표시
- 미완료일 / 완료일 / 미래날짜 구분

#### 3.2.7 기록 (Records)

- 캘린더 컴포넌트 **월 단위 모드**로 연속학습 표시
- 일별 완료/미완료 표시

#### 3.2.8 마이페이지 (My Page)

- 프로필 업데이트
- 현재 플랜 확인 및 유료화 결제
- 일학습목표시간 변경
- 로그아웃

#### 3.2.9 유료화 (Monetization)

| 항목 | 내용 |
|------|------|
| **무료 체험** | 30일 (가입일 기준) |
| **유료 전환 미시** | 학습기능 제한 (하루 3문장만 학습 가능), 데이터는 보존 |
| **월간 구독** | KRW 990 / USD $0.99 |
| **연간 구독** | KRW 9,900 / USD $9.90 |
| **자동 갱신** | O (중도 해지 시 잔여 기간까지 이용 가능, 잔여분 환불 없음) |

---

## 4. 데이터 모델 개요 (Data Model Overview)

### 4.1 핵심 테이블 (Core Tables)

#### users
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK, Supabase Auth uid |
| auth_email | text | 인증용 이메일 (Supabase Auth) |
| role | text | RBAC 역할 (user, premium_user 등) |
| created_at | timestamptz | 가입일 |
| deleted_at | timestamptz | 탈퇴 요청일 (soft delete) |
| dormant_at | timestamptz | 휴면 전환일 |
| is_active | boolean | 활성 여부 |

#### user_profiles
| 컬럼 | 타입 | 설명 |
|------|------|------|
| user_id | UUID | FK → users |
| nickname | varchar(16) | 닉네임 (2~16자) |
| email | text | 공유용 이메일 |
| phone | text | 전화번호 (인증 완료) |
| birth_date | date | 생년월일 |
| profile_image_url | text | 프로필 이미지 URL |
| mother_tongue | text | 모국어 코드 |
| learning_language | text | 학습언어 코드 |
| daily_goal_type_id | UUID | FK → types (일학습목표시간) |
| referrer_id | UUID | 추천인 user_id |
| country_code | text | 국가 코드 |
| current_level | integer | 현재 레벨 (1~100) |

#### admin_users
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| email | text | Google OAuth 이메일 |
| name | text | Google 계정 이름 |
| profile_image_url | text | Google 프로필 이미지 |
| role | text | RBAC 역할 (superadmin, admin, editor, viewer) |
| is_active | boolean | 활성 여부 |

#### levels
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| level_number | integer | 1~100 (고정, unique) |
| summary | varchar(100) | 레벨개요 |
| description | text | 레벨설명 |
| native_level_type_id | UUID | FK → types (원어민 수준유형) |

#### skills
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| level_id | UUID | FK → levels |
| name | text | 스킬명 |
| summary | varchar(200) | 스킬개요 |
| sort_order | integer | 정렬순서 |
| tense_type_id | UUID | FK → types (시제유형) |
| purpose_type_id | UUID | FK → types (용도유형) |
| tone_type_id | UUID | FK → types (톤유형) |
| place_type_id | UUID | FK → types (장소유형) |

#### sentences
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| skill_id | UUID | FK → skills |
| summary | varchar(200) | 문장개요 (국문 의미) |
| summary_en | varchar(200) | 문장개요 (영문 의미) |

> **참고**: `parent_sentence_id` 없음 - 응용문장 개념 미적용

#### expressions
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| sentence_id | UUID | FK → sentences |
| language_code | text | 언어코드 (en, es, zh, ja) |
| expression_text | varchar(200) | 언어별 표현 |
| hint | varchar(100) | 힌트 |

#### types (계층형 유형관리)
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| parent_id | UUID | FK → types (다단계 계층) |
| type_name | text | 유형명 |
| type_code | text | 유형코드 (unique per parent) |
| sort_order | integer | 표시순번 |
| value | text | 값 (점수, 시간 등 - 용도에 따라 파싱) |
| description | text | 요약/설명 |
| color | text | 색상 코드 (선택, HEX) |
| icon | text | 아이콘명 (선택) |
| extra_attr_1 | text | 부가속성1 |
| extra_attr_2 | text | 부가속성2 |
| extra_attr_3 | text | 부가속성3 |
| extra_attr_4 | text | 부가속성4 |
| extra_attr_5 | text | 부가속성5 |
| is_active | boolean | 사용여부 |

#### user_learning_progress
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| user_id | UUID | FK → users |
| skill_id | UUID | FK → skills |
| achievement_score | decimal | 학습성취점수 |
| is_cleared | boolean | 스킬 클리어 여부 |
| cleared_at | timestamptz | 클리어 일시 |

#### user_sentence_scores
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| user_id | UUID | FK → users |
| sentence_id | UUID | FK → sentences |
| accumulated_score | decimal | 누적 체크점수 |
| mastery_level_type_id | UUID | FK → types (익힘수준) |
| mastery_score | decimal | 익힘점수 (익힘수준의 기준점수) |
| next_review_at | timestamptz | 다음학습시간 |
| last_checked_at | timestamptz | 마지막 체크 시간 |
| check_count | integer | 총 체크 횟수 |

#### terms (약관)
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| country_code | text | 국가 코드 |
| terms_type_id | UUID | FK → types (약관유형) |
| version | text | 버전 (예: "1.0", "1.1") |
| revision_summary | text | 개정개요 |
| summary | varchar(200) | 약관요약 |
| non_consent_notice | text | 비합의시 안내 |
| is_required | boolean | 필수동의 필요여부 |
| is_active | boolean | 사용여부 |
| content | text | 리치텍스트 콘텐츠 (HTML) |
| published_at | timestamptz | 공시일 |

#### subscriptions
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| user_id | UUID | FK → users |
| plan_type | text | monthly / yearly |
| status | text | trial / active / cancelled / expired |
| trial_start_at | timestamptz | 무료체험 시작 (가입일) |
| trial_end_at | timestamptz | 무료체험 종료 (가입일 + 30일) |
| current_period_start | timestamptz | 현재 구독 기간 시작 |
| current_period_end | timestamptz | 현재 구독 기간 종료 |
| payment_provider | text | toss / stripe / apple / google |
| external_subscription_id | text | 외부 결제 시스템 구독 ID |
| auto_renew | boolean | 자동갱신 여부 |
| cancelled_at | timestamptz | 해지 요청일 |

#### coupons
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| user_id | UUID | FK → users |
| coupon_type | text | mileage_exchange / referral / admin_issued |
| benefit_type | text | free_week 등 |
| benefit_days | integer | 무료 이용 일수 |
| issued_at | timestamptz | 발급일 |
| expires_at | timestamptz | 만료일 (발급일 + 30일 기본) |
| used_at | timestamptz | 사용일 |
| is_used | boolean | 사용여부 |

#### mileage_transactions
| 컬럼 | 타입 | 설명 |
|------|------|------|
| id | UUID | PK |
| user_id | UUID | FK → users |
| amount | integer | 포인트 변동량 (+/-) |
| balance_after | integer | 변동 후 잔액 |
| transaction_type | text | daily_complete / streak_3 / streak_10 / streak_30 / exchange / referral |
| description | text | 설명 |
| created_at | timestamptz | 발생일시 |

---

## 5. 다국어 전략 (i18n Strategy)

### 5.1 UI 언어 (UI Language)

| 시스템 | 지원 언어 | 비고 |
|--------|----------|------|
| 사용자 웹 | 한국어 + 영어 | 사용자 모국어 설정에 따라 전환 |
| 사용자 모바일 앱 | 한국어 + 영어 | 동일 |
| 관리자 웹 | 한국어 단일 | i18n 구조는 적용하여 향후 확장 가능 |

### 5.2 학습 언어 구성 (Learning Language Configuration)

| 구분 | 지원 언어 |
|------|----------|
| **모국어 (Mother Tongue)** | 한국어, 영어 (2개, 향후 확장 가능) |
| **학습언어 (Learning Language)** | 영어, 스페인어, 중국어, 일어, 한국어 (5개) |
| **표현언어 (Expression Language)** | 영어, 스페인어, 중국어, 일어 (4개) |

### 5.3 의미 표시 규칙 (Meaning Display Rules)

| 사용자 모국어 | 표시되는 의미 | 학습 시 의미 표시 |
|-------------|-------------|----------------|
| 한국어 | 문장의 국문 의미 (summary) | 한국어 의미 |
| 영어 (또는 기타) | 문장의 영문 의미 (summary_en) | 영어 의미 |

> 모국어가 표현언어에 없을 경우, 영어가 기본 표시.

### 5.4 날짜/통화 형식 (Date & Currency Formatting)

- 사용자 기기/브라우저 locale 기준 자동 적용
- `Intl` API 활용 (Intl.DateTimeFormat, Intl.NumberFormat)

---

## 6. UI/UX 설계 (UI/UX Design)

### 6.1 디자인 시스템 (Design System)

- **디자인 토큰**: `design-tokens.json`으로 관리
- **향후**: Figma MCP를 이용한 디자인 토큰 업데이트 예정
- **원칙**: 하드코딩된 색상/간격 사용 금지, 반드시 디자인 토큰 참조

### 6.2 반응형 설계 (Responsive Design)

| 시스템 | 지원 범위 | 비고 |
|--------|----------|------|
| 사용자 웹 | 모바일 우선 반응형 (320px ~ 1440px) | Mobile-first |
| 관리자 웹 | 데스크톱 전용 (최소 1280px) | Desktop only |

### 6.3 다크 모드 (Dark Mode)

- **초기 출시부터 다크 모드 지원**
- CSS 변수(custom properties) 기반 구현
- 디자인 토큰에 light/dark 테마 모두 정의

### 6.4 카드 애니메이션 (Card Animation)

- **방식**: 세로 방향 슬라이드(아래에서 위로) + 페이드 조합
- **라이브러리**: Framer Motion

### 6.5 차트 (Charts)

- **라이브러리**: Recharts
- **용도**: 문장용도별 레이더 차트 통계 (사용자의 강약점 시각화)

### 6.6 컴포넌트 설계 (Component Design)

| 유형 | 설명 | 위치 |
|------|------|------|
| **코어 컴포넌트** | Input, Checkbox, Button, Modal 등 | `packages/shared-ui` |
| **콘텐츠 컴포넌트 (공통)** | 여러 기능에 사용되는 목록 항목 등 | 해당 앱의 `common/` |
| **콘텐츠 컴포넌트 (기능별)** | 특정 기능 전용 컴포넌트 | 해당 기능 디렉터리 하위 |

---

## 7. 결제 시스템 (Payment System)

### 7.1 결제 수단 (Payment Methods)

| 구분 | PG사 | 플랫폼 |
|------|------|--------|
| **국내 온라인 결제** | TossPayments | 웹 (PC/모바일) |
| **해외 온라인 결제** | Stripe | 웹 (PC/모바일) |
| **Apple 인앱결제** | Apple IAP | iOS 앱 |
| **Google 인앱결제** | Google Play Billing | Android 앱 |

- 인앱결제와 외부결제 **동일 가격** 적용
- 앱스토어 정책상 외부결제 유도 시 리젝 위험이 있으므로 신중하게 접근

### 7.2 구독 정책 (Subscription Policy)

| 항목 | 내용 |
|------|------|
| 자동 갱신 | O |
| 중도 해지 | 잔여 기간까지 서비스 이용 가능, 잔여분 환불 없음 |
| 무료 체험 | 가입일 기준 30일 |
| 갱신 알림 | 자동 갱신 3일 전 알림 (한국 전자상거래법) |
| 청약 철회 | 7일 이내 (한국 전자상거래법) |

### 7.3 쿠폰 시스템 (Coupon System)

| 쿠폰 유형 | 발급 조건 | 혜택 | 유효기간 |
|----------|----------|------|---------|
| 마일리지 교환 | 10,000pt 교환 | 1주일 학습권 | 30일 |
| 추천인 쿠폰 | 친구 가입 완료 시 | 1주일 무료 (추천인 + 피추천인 양쪽) | 30일 |
| 관리자 수동 발급 | 관리자 직접 발급 | 설정에 따름 | 30일 (기본) |

- 유효기간 만료 시 자동 비활성화

---

## 8. 마일리지 시스템 (Mileage System)

### 8.1 적립 규칙 (Earning Rules)

| 조건 | 적립 포인트 | 비고 |
|------|-----------|------|
| 일학습 완료 | +10pt | 일학습완료 기준 충족 시 |
| 3일 연속 학습 | +30pt | 추가 보너스 |
| 10일 연속 학습 | +200pt | 추가 보너스 |
| 30일 연속 학습 | +500pt | 추가 보너스 |

### 8.2 사용 규칙 (Spending Rules)

| 교환 조건 | 혜택 |
|----------|------|
| 10,000pt | 1주일 학습권 쿠폰 |

### 8.3 추천인 보상 (Referral Reward)

- 추천인과 피추천인 **양쪽 모두** 1주일 무료 쿠폰 지급
- 피추천인 가입 완료 시 자동 발급

---

## 9. 보안 및 규정 (Security & Compliance)

### 9.1 데이터베이스 보안 (Database Security)

| 항목 | 정책 |
|------|------|
| **RLS** | 모든 테이블에 Row Level Security 적용 |
| **관리자 테이블** | service_role key 또는 관리자 role 기반 정책 |
| **API 요청 제한** | Supabase 기본 Rate Limiting 사용 |
| **무료 사용자 제한** | 클라이언트 레벨에서 하루 3문장 제한 처리 |

### 9.2 계정 관리 정책 (Account Management Policy)

| 항목 | 정책 |
|------|------|
| **계정 삭제** | 탈퇴 요청 후 30일 유예 (복원 가능), 이후 개인정보 파기 |
| **휴면 전환** | 1년 미접속 시 휴면 전환 |
| **닉네임** | 금칙어 필터 적용 |

### 9.3 개인정보보호 (Privacy)

| 항목 | 내용 |
|------|------|
| **초기 대응** | 한국 PIPA + GDPR 기본 준수 |
| **구조적 대비** | 국가별 약관 등록 기능으로 각국 법률 대응 가능한 구조 |
| **CCPA** | 미국 출시 시 추가 대응 |
| **데이터 수집 동의** | 5종 약관 (건강정보 수집동의 삭제) |

### 9.4 성인 인증 (Age Verification)

- 생년월일 기반 자동 차단
- 국가별 성인 기준 적용 (기본 만 18세)
- 앱스토어 연령 등급 17+ 설정
- 허위 입력 책임은 약관에서 면제

---

## 10. 기술 스택 (Tech Stack)

### 10.1 전체 스택 (Full Stack)

| 영역 | 기술 |
|------|------|
| **모노레포** | Turborepo |
| **관리자 웹** | Next.js + React + TailwindCSS |
| **사용자 웹** | Next.js + React + TailwindCSS |
| **모바일 앱** | React Native + Expo |
| **백엔드** | Supabase (Auth, PostgreSQL, Storage, Edge Functions) |
| **로컬 DB (웹)** | Dexie.js (IndexedDB 래퍼) |
| **로컬 DB (모바일)** | WatermelonDB (SQLite 기반) |
| **동기화** | Last Write Wins (최신 타임스탬프 기준) |
| **차트** | Recharts |
| **애니메이션** | Framer Motion |
| **에러 추적** | Sentry (무료 티어) |
| **CI/CD** | GitHub Actions |
| **브랜치 전략** | GitHub Flow (main + feature branches) |
| **배포 (웹)** | Vercel |
| **배포 (백엔드)** | Supabase |

### 10.2 모니터링 (Monitoring)

| 항목 | 채널 | 내용 |
|------|------|------|
| **에러 알림** | Slack webhook | 500 에러 발생 시 즉시 |
| **결제 실패** | Slack webhook | 결제 실패 시 즉시 |
| **일일 KPI** | Slack webhook | 매일 오전 8시: 전일 신규가입 수, 유료회원 가입자 수, 탈퇴회원 수 |

### 10.3 테스트 (Testing)

| 테스트 유형 | 도구 | 커버리지 목표 |
|-----------|------|-------------|
| 단위 테스트 | Jest | 80%+ |
| E2E 테스트 (웹) | Playwright | 주요 흐름 100% (학습, 결제, 인증) |
| E2E 테스트 (모바일) | Detox | 주요 흐름 |
| 지원 OS | - | iOS 16+, Android 12+ |

### 10.4 환경 구성 (Environment)

| 환경 | 구성 |
|------|------|
| **dev** | 로컬 개발 환경 |
| **production** | Supabase 1개 프로젝트 |
| **테스트 데이터** | 별도 스키마 또는 테스트 prefix |
| **백업** | Supabase Pro 자동 백업 (일 1회, 7일 보관) |

---

## 11. 개발 로드맵 (Development Roadmap)

### 11.1 Phase 1 - MVP (10주)

| 단계 | 기간 | 산출물 |
|------|------|--------|
| **관리자 기능** | 4주 | 유형관리, 콘텐츠관리, 약관관리, 레벨관리, 정책관리, 회원관리 |
| **API** | 2주 | Supabase Edge Functions, Next.js API Routes |
| **사용자 웹** | 4주 | 인증, 회원가입, 진단, 레벨테스트, 학습, 기록, 마이페이지, 유료화 |

### 11.2 Phase 2 - 고도화 (별도 일정)

- 마일리지 시스템
- 공유기능 (레벨업 이미지, 레벨, 레벨개요)
- 레이더차트 통계
- 친구초대

### 11.3 Phase 3 - 모바일 (4주)

- React Native + Expo 모바일 앱
- Apple/Google 인앱결제
- Apple Sign-In

**총 예상 기간**: 14주 (MVP 10주 + 모바일 4주)

### 11.4 목표 사용자 규모 (Target Scale)

| 시점 | 동시 사용자 | 인프라 |
|------|-----------|--------|
| 출시 초기 | 100명 | Supabase Pro |
| 6개월 후 | 1,000명 | Supabase Pro |
| 1년 후 | 5,000명 | Supabase Pro |

---

## 12. 콘텐츠 제작 (Content Production)

### 12.1 약관 콘텐츠 (Terms Content)

| 항목 | 내용 |
|------|------|
| **회사명** | 쿠키앱스 |
| **담당자** | 김무현 |
| **이메일** | help@cookieapps.kr |
| **형식** | 한국 실정법에 맞는 초안, 약관조항제목 bold, SQL INSERT 쿼리 |
| **국가별** | 국가별 등록 구조로 대응 가능 |
| **약관 유형** | 5종 (서비스이용약관, 개인정보처리방침, 개인정보수집및이용동의, 유료서비스이용약관, 마케팅활용동의) |
| **미확인 정보** | `<OOO입력필요>` 형식의 더미 데이터 삽입 |

### 12.2 학습 콘텐츠 (Learning Content)

- `CONTENT-BASE.md` 파일 참조
- SQL INSERT 쿼리 형식으로 생성
- 초기 4개 표현 언어: 영어, 스페인어, 중국어, 일어

### 12.3 콘텐츠 버전 관리 (Content Versioning)

- **변경 이력 관리 불필요**
- 문장 변경 시 약관 또는 서비스 화면에서 일반론적 고지로 처리

---

## 13. 제약사항 (Constraints)

### 13.1 로딩 처리 (Loading)

- 데이터양이 많은 경우 (학습 데이터 로드 등) **progress bar** 사용
- 임의 비율이 아닌 **추정된 데이터양 기준**으로 진척 반영

### 13.2 로컬 DB 우선 전략 (Local DB First Strategy)

```
사용자 액션
  → 로컬 DB 업데이트
    → UI 즉시 업데이트
      → 원격 DB 비동기 동기화
```

### 13.3 원격 DB 접속 효율화 (Remote DB Optimization)

| 시점 | 동작 |
|------|------|
| **레벨업/스킬업** | 학습 문장 세트 일괄 수신 (batch fetch) |
| **당일 학습 종료** | 학습 기록 원격 DB 일괄 저장 |
| **세션 종료** | 일일 동기화 (daily sync) |

### 13.4 테이블 컬럼 구성 (Table Column Layout)

- 이메일 등 값이 긴 컬럼만 **가변 너비**
- 나머지는 값의 길이에 맞게 **컬럼 너비 고정**

### 13.5 데이터 보관 (Data Retention)

| 데이터 유형 | 보관 기간 |
|-----------|----------|
| 요약 데이터 | 영구 보관 |
| 상세 체크 로그 | 1년 보관 후 아카이브 |

### 13.6 API 버전 관리 (API Versioning)

- URL 기반: `/v1/`, `/v2/`
- Edge Functions에 적용

### 13.7 컴포넌트 기반 설계 (Component-Based Design)

- 중복되는 항목은 반드시 컴포넌트화
- 코어 컴포넌트 + 콘텐츠 컴포넌트 분리
- 여러 기능에 사용되는 컴포넌트는 `common/` 하위에 위치

---

## 14. 추가 산출물 요청 (Additional Deliverables)

### 14.1 GitHub Actions / GitHub Flow 배포 가이드

- GitHub Flow 브랜치 전략 설명
- GitHub Actions CI/CD 파이프라인 구성 가이드
- Vercel 자동 배포 설정 가이드
- Supabase 마이그레이션 자동화 가이드

### 14.2 Sentry 설정 및 사용 가이드

- Sentry 무료 티어 프로젝트 생성 방법
- Next.js (관리자/사용자 웹) Sentry SDK 설정 가이드
- React Native (모바일) Sentry SDK 설정 가이드
- 에러 모니터링 대시보드 활용법
- Slack 알림 연동 가이드

---

> **문서 종료**
>
> 이 PRD는 FlipFlip 서비스의 구현에 필요한 모든 상세 요구사항을 정의합니다.
> 다음 단계로 이 문서를 기반으로 시스템 설계 (DB 스키마 상세, API 명세, 화면 설계)를 수립합니다.
>
> This PRD defines all detailed requirements needed for FlipFlip service implementation.
> The next step is to establish system design (detailed DB schema, API specifications, screen design) based on this document.
