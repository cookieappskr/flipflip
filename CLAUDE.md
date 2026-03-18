# FlipFlip — Claude Code Context

## Project Overview

FlipFlip은 "세상에서 가장 쉬운 언어학습앱"으로, 카드 플립 UI를 통한 문장 단위 반복 학습 서비스입니다.

- **회사**: 쿠키앱스 (CookieApps)
- **컨셉**: 심플한 카드 플립 UI + 망각곡선 기반 반복 학습
- **타겟**: 중등교육을 받은 성인 (만 18세 이상)

## Tech Stack

- **Admin Web**: Next.js 14 + TailwindCSS + Supabase
- **User Web**: Next.js 14 + TailwindCSS + Supabase
- **Mobile**: React Native + Expo (예정)
- **Backend**: Supabase (PostgreSQL + Auth + Edge Functions)
- **Monorepo**: Turborepo
- **Design Tokens**: `shared-packages/design-tokens/design-tokens.json`

## Current Status

- Phase 1: Admin 시스템 구현 완료
- 콘텐츠 생성 완료: 스킬 400개, 문장 2,680개, 표현 13,400개 (4개 언어)

## Document Management Rules

### Naming Convention

- `PRD-*.md`: 제품 요구사항 문서 (Product Requirements)
- `0N-*.md`: 콘텐츠 명세 문서 (N = 순번)
- `FIX-*.md`: 수정 이력 문서

### Folder Structure

```
docs/
├── requirements/   # 요구사항 문서 (PRD, 질의서 등)
├── content/        # 콘텐츠 명세 (스킬, 문장, 표현)
├── data/           # SQL/CSV 데이터 파일
├── fix/            # 수정 이력
└── DOCS-INDEX.md   # 전체 문서 목차
```

### PRD Sync Timing

- PO가 요구사항 변경을 확인한 경우 즉시 PRD.md 현행화
- 변경사항은 PRD.md 내 해당 섹션에 `> **변경사항**: ...` 형식으로 기록
- 질의서(REQUIREMENTS-QUESTIONNAIRE.md)와 합의서(PRD-AGREEMENT.md)의 결정사항이 PRD.md에 반영되었는지 주기적 검증

## Key Decisions

- 전화번호 인증 제외 (PO 확인 2026-03-15)
- 건강정보 수집 약관 제거 (PO 확인)
- 응용문장 개념 유지 (PRD-BASE.md 변경이력 반영됨)
- Admin RBAC: 초기부터 역할 기반 접근 제어 설계

# Parallel Implementation

## Sub-Agent Routing Rules

**병렬 실행** (아래 조건이 모두 충족될 때):

- 3개 이상의 독립적인 작업 또는 서로 다른 도메인의 작업
- 작업 간 공유 상태 없음
- 파일 경계가 명확하고 겹침 없음

**순차 실행** (아래 조건 중 하나라도 해당될 때):

- 작업 간 의존성 존재 (B가 A의 결과 필요)
- 공유 파일이나 상태 존재 (머지 충돌 위험)

## Domain Parallel Patterns

기능 구현 시 도메인별 병렬 에이전트를 활용할 것:

- **Frontend agent**: React 컴포넌트, UI 상태, 폼
- **Backend agent**: API 라우트, 서버 액션, 비즈니스 로직
- **Database agent**: 스키마, 마이그레이션, 쿼리
- **Test agent**: 유닛 테스트, 통합 테스트

각 에이전트는 자신의 도메인만 담당하며 파일 겹침 없이 작업한다.

## 작업 원칙

- 독립적인 작업이 3개 이상일 때는 항상 병렬 서브에이전트를 사용
- 코드 리뷰 시 보안, 성능, 스타일 검토를 병렬로 수행
- 리서치/탐색 작업은 백그라운드 서브에이전트로 처리
