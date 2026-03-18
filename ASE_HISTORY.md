# ASE History

## [2026-03-16] UX-REVIEW 반영

### 완료 항목
1. **온보딩 6단계 축소**: 12단계 → 4단계 (약관동의 → 닉네임+생년월일 → 모국어+학습언어 → 추천인ID(선택))
   - 전화번호, 이메일, 프로필이미지를 필수 가입 단계에서 제거 (마이페이지에서 후속 입력)
   - 레벨테스트를 가입 필수 과정에서 분리 → 학습화면 하단 선택 버튼으로 이동
2. **모바일 스와이프 제스처**: 탭=뒤집기, 아래=완벽히맞춤, 위=대부분맞춤, 왼쪽=못맞춤
   - 최초 접근 시 SwipeGuide 일러스트 자동 표시
   - 도움말(?) 버튼으로 재표시 가능
3. **접근성 기본 요구사항**:
   - `prefers-reduced-motion` 대응
   - `focus-visible` 스타일링
   - 체크 버튼에 아이콘+텍스트 병행 (색각 이상 대응)
   - 카드에 `aria-label`, `role`, `tabindex` 적용
   - 최소 터치 타겟 44px (`touch-target` 유틸리티)
4. **레벨테스트 개선**: 시작 레벨 5로 변경, "건너뛰기" 옵션 추가, 진행 상황 표시

## [2026-03-16] 학습화면 UI/UX + 비즈니스로직 개선

### 완료 항목
1. **캘린더 UI**: 좌우폭 콘텐츠 동일 너비(grid 7컬럼), 원 크기 w-7→w-9, 하단 마진 확대
2. **퀴즈카드 UI**:
   - 유형배지(시제/패턴) → 카드 좌상단 배치
   - 익힘수준(첫암기/미비/익숙/매우익숙/완벽) → 카드 우상단 옅은색 배지
   - 힌트 → 문장 텍스트 우측 전구 아이콘 버튼으로 변경
   - 문장 폰트 text-lg → text-xl 확대
   - "탭하여 정답보기" → 하루 최초 1회만 표시 (localStorage 날짜 키)
3. **비즈니스로직**: 학습문장수 < 최소체크문장수일 때 다음 스킬 문장 자동 추가 로딩
4. **검증용 디버그**: 체크 후 "다음학습 시간" 토스트(2초) + 하단 디버그 패널(일학습시간, 최소체크문장수, 로컬문장수, 세션문장수, 누적익힘점수)
5. **마이페이지**: 일학습목표시간 현재 설정값 표시 + 변경 버튼
6. **체크버튼**: 키캡 스타일 단축키 통합, 색상 한 톤 다운(emerald/amber/red 400/80), 아이콘+텍스트 병행
7. **유형배지**: rounded-md border 스타일, 시제=파란색, 패턴=보라색

### PRD 반영 사항
- 온보딩 플로우: 12단계 → 4단계 (약관→프로필→언어→추천인)
- 레벨테스트: 가입 필수 → 학습화면에서 선택적 진행
- 레벨테스트 시작 레벨: Level 1 → Level 5
- 스와이프 제스처: 탭=뒤집기, 오른쪽=완벽, 아래=대부분, 왼쪽=못맞춤
- 키보드 단축키: ↑/Enter/Space=뒤집기, →=완벽, ↓=대부분, ←=못맞춤
- 세션 문장 로딩: 최소체크문장수 미달 시 다음 스킬 문장 자동 추가

## [2026-03-16] 학습화면 추가 수정 (2차)

### 완료 항목
1. **학습데이터 로딩**: 스핀 로딩 → 프로그레스바 + 문장수 텍스트 ("총 N개의 새로운 학습데이터를 가져오고 있습니다")
2. **캘린더**: 좌우 패딩 +24px (px-6), 내부 py-2 추가
3. **스킬게이지**: "{스킬명} 스킬" 형태로 텍스트 표시
4. **퀴즈카드**:
   - 힌트버튼 → 문장 하단에 테두리 있는 아이콘+텍스트 버튼 ("힌트")
   - 문장 폰트 text-xl → text-2xl, font-semibold → font-bold
5. **검증용 데이터**: 토스트 → alert("다음학습 시간 : YYYY-MM-DD hh:mm"), 확인 후 넘어감
6. **마이페이지**: 일학습목표시간 현재값 표시 + "변경" 버튼
7. **온보딩 daily_goal 누락 수정**: register/language에 하루학습목표시간 선택 추가 → API에 daily_goal_type_id 저장

### PRD 반영 사항
- 가입 플로우에 일학습목표시간 선택 포함 (register/language 페이지)
- 비즈니스로직: 학습문장수 < 최소체크문장수일 때 다음 스킬 문장 자동 추가

## [2026-03-18] TASK.md 카드 토글 수정 + PO-ACTION-ITEMS 7대 기능 구현

### 완료 항목
1. **카드 토글 수정**: QuizFlipCard exit/initial 애니메이션 방향 수정 — 체크 시 뒤집기와 동일 방향으로 회전
2. **결제 시스템 (TossPayments)**: 빌링키 등록 + 정기결제 API (billing-key, status, cancel, refund, webhook), 가격 페이지 리라이트 (₩1,900/₩11,400), 결제 성공/실패 페이지, useSubscription 훅, SubscriptionStatus 컴포넌트, MyPage 통합
3. **무료체험 만료 제한**: 구독 만료 시 하루 10문장 제한, TrialLimitBanner 컴포넌트, 학습세션 API에 제한 로직 추가
4. **일일학습 완료 + WeekStreak 실데이터**: daily-status API, complete API (마일리지 적립), WeekStreak에 실제 완료 데이터 연동
5. **마일리지 시스템**: 적립 (일학습 +10pt, 3일연속 +30pt, 10일 +200pt, 30일 +500pt), 교환 (5,000pt = 7일 학습권), MileageDisplay 컴포넌트, 학습페이지 상단 표시
6. **Sentry + Slack 알림**: Web/Admin 양쪽 Sentry 통합 (DSN 설정, next.config.js 래핑), Slack 웹훅 유틸리티, 결제 웹훅에 알림 연동
7. **계정 삭제/휴면 처리**: 소프트 삭제 (30일 유예), 삭제 취소, 휴면 계정 자동 재활성화, DeleteAccountDialog 컴포넌트, MyPage 통합
8. **추천인 시스템**: 닉네임 기반 추천 코드, 5회 제한, 양쪽 7일 쿠폰 발급, 가입 시 추천인 검증/쿠폰 발급, MyReferralCode 컴포넌트

### 생성된 파일 (주요)
- `supabase/migrations/20260318_payment_history.sql` — payment_history 테이블 + subscriptions 컬럼 추가
- `src/lib/payments/toss.ts`, `constants.ts` — TossPayments 서버 유틸리티
- `src/lib/supabase/admin.ts` — Service role 클라이언트
- `src/app/api/payments/` — billing-key, status, cancel, refund, webhook
- `src/app/api/learning/daily-status/`, `complete/` — 일일학습 상태/완료
- `src/app/api/mileage/`, `mileage/exchange/` — 마일리지 조회/교환
- `src/app/api/account/delete/`, `cancel-delete/` — 계정 삭제/취소
- `src/app/api/referral/validate/`, `process/`, `status/` — 추천인 시스템
- `src/app/pricing/success/`, `fail/` — 결제 리다이렉트 페이지
- `src/components/payment/SubscriptionStatus.tsx` — 구독 상태 컴포넌트
- `src/components/learning/MileageDisplay.tsx`, `TrialLimitBanner.tsx` — 학습 UI
- `src/components/account/DeleteAccountDialog.tsx` — 계정 삭제 다이얼로그
- `src/components/referral/MyReferralCode.tsx` — 추천 코드 컴포넌트
- `src/lib/hooks/useSubscription.ts` — 구독 상태 훅
- `src/lib/utils/subscriptionCheck.ts`, `accountStatus.ts` — 유틸리티
- `src/lib/slack.ts` — Slack 웹훅 유틸리티
- `sentry.*.config.ts`, `instrumentation.ts` — Sentry 설정 (web + admin)

### PRD 반영 사항
- 결제: 월간 ₩990 → ₩1,900, 연간 ₩9,900 → ₩11,400 (PO 변경)
- 무료체험 제한: 하루 3문장 → 하루 10문장 (PO 변경)
- 마일리지 교환: 10,000pt → 5,000pt (PO 변경)
- 마일리지 표시: 학습페이지 상단 (다크모드 변환부 대체)
- 추천인: 닉네임 기반, 5회 제한, 양쪽 1주 쿠폰 (PO 확정)
- 계정 삭제: 30일 유예, 구독 기간 유지 후 삭제 (PO 확정)
- 휴면 해제: 로그인 시 자동 해제 (PO 확정)
