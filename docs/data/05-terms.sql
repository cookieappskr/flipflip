-- ============================================================
-- FlipFlip Terms & Policies INSERT Statements
-- Generated: 2026-03-16
-- Table: terms
-- 10 rows total: 5 terms types x 2 countries (KR, US)
-- ============================================================

DO $$
DECLARE
  v_service_terms_id UUID;
  v_privacy_policy_id UUID;
  v_data_collection_id UUID;
  v_paid_service_terms_id UUID;
  v_marketing_id UUID;
BEGIN
  SELECT id INTO v_service_terms_id FROM public.types WHERE type_code = 'SERVICE_TERMS' AND parent_id IS NOT NULL;
  SELECT id INTO v_privacy_policy_id FROM public.types WHERE type_code = 'PRIVACY_POLICY' AND parent_id IS NOT NULL;
  SELECT id INTO v_data_collection_id FROM public.types WHERE type_code = 'DATA_COLLECTION' AND parent_id IS NOT NULL;
  SELECT id INTO v_paid_service_terms_id FROM public.types WHERE type_code = 'PAID_SERVICE_TERMS' AND parent_id IS NOT NULL;
  SELECT id INTO v_marketing_id FROM public.types WHERE type_code = 'MARKETING' AND parent_id IS NOT NULL;

  -- ============================================================
  -- 1. KR — SERVICE_TERMS (서비스이용약관)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'KR',
    v_service_terms_id,
    '1.0',
    '최초 제정',
    'FlipFlip 서비스 이용약관',
    '서비스 이용약관에 동의하지 않으시면 FlipFlip 서비스를 이용하실 수 없습니다.',
    true,
    true,
    '<h2>FlipFlip 서비스 이용약관</h2>
<p><strong>시행일:</strong> 2026년 3월 16일 | <strong>버전:</strong> 1.0</p>

<h3>제1조 (목적)</h3>
<p>이 약관은 쿠키앱스(이하 "회사")가 제공하는 FlipFlip 어학 학습 서비스(이하 "서비스")의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

<h3>제2조 (정의)</h3>
<ul>
<li><strong>"서비스"</strong>란 회사가 FlipFlip이라는 명칭으로 제공하는 어학 학습 관련 모든 서비스를 말합니다.</li>
<li><strong>"이용자"</strong>란 이 약관에 따라 회사가 제공하는 서비스를 이용하는 회원 및 비회원을 말합니다.</li>
<li><strong>"회원"</strong>이란 회사에 개인정보를 제공하여 회원 등록을 한 자로서, 회사의 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
<li><strong>"콘텐츠"</strong>란 회사가 서비스를 통해 제공하는 학습 자료, 문장, 음성, 이미지 등 모든 디지털 자료를 말합니다.</li>
</ul>

<h3>제3조 (약관의 효력 및 변경)</h3>
<ul>
<li>이 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.</li>
<li>회사는 관련 법령에 위배되지 않는 범위에서 이 약관을 개정할 수 있으며, 개정 시 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 서비스 초기 화면에 적용일자 7일 전부터 공지합니다.</li>
<li>이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 서비스 이용을 중단하고 탈퇴할 수 있습니다.</li>
</ul>

<h3>제4조 (서비스의 제공)</h3>
<ul>
<li>회사는 다음과 같은 서비스를 제공합니다:
  <ul>
  <li>플래시카드 기반 어학 학습 서비스</li>
  <li>간격 반복 학습(Spaced Repetition) 알고리즘 기반 복습 시스템</li>
  <li>학습 통계 및 진도 관리 서비스</li>
  <li>기타 회사가 추가 개발하거나 제휴 계약 등을 통해 이용자에게 제공하는 서비스</li>
  </ul>
</li>
<li>서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다. 다만, 시스템 점검, 증설 및 교체, 설비의 장애, 서비스 이용량의 폭주 등 불가피한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
</ul>

<h3>제5조 (이용 자격)</h3>
<ul>
<li>서비스는 만 19세 이상의 성인만 이용할 수 있습니다.</li>
<li>회원 가입 시 실명 및 실제 정보를 기재해야 하며, 허위 정보를 기재한 경우 법적 보호를 받을 수 없습니다.</li>
</ul>

<h3>제6조 (회원가입)</h3>
<ul>
<li>이용자는 회사가 정한 가입 양식에 따라 회원 정보를 기입한 후 이 약관에 동의한다는 의사 표시를 함으로써 회원 가입을 신청합니다.</li>
<li>회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다:
  <ul>
  <li>가입 신청자가 이 약관에 의하여 이전에 회원 자격을 상실한 적이 있는 경우</li>
  <li>등록 내용에 허위, 기재 누락, 오기가 있는 경우</li>
  <li>기타 회원으로 등록하는 것이 서비스 운영에 현저히 지장이 있다고 판단되는 경우</li>
  </ul>
</li>
</ul>

<h3>제7조 (회원 탈퇴 및 자격 상실)</h3>
<ul>
<li>회원은 회사에 언제든지 탈퇴를 요청할 수 있으며, 회사는 즉시 회원 탈퇴를 처리합니다.</li>
<li>회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원 자격을 제한 및 정지시킬 수 있습니다:
  <ul>
  <li>가입 신청 시 허위 내용을 등록한 경우</li>
  <li>다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li>
  <li>서비스를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
  </ul>
</li>
</ul>

<h3>제8조 (이용자의 의무)</h3>
<ul>
<li>이용자는 다음 행위를 하여서는 안 됩니다:
  <ul>
  <li>신청 또는 변경 시 허위 내용의 등록</li>
  <li>타인의 정보 도용</li>
  <li>회사가 게시한 정보의 변경</li>
  <li>회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
  <li>회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
  <li>회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
  <li>서비스의 안정적 운영을 방해하는 행위(해킹, 리버스 엔지니어링, 크롤링 등)</li>
  </ul>
</li>
</ul>

<h3>제9조 (저작권 및 지적재산권)</h3>
<ul>
<li>서비스에서 제공하는 모든 콘텐츠(학습 자료, 문장, 음성, UI 디자인 등)에 대한 저작권 및 지적재산권은 회사에 귀속됩니다.</li>
<li>이용자는 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.</li>
</ul>

<h3>제10조 (면책 조항)</h3>
<ul>
<li>회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 등 불가항력적인 사유로 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
<li>회사는 이용자의 귀책 사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.</li>
<li>회사는 이용자가 서비스를 이용하여 기대하는 학습 효과를 얻지 못한 것에 대해 책임을 지지 않습니다.</li>
</ul>

<h3>제11조 (분쟁 해결)</h3>
<ul>
<li>회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 고객센터를 운영합니다.</li>
<li>회사와 이용자 간에 발생한 분쟁에 관한 소송은 민사소송법상의 관할 법원에 제기합니다.</li>
</ul>

<h3>제12조 (연락처)</h3>
<ul>
<li>회사명: 쿠키앱스</li>
<li>대표자: 김무현</li>
<li>주소: 경기도 성남시 위례광장로97 2309동 1501호</li>
<li>이메일: help@cookieapps.kr</li>
<li>전화: 82+10-5386-6626</li>
</ul>

<p><strong>부칙:</strong> 이 약관은 2026년 3월 16일부터 시행합니다.</p>',
    now()
  );

  -- ============================================================
  -- 2. KR — PRIVACY_POLICY (개인정보처리방침)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'KR',
    v_privacy_policy_id,
    '1.0',
    '최초 제정',
    'FlipFlip 개인정보처리방침',
    '개인정보처리방침에 동의하지 않으시면 FlipFlip 서비스를 이용하실 수 없습니다.',
    true,
    true,
    '<h2>FlipFlip 개인정보처리방침</h2>
<p><strong>시행일:</strong> 2026년 3월 16일 | <strong>버전:</strong> 1.0</p>

<p>쿠키앱스(이하 "회사")는 「개인정보 보호법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령에 따라 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하게 처리하기 위하여 다음과 같이 개인정보처리방침을 수립·공개합니다.</p>

<h3>제1조 (개인정보의 처리 목적)</h3>
<p>회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행합니다.</p>
<ul>
<li><strong>회원 가입 및 관리:</strong> 회원 가입 의사 확인, 회원 식별 및 인증, 회원 자격 유지·관리, 서비스 부정 이용 방지, 각종 고지·통지</li>
<li><strong>서비스 제공:</strong> 학습 콘텐츠 제공, 학습 진도 관리, 맞춤형 학습 추천, 유료 서비스 결제 및 정산</li>
<li><strong>서비스 개선:</strong> 접속 빈도 파악, 서비스 이용 통계, 서비스 개선을 위한 분석</li>
</ul>

<h3>제2조 (수집하는 개인정보의 항목)</h3>
<ul>
<li><strong>필수 항목:</strong> 이메일 주소, 비밀번호(소셜 로그인 시 제외), 닉네임, 서비스 이용 기록, 접속 로그, 기기 정보(OS, 앱 버전)</li>
<li><strong>선택 항목:</strong> 프로필 이미지, 모국어, 학습 목표 언어</li>
<li><strong>자동 수집 항목:</strong> IP 주소, 쿠키, 방문 일시, 서비스 이용 기록, 기기 고유 식별 정보</li>
</ul>

<h3>제3조 (개인정보의 처리 및 보유 기간)</h3>
<ul>
<li>회사는 법령에 따른 개인정보 보유·이용 기간 또는 정보주체로부터 개인정보를 수집 시 동의받은 개인정보 보유·이용 기간 내에서 개인정보를 처리·보유합니다.</li>
<li><strong>회원 정보:</strong> 회원 탈퇴 시까지 (탈퇴 후 즉시 파기, 단 관련 법령에 따라 일정 기간 보관이 필요한 경우 해당 기간까지)</li>
<li><strong>전자상거래 관련 기록:</strong>
  <ul>
  <li>계약 또는 청약 철회 등에 관한 기록: 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
  <li>대금 결제 및 재화 등의 공급에 관한 기록: 5년</li>
  <li>소비자의 불만 또는 분쟁 처리에 관한 기록: 3년</li>
  </ul>
</li>
<li><strong>통신사실 확인자료:</strong> 3개월 (통신비밀보호법)</li>
<li><strong>접속 로그 기록:</strong> 최소 1년 (정보통신망법)</li>
</ul>

<h3>제4조 (개인정보의 제3자 제공)</h3>
<p>회사는 이용자의 개인정보를 제1조에서 명시한 범위 내에서만 처리하며, 이용자의 사전 동의 없이 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다:</p>
<ul>
<li>이용자가 사전에 동의한 경우</li>
<li>법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우</li>
<li>정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우</li>
</ul>

<h3>제5조 (개인정보 처리의 위탁)</h3>
<p>회사는 서비스 향상을 위해 다음과 같이 개인정보 처리 업무를 위탁하고 있습니다:</p>
<ul>
<li><strong>Supabase Inc.:</strong> 데이터베이스 호스팅, 인증 서비스 제공</li>
<li><strong>결제 대행사:</strong> 유료 서비스 결제 처리</li>
</ul>
<p>회사는 위탁 계약 체결 시 「개인정보 보호법」 제26조에 따라 위탁 업무 수행 목적 외 개인정보 처리 금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독합니다.</p>

<h3>제6조 (정보주체의 권리·의무 및 행사 방법)</h3>
<ul>
<li>이용자는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다:
  <ul>
  <li>개인정보 열람 요구</li>
  <li>오류 등이 있을 경우 정정 요구</li>
  <li>삭제 요구</li>
  <li>처리 정지 요구</li>
  </ul>
</li>
<li>권리 행사는 서비스 내 설정 메뉴 또는 이메일(help@cookieapps.kr)을 통해 가능합니다.</li>
</ul>

<h3>제7조 (개인정보의 안전성 확보 조치)</h3>
<p>회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다:</p>
<ul>
<li><strong>관리적 조치:</strong> 개인정보 보호 내부 관리 계획 수립 및 시행, 직원 교육</li>
<li><strong>기술적 조치:</strong> 개인정보 처리 시스템 접근 권한 관리, 접근 통제, 고유 식별 정보 등의 암호화, 보안 프로그램 설치</li>
<li><strong>물리적 조치:</strong> 전산실, 자료 보관실 등의 접근 통제</li>
</ul>

<h3>제8조 (개인정보 보호책임자)</h3>
<ul>
<li>성명: 김무현</li>
<li>직책: 대표</li>
<li>이메일: help@cookieapps.kr</li>
<li>전화: 82+10-5386-6626</li>
</ul>

<h3>제9조 (개인정보 처리방침 변경)</h3>
<p>이 개인정보 처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경 내용의 추가, 삭제 및 정정이 있는 경우에는 변경 사항의 시행 7일 전부터 서비스 공지사항을 통하여 고지합니다.</p>

<p><strong>부칙:</strong> 이 개인정보처리방침은 2026년 3월 16일부터 시행합니다.</p>',
    now()
  );

  -- ============================================================
  -- 3. KR — DATA_COLLECTION (개인정보수집및이용동의)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'KR',
    v_data_collection_id,
    '1.0',
    '최초 제정',
    'FlipFlip 개인정보 수집 및 이용 동의',
    '개인정보 수집 및 이용에 동의하지 않으시면 FlipFlip 서비스를 이용하실 수 없습니다.',
    true,
    true,
    '<h2>개인정보 수집 및 이용 동의</h2>
<p><strong>시행일:</strong> 2026년 3월 16일 | <strong>버전:</strong> 1.0</p>

<p>쿠키앱스(이하 "회사")는 FlipFlip 서비스 제공을 위해 아래와 같이 개인정보를 수집·이용하고자 합니다. 내용을 자세히 읽으신 후 동의 여부를 결정하여 주시기 바랍니다.</p>

<h3>1. 수집하는 개인정보 항목</h3>

<h3>(1) 회원 가입 시 (필수)</h3>
<ul>
<li>이메일 주소</li>
<li>비밀번호 (소셜 로그인 시 제외)</li>
<li>닉네임</li>
</ul>

<h3>(2) 소셜 로그인 시 (필수)</h3>
<ul>
<li>소셜 계정 고유 식별자</li>
<li>이메일 주소</li>
<li>프로필 이미지 (제공 시)</li>
</ul>

<h3>(3) 서비스 이용 과정에서 자동 수집되는 항목</h3>
<ul>
<li>IP 주소, 쿠키, 접속 일시</li>
<li>기기 정보 (기기 종류, OS 버전, 앱 버전)</li>
<li>서비스 이용 기록 (학습 기록, 진도율, 접속 로그)</li>
</ul>

<h3>2. 개인정보의 수집 및 이용 목적</h3>
<ul>
<li><strong>회원 관리:</strong> 가입 및 탈퇴 처리, 본인 확인, 부정 이용 방지, 고지 사항 전달</li>
<li><strong>서비스 제공:</strong> 학습 콘텐츠 제공, 학습 진도 관리 및 저장, 간격 반복 알고리즘에 의한 맞춤 복습 제공</li>
<li><strong>서비스 개선:</strong> 이용 통계 분석, 서비스 품질 향상, 신규 기능 개발</li>
<li><strong>결제:</strong> 유료 서비스 구매 시 결제 처리 및 환불</li>
</ul>

<h3>3. 개인정보의 보유 및 이용 기간</h3>
<ul>
<li>회원 탈퇴 시까지 보유하며, 탈퇴 시 지체 없이 파기합니다.</li>
<li>다만 관계 법령에 따라 보존이 필요한 경우, 해당 법령에서 정한 기간 동안 보관합니다:
  <ul>
  <li>계약 또는 청약 철회 등에 관한 기록: 5년</li>
  <li>대금 결제 및 재화 등의 공급에 관한 기록: 5년</li>
  <li>소비자의 불만 또는 분쟁 처리에 관한 기록: 3년</li>
  <li>접속에 관한 기록: 1년</li>
  </ul>
</li>
</ul>

<h3>4. 동의를 거부할 권리 및 거부 시 불이익</h3>
<p>이용자는 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부하실 경우 회원 가입 및 서비스 이용이 불가능합니다.</p>

<h3>5. 문의</h3>
<ul>
<li>개인정보 보호책임자: 김무현 (대표)</li>
<li>이메일: help@cookieapps.kr</li>
<li>전화: 82+10-5386-6626</li>
</ul>',
    now()
  );

  -- ============================================================
  -- 4. KR — PAID_SERVICE_TERMS (유료서비스이용약관)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'KR',
    v_paid_service_terms_id,
    '1.0',
    '최초 제정',
    'FlipFlip 유료서비스 이용약관',
    '유료서비스 이용약관에 동의하지 않으시면 유료 서비스를 이용하실 수 없습니다.',
    true,
    true,
    '<h2>FlipFlip 유료서비스 이용약관</h2>
<p><strong>시행일:</strong> 2026년 3월 16일 | <strong>버전:</strong> 1.0</p>

<p>이 약관은 쿠키앱스(이하 "회사")가 FlipFlip 서비스 내에서 제공하는 유료 서비스의 이용과 관련된 사항을 규정합니다. 본 약관에 명시되지 않은 사항은 FlipFlip 서비스 이용약관 및 관련 법령에 따릅니다.</p>

<h3>제1조 (정의)</h3>
<ul>
<li><strong>"유료 서비스"</strong>란 회사가 유료로 제공하는 프리미엄 학습 기능 및 콘텐츠를 말합니다.</li>
<li><strong>"구독"</strong>이란 월간 또는 연간 단위로 유료 서비스를 이용할 수 있는 권리를 구매하는 것을 말합니다.</li>
<li><strong>"무료 체험"</strong>이란 유료 서비스를 일정 기간 동안 무료로 이용할 수 있는 기간을 말합니다.</li>
</ul>

<h3>제2조 (유료 서비스의 내용 및 요금)</h3>
<ul>
<li>유료 서비스의 종류 및 요금은 다음과 같습니다:
  <ul>
  <li><strong>월간 구독:</strong> ₩990 / $0.99 (부가세 포함)</li>
  <li><strong>연간 구독:</strong> ₩9,900 / $9.90 (부가세 포함)</li>
  </ul>
</li>
<li>회사는 유료 서비스의 요금을 변경할 수 있으며, 변경 시 30일 전에 서비스 내 공지합니다.</li>
<li>요금 변경은 변경 공지 이후 신규 결제 또는 갱신 결제부터 적용됩니다.</li>
</ul>

<h3>제3조 (무료 체험)</h3>
<ul>
<li>회사는 신규 가입 회원에게 30일간의 무료 체험 기간을 제공합니다.</li>
<li>무료 체험 기간 동안 유료 서비스의 모든 기능을 이용할 수 있습니다.</li>
<li>무료 체험 기간 종료 후 자동으로 유료 구독으로 전환되지 않으며, 이용자가 직접 구독을 신청해야 합니다.</li>
<li>무료 체험은 1인 1회에 한하며, 동일인의 재가입 시에는 제공되지 않습니다.</li>
</ul>

<h3>제4조 (결제)</h3>
<ul>
<li>유료 서비스의 결제는 앱스토어(Apple App Store, Google Play Store) 인앱 결제 또는 회사가 지정한 결제 수단을 통해 이루어집니다.</li>
<li>구독 결제는 구독 기간 만료일에 자동으로 갱신됩니다. 자동 갱신을 원하지 않는 경우, 갱신일 최소 24시간 전에 구독을 해지해야 합니다.</li>
<li>결제와 관련된 분쟁이 발생한 경우, 이용자는 결제 수단 제공자(앱스토어 등)의 정책에 따라 처리될 수 있습니다.</li>
</ul>

<h3>제5조 (구독 해지 및 환불)</h3>
<ul>
<li>이용자는 언제든지 구독을 해지할 수 있으며, 해지 시 현재 구독 기간 종료일까지 서비스를 이용할 수 있습니다.</li>
<li>환불은 「전자상거래 등에서의 소비자보호에 관한 법률」 및 「콘텐츠산업진흥법」에 따라 처리됩니다:
  <ul>
  <li>구매 후 7일 이내 서비스를 이용하지 않은 경우: 전액 환불</li>
  <li>서비스 장애로 인해 이용이 불가능했던 기간이 있는 경우: 해당 기간에 대한 이용료 환불</li>
  <li>이미 상당 부분 서비스를 이용한 경우: 잔여 기간에 대한 일할 계산 환불 (수수료 차감 가능)</li>
  </ul>
</li>
<li>앱스토어를 통해 결제한 경우, 환불은 해당 앱스토어의 환불 정책에 따릅니다.</li>
</ul>

<h3>제6조 (서비스 변경 및 중단)</h3>
<ul>
<li>회사는 사업상 중요한 사유가 있는 경우 유료 서비스의 전부 또는 일부를 변경하거나 중단할 수 있습니다.</li>
<li>유료 서비스가 중단되는 경우, 회사는 이용자에게 30일 전에 공지하며, 잔여 이용 기간에 대해 환불합니다.</li>
</ul>

<h3>제7조 (청약 철회의 제한)</h3>
<p>다음 각 호에 해당하는 경우, 「전자상거래 등에서의 소비자보호에 관한 법률」 제17조 제2항에 따라 청약 철회가 제한될 수 있습니다:</p>
<ul>
<li>이용자에게 책임이 있는 사유로 서비스가 멸실되거나 훼손된 경우</li>
<li>이용자의 사용 또는 일부 소비에 의하여 서비스의 가치가 현저히 감소한 경우</li>
<li>디지털 콘텐츠의 제공이 개시된 경우 (단, 가분적 서비스의 경우 미제공 부분은 제외)</li>
</ul>

<h3>제8조 (문의)</h3>
<ul>
<li>유료 서비스 관련 문의: help@cookieapps.kr</li>
<li>전화: 82+10-5386-6626</li>
</ul>

<p><strong>부칙:</strong> 이 약관은 2026년 3월 16일부터 시행합니다.</p>',
    now()
  );

  -- ============================================================
  -- 5. KR — MARKETING (마케팅활용동의)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'KR',
    v_marketing_id,
    '1.0',
    '최초 제정',
    'FlipFlip 마케팅 활용 동의',
    '마케팅 활용에 동의하지 않으셔도 서비스 이용에는 제한이 없습니다. 다만, 할인 혜택 및 이벤트 정보를 받으실 수 없습니다.',
    false,
    true,
    '<h2>마케팅 활용 동의</h2>
<p><strong>시행일:</strong> 2026년 3월 16일 | <strong>버전:</strong> 1.0</p>

<p>쿠키앱스(이하 "회사")는 FlipFlip 서비스의 다양한 혜택과 정보를 제공하기 위해 아래와 같이 개인정보를 마케팅 목적으로 활용하고자 합니다.</p>

<h3>1. 마케팅 활용 항목</h3>
<ul>
<li>이메일 주소</li>
<li>닉네임</li>
<li>서비스 이용 기록 (학습 현황, 관심 콘텐츠 등)</li>
<li>기기 정보</li>
</ul>

<h3>2. 마케팅 활용 목적</h3>
<ul>
<li>신규 기능 및 콘텐츠 안내</li>
<li>할인, 프로모션, 이벤트 정보 발송</li>
<li>맞춤형 학습 추천 및 학습 팁 제공</li>
<li>서비스 만족도 조사 및 설문</li>
<li>통계 분석 기반 서비스 개선 (비식별화 처리 후 활용)</li>
</ul>

<h3>3. 마케팅 정보 전달 방법</h3>
<ul>
<li>이메일</li>
<li>앱 내 푸시 알림</li>
<li>앱 내 팝업 또는 배너</li>
</ul>

<h3>4. 보유 및 이용 기간</h3>
<ul>
<li>동의 철회 시 또는 회원 탈퇴 시까지</li>
<li>동의 철회 후에는 마케팅 목적의 개인정보 처리를 즉시 중단합니다.</li>
</ul>

<h3>5. 동의 거부 및 철회</h3>
<ul>
<li>마케팅 활용 동의는 선택 사항이며, 동의하지 않으셔도 FlipFlip 서비스 이용에 제한은 없습니다.</li>
<li>동의 후에도 언제든지 서비스 내 설정 또는 이메일(help@cookieapps.kr)을 통해 동의를 철회할 수 있습니다.</li>
<li>동의 철회 시, 철회일로부터 영업일 기준 3일 이내에 마케팅 정보 발송이 중단됩니다.</li>
</ul>

<p>「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제50조에 따라 영리 목적의 광고성 정보는 이용자의 사전 동의를 받아 전송됩니다.</p>',
    now()
  );

  -- ============================================================
  -- 6. US — SERVICE_TERMS (Terms of Service)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'US',
    v_service_terms_id,
    '1.0',
    'Initial version',
    'FlipFlip Terms of Service',
    'You must agree to the Terms of Service to use FlipFlip.',
    true,
    true,
    '<h2>FlipFlip Terms of Service</h2>
<p><strong>Effective Date:</strong> March 16, 2026 | <strong>Version:</strong> 1.0</p>

<p>Welcome to FlipFlip. These Terms of Service ("Terms") govern your access to and use of the FlipFlip language learning application and related services (collectively, the "Service") provided by CookieApps ("Company," "we," "us," or "our"). By accessing or using the Service, you agree to be bound by these Terms.</p>

<h3>1. Eligibility</h3>
<p>The Service is intended solely for users who are 18 years of age or older. By using the Service, you represent and warrant that you are at least 18 years old. If you are under 18, you may not use the Service. Because the Service is restricted to adults, the Children''s Online Privacy Protection Act (COPPA) does not apply.</p>

<h3>2. Account Registration</h3>
<ul>
<li>To access certain features of the Service, you must create an account. You agree to provide accurate, current, and complete information during registration.</li>
<li>You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</li>
<li>You must notify us immediately at help@cookieapps.kr if you become aware of any unauthorized use of your account.</li>
</ul>

<h3>3. Description of Service</h3>
<p>FlipFlip is a language learning application that provides:</p>
<ul>
<li>Flashcard-based language learning content</li>
<li>Spaced repetition algorithm-driven review system</li>
<li>Learning progress tracking and statistics</li>
<li>Premium features available through paid subscriptions</li>
</ul>

<h3>4. Acceptable Use</h3>
<p>You agree not to:</p>
<ul>
<li>Use the Service for any unlawful purpose or in violation of any applicable laws or regulations</li>
<li>Reverse engineer, decompile, disassemble, or otherwise attempt to derive the source code of the Service</li>
<li>Use any automated means (bots, scrapers, crawlers) to access the Service</li>
<li>Interfere with or disrupt the integrity or performance of the Service</li>
<li>Attempt to gain unauthorized access to any portion of the Service or its related systems</li>
<li>Reproduce, distribute, publicly display, or create derivative works based on the Service or its content without prior written authorization</li>
<li>Share your account credentials with any third party or allow others to access the Service through your account</li>
</ul>

<h3>5. Intellectual Property</h3>
<ul>
<li>All content, features, and functionality of the Service, including but not limited to text, graphics, logos, audio, video, learning materials, and software, are the exclusive property of CookieApps and are protected by copyright, trademark, and other intellectual property laws.</li>
<li>You are granted a limited, non-exclusive, non-transferable, revocable license to use the Service for personal, non-commercial purposes in accordance with these Terms.</li>
</ul>

<h3>6. User Content</h3>
<ul>
<li>You retain ownership of any content you submit through the Service (e.g., custom flashcards, notes).</li>
<li>By submitting content, you grant the Company a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, and display such content solely for the purpose of operating and improving the Service.</li>
</ul>

<h3>7. Third-Party Services</h3>
<p>The Service may contain links to or integrations with third-party services. We are not responsible for the content, privacy policies, or practices of third-party services. Your use of third-party services is at your own risk.</p>

<h3>8. Disclaimer of Warranties</h3>
<p>THE SERVICE IS PROVIDED "AS IS" AND "AS AVAILABLE" WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE DO NOT WARRANT THAT THE SERVICE WILL BE UNINTERRUPTED, ERROR-FREE, OR SECURE. WE MAKE NO GUARANTEES REGARDING THE LEARNING OUTCOMES OR RESULTS YOU MAY ACHIEVE THROUGH THE SERVICE.</p>

<h3>9. Limitation of Liability</h3>
<p>TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL COOKIEAPPS, ITS OFFICERS, DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING BUT NOT LIMITED TO LOSS OF PROFITS, DATA, OR USE, ARISING OUT OF OR RELATING TO YOUR USE OF THE SERVICE, WHETHER BASED ON WARRANTY, CONTRACT, TORT (INCLUDING NEGLIGENCE), OR ANY OTHER LEGAL THEORY, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</p>

<h3>10. Indemnification</h3>
<p>You agree to indemnify, defend, and hold harmless CookieApps and its officers, directors, employees, and agents from and against any claims, liabilities, damages, losses, costs, or expenses (including reasonable attorneys'' fees) arising out of or relating to your use of the Service or violation of these Terms.</p>

<h3>11. Modification of Terms</h3>
<p>We reserve the right to modify these Terms at any time. We will provide notice of material changes by posting the updated Terms within the Service at least 7 days before they take effect. Your continued use of the Service after the effective date constitutes acceptance of the modified Terms.</p>

<h3>12. Termination</h3>
<ul>
<li>You may terminate your account at any time by deleting your account through the Service settings or by contacting us at help@cookieapps.kr.</li>
<li>We may suspend or terminate your access to the Service at our sole discretion, without prior notice, for conduct that we determine violates these Terms or is harmful to other users, us, or third parties.</li>
</ul>

<h3>13. Governing Law and Dispute Resolution</h3>
<p>These Terms shall be governed by and construed in accordance with the laws of the State of California, without regard to its conflict of laws principles. Any dispute arising out of or relating to these Terms shall be resolved exclusively in the state or federal courts located in Santa Clara County, California.</p>

<h3>14. Severability</h3>
<p>If any provision of these Terms is held to be invalid or unenforceable, the remaining provisions shall continue in full force and effect.</p>

<h3>15. Entire Agreement</h3>
<p>These Terms, together with our Privacy Policy and any other agreements referenced herein, constitute the entire agreement between you and CookieApps regarding your use of the Service.</p>

<h3>16. Contact Information</h3>
<ul>
<li>Company: CookieApps</li>
<li>Representative: KIM MU HYUN</li>
<li>Address: 2309-dong 1501-ho, 97 Wiryegwangjang-ro, Seongnam-si, Gyeonggi-do, Republic of Korea</li>
<li>Email: help@cookieapps.kr</li>
<li>Phone: +82-10-5386-6626</li>
</ul>',
    now()
  );

  -- ============================================================
  -- 7. US — PRIVACY_POLICY (Privacy Policy)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'US',
    v_privacy_policy_id,
    '1.0',
    'Initial version',
    'FlipFlip Privacy Policy',
    'You must agree to the Privacy Policy to use FlipFlip.',
    true,
    true,
    '<h2>FlipFlip Privacy Policy</h2>
<p><strong>Effective Date:</strong> March 16, 2026 | <strong>Version:</strong> 1.0</p>

<p>CookieApps ("Company," "we," "us," or "our") operates the FlipFlip language learning application (the "Service"). This Privacy Policy explains how we collect, use, disclose, and safeguard your personal information when you use our Service.</p>

<h3>1. Information We Collect</h3>

<h3>(a) Information You Provide Directly</h3>
<ul>
<li><strong>Account Information:</strong> Email address, password (unless using social login), and display name</li>
<li><strong>Profile Information:</strong> Profile picture, native language, target learning language (optional)</li>
<li><strong>Payment Information:</strong> Payment details processed through Apple App Store, Google Play Store, or other payment processors (we do not directly store your full credit card numbers)</li>
</ul>

<h3>(b) Information Collected Automatically</h3>
<ul>
<li><strong>Usage Data:</strong> Learning progress, flashcard interactions, session duration, features used</li>
<li><strong>Device Information:</strong> Device type, operating system, app version, unique device identifiers</li>
<li><strong>Log Data:</strong> IP address, access times, pages viewed, app crashes, and system activity</li>
<li><strong>Cookies and Similar Technologies:</strong> We use cookies and similar tracking technologies to maintain sessions and analyze usage patterns</li>
</ul>

<h3>2. How We Use Your Information</h3>
<ul>
<li><strong>Service Delivery:</strong> To provide, maintain, and improve the Service, including personalized learning experiences powered by our spaced repetition algorithm</li>
<li><strong>Account Management:</strong> To create and manage your account, authenticate your identity, and communicate with you</li>
<li><strong>Payment Processing:</strong> To process subscription payments and manage billing</li>
<li><strong>Analytics:</strong> To understand usage patterns, diagnose technical issues, and improve our Service</li>
<li><strong>Communications:</strong> To send service-related notices, updates, and security alerts</li>
<li><strong>Legal Compliance:</strong> To comply with applicable laws, regulations, and legal processes</li>
</ul>

<h3>3. How We Share Your Information</h3>
<p>We do not sell your personal information. We may share your information with:</p>
<ul>
<li><strong>Service Providers:</strong> Third-party vendors who perform services on our behalf, including:
  <ul>
  <li>Supabase Inc. (database hosting and authentication)</li>
  <li>Payment processors (subscription billing)</li>
  <li>Analytics providers (usage analysis)</li>
  </ul>
</li>
<li><strong>Legal Requirements:</strong> When required by law, subpoena, or other legal process, or when we believe disclosure is necessary to protect our rights, your safety, or the safety of others</li>
<li><strong>Business Transfers:</strong> In connection with a merger, acquisition, or sale of all or a portion of our assets</li>
</ul>

<h3>4. California Consumer Privacy Act (CCPA) Rights</h3>
<p>If you are a California resident, you have the following rights under the CCPA:</p>
<ul>
<li><strong>Right to Know:</strong> You may request information about the categories and specific pieces of personal information we have collected about you, the categories of sources, our business purposes for collecting, and the categories of third parties with whom we share personal information.</li>
<li><strong>Right to Delete:</strong> You may request that we delete your personal information, subject to certain exceptions.</li>
<li><strong>Right to Opt-Out of Sale:</strong> We do not sell personal information. If this changes, we will provide a "Do Not Sell My Personal Information" link.</li>
<li><strong>Right to Non-Discrimination:</strong> We will not discriminate against you for exercising your CCPA rights.</li>
</ul>
<p>To exercise these rights, contact us at help@cookieapps.kr. We will respond to verifiable consumer requests within 45 days.</p>

<h3>5. Data Retention</h3>
<ul>
<li>We retain your personal information for as long as your account is active or as needed to provide the Service.</li>
<li>Upon account deletion, we will delete or anonymize your personal information within 30 days, except where retention is required by law.</li>
<li>Certain records may be retained as required by applicable law (e.g., transaction records for tax purposes).</li>
</ul>

<h3>6. Data Security</h3>
<p>We implement commercially reasonable technical and organizational measures to protect your personal information, including:</p>
<ul>
<li>Encryption of data in transit (TLS) and at rest</li>
<li>Access controls and authentication mechanisms</li>
<li>Regular security assessments and monitoring</li>
<li>Employee training on data protection practices</li>
</ul>
<p>However, no method of transmission or storage is 100% secure, and we cannot guarantee absolute security.</p>

<h3>7. Children''s Privacy</h3>
<p>The Service is intended for users aged 18 and older. We do not knowingly collect personal information from children under the age of 13. Since our Service requires users to be adults, COPPA compliance is ensured by design. If we learn that we have collected personal information from a child under 13, we will promptly delete such information.</p>

<h3>8. International Data Transfers</h3>
<p>Your information may be transferred to and processed in countries other than your country of residence, including the Republic of Korea, where our Company is located. We ensure appropriate safeguards are in place to protect your information in compliance with applicable data protection laws.</p>

<h3>9. Your Choices</h3>
<ul>
<li><strong>Account Information:</strong> You may update your account information through the Service settings at any time.</li>
<li><strong>Marketing Communications:</strong> You may opt out of marketing emails by following the unsubscribe instructions in any marketing email or through the Service settings.</li>
<li><strong>Cookies:</strong> You can manage cookie preferences through your browser settings.</li>
<li><strong>Account Deletion:</strong> You may delete your account at any time through the Service settings or by contacting help@cookieapps.kr.</li>
</ul>

<h3>10. Changes to This Privacy Policy</h3>
<p>We may update this Privacy Policy from time to time. We will notify you of material changes by posting the updated policy within the Service and updating the "Effective Date." Your continued use of the Service after the effective date constitutes acceptance of the updated policy.</p>

<h3>11. Contact Us</h3>
<ul>
<li>Company: CookieApps</li>
<li>Data Protection Contact: KIM MU HYUN</li>
<li>Email: help@cookieapps.kr</li>
<li>Address: 2309-dong 1501-ho, 97 Wiryegwangjang-ro, Seongnam-si, Gyeonggi-do, Republic of Korea</li>
<li>Phone: +82-10-5386-6626</li>
</ul>',
    now()
  );

  -- ============================================================
  -- 8. US — DATA_COLLECTION (Consent to Collection and Use of Personal Information)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'US',
    v_data_collection_id,
    '1.0',
    'Initial version',
    'FlipFlip Consent to Data Collection and Use',
    'You must consent to the collection and use of your personal information to use FlipFlip.',
    true,
    true,
    '<h2>Consent to Collection and Use of Personal Information</h2>
<p><strong>Effective Date:</strong> March 16, 2026 | <strong>Version:</strong> 1.0</p>

<p>CookieApps ("Company," "we," "us," or "our") collects and uses your personal information as described below in order to provide the FlipFlip language learning service. Please read this disclosure carefully before providing your consent.</p>

<h3>1. Personal Information We Collect</h3>

<h3>(a) Required Information</h3>
<ul>
<li>Email address</li>
<li>Password (excluded when using social login)</li>
<li>Display name</li>
</ul>

<h3>(b) Information from Social Login</h3>
<ul>
<li>Social account unique identifier</li>
<li>Email address</li>
<li>Profile picture (if provided by the social platform)</li>
</ul>

<h3>(c) Automatically Collected Information</h3>
<ul>
<li>IP address, cookies, and access timestamps</li>
<li>Device information (device type, operating system version, app version)</li>
<li>Service usage records (learning history, progress, session logs)</li>
</ul>

<h3>2. Purpose of Collection and Use</h3>
<ul>
<li><strong>Account Management:</strong> Registration, authentication, account security, and communication</li>
<li><strong>Service Delivery:</strong> Providing learning content, tracking progress, delivering personalized spaced repetition reviews</li>
<li><strong>Service Improvement:</strong> Usage analytics, quality enhancement, new feature development</li>
<li><strong>Payment Processing:</strong> Processing subscription payments and managing refunds</li>
</ul>

<h3>3. Retention Period</h3>
<ul>
<li>Your personal information is retained while your account is active.</li>
<li>Upon account deletion, your data will be deleted within 30 days, except where retention is required by law.</li>
<li>Transaction records may be retained for up to 7 years as required by applicable tax and financial regulations.</li>
</ul>

<h3>4. Your Rights</h3>
<ul>
<li>You have the right to access, correct, and delete your personal information at any time.</li>
<li>You may exercise these rights through the Service settings or by contacting us at help@cookieapps.kr.</li>
<li>California residents have additional rights under the CCPA as described in our Privacy Policy.</li>
</ul>

<h3>5. Right to Refuse and Consequences</h3>
<p>You have the right to refuse consent to the collection and use of your personal information. However, if you do not consent to the collection of required information, you will be unable to create an account or use the Service.</p>

<h3>6. Contact</h3>
<ul>
<li>Data Protection Contact: KIM MU HYUN</li>
<li>Email: help@cookieapps.kr</li>
<li>Phone: +82-10-5386-6626</li>
</ul>',
    now()
  );

  -- ============================================================
  -- 9. US — PAID_SERVICE_TERMS (Paid Service Terms)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'US',
    v_paid_service_terms_id,
    '1.0',
    'Initial version',
    'FlipFlip Paid Service Terms',
    'You must agree to the Paid Service Terms to purchase a subscription.',
    true,
    true,
    '<h2>FlipFlip Paid Service Terms</h2>
<p><strong>Effective Date:</strong> March 16, 2026 | <strong>Version:</strong> 1.0</p>

<p>These Paid Service Terms ("Paid Terms") govern your purchase and use of premium features within the FlipFlip application provided by CookieApps ("Company," "we," "us," or "our"). These Paid Terms supplement and are incorporated into the FlipFlip Terms of Service.</p>

<h3>1. Subscription Plans</h3>
<p>FlipFlip offers the following subscription options:</p>
<ul>
<li><strong>Monthly Subscription:</strong> $0.99 per month (₩990 KRW equivalent)</li>
<li><strong>Annual Subscription:</strong> $9.90 per year (₩9,900 KRW equivalent)</li>
</ul>
<p>All prices include applicable taxes unless otherwise stated. Prices may vary by region and are subject to change.</p>

<h3>2. Free Trial</h3>
<ul>
<li>New users are eligible for a 30-day free trial that provides access to all premium features.</li>
<li>The free trial does not automatically convert to a paid subscription. You must actively subscribe after the trial period ends.</li>
<li>The free trial is limited to one per user. Creating multiple accounts to obtain additional free trials is prohibited.</li>
</ul>

<h3>3. Billing and Payment</h3>
<ul>
<li>Payments are processed through the Apple App Store, Google Play Store, or other payment methods designated by the Company.</li>
<li>Subscriptions automatically renew at the end of each billing period unless cancelled at least 24 hours before the renewal date.</li>
<li>You authorize the applicable payment processor to charge the subscription fee to your designated payment method on each renewal date.</li>
<li>If a payment fails, we may suspend your access to premium features until payment is successfully processed.</li>
</ul>

<h3>4. Cancellation</h3>
<ul>
<li>You may cancel your subscription at any time through:
  <ul>
  <li>The subscription management section in your device''s app store settings</li>
  <li>The Service settings within the app</li>
  <li>Contacting us at help@cookieapps.kr</li>
  </ul>
</li>
<li>Upon cancellation, you will continue to have access to premium features until the end of your current billing period.</li>
<li>Cancellation takes effect at the end of the current billing period; no partial-period refunds are provided for cancellations.</li>
</ul>

<h3>5. Refund Policy</h3>
<ul>
<li><strong>Within 7 days of purchase (no usage):</strong> Full refund available upon request.</li>
<li><strong>Service disruption:</strong> Pro-rated refund for documented periods where the Service was unavailable due to Company fault.</li>
<li><strong>App Store purchases:</strong> Refunds for purchases made through the Apple App Store or Google Play Store are subject to the respective app store''s refund policies.</li>
<li>To request a refund, contact us at help@cookieapps.kr with your account details and reason for the refund request. We will process eligible refunds within 10 business days.</li>
</ul>

<h3>6. Price Changes</h3>
<ul>
<li>We reserve the right to change subscription prices. We will provide at least 30 days'' advance notice of any price increase.</li>
<li>Price changes will apply to the next billing cycle following the effective date of the change.</li>
<li>If you do not agree to a price change, you may cancel your subscription before the new price takes effect.</li>
</ul>

<h3>7. Service Modifications</h3>
<ul>
<li>We may modify, update, or discontinue premium features at any time.</li>
<li>If we discontinue a paid service entirely, we will provide 30 days'' notice and issue a pro-rated refund for the unused portion of your subscription.</li>
</ul>

<h3>8. Dispute Resolution</h3>
<p>Any disputes arising from these Paid Terms shall be resolved in accordance with the dispute resolution provisions in the FlipFlip Terms of Service.</p>

<h3>9. Contact</h3>
<ul>
<li>Email: help@cookieapps.kr</li>
<li>Phone: +82-10-5386-6626</li>
</ul>',
    now()
  );

  -- ============================================================
  -- 10. US — MARKETING (Marketing Communications Consent)
  -- ============================================================
  INSERT INTO public.terms (country_code, terms_type_id, version, revision_summary, summary, non_consent_notice, is_required, is_active, content, published_at)
  VALUES (
    'US',
    v_marketing_id,
    '1.0',
    'Initial version',
    'FlipFlip Marketing Communications Consent',
    'You may still use FlipFlip without consenting to marketing communications. However, you will not receive promotional offers or event notifications.',
    false,
    true,
    '<h2>Marketing Communications Consent</h2>
<p><strong>Effective Date:</strong> March 16, 2026 | <strong>Version:</strong> 1.0</p>

<p>CookieApps ("Company," "we," "us," or "our") would like to send you marketing communications about FlipFlip and related services. Please review the following information before providing your consent.</p>

<h3>1. Information Used for Marketing</h3>
<ul>
<li>Email address</li>
<li>Display name</li>
<li>Service usage data (learning patterns, content preferences)</li>
<li>Device information</li>
</ul>

<h3>2. Types of Marketing Communications</h3>
<ul>
<li>New feature announcements and product updates</li>
<li>Promotional offers, discounts, and special deals</li>
<li>Personalized learning recommendations and study tips</li>
<li>Surveys and feedback requests</li>
<li>Event notifications and contests</li>
</ul>

<h3>3. Communication Channels</h3>
<ul>
<li>Email</li>
<li>Push notifications</li>
<li>In-app messages and banners</li>
</ul>

<h3>4. CAN-SPAM Act Compliance</h3>
<p>All marketing emails we send comply with the CAN-SPAM Act. Each email will:</p>
<ul>
<li>Clearly identify the message as an advertisement or solicitation</li>
<li>Include our valid physical mailing address</li>
<li>Provide a clear and conspicuous opt-out mechanism</li>
<li>Honor opt-out requests within 10 business days</li>
</ul>

<h3>5. Your Choices</h3>
<ul>
<li>Marketing consent is entirely optional. You can use FlipFlip without consenting to marketing communications.</li>
<li>You may withdraw your consent at any time through:
  <ul>
  <li>The notification settings within the FlipFlip app</li>
  <li>The "Unsubscribe" link at the bottom of any marketing email</li>
  <li>Contacting us at help@cookieapps.kr</li>
  </ul>
</li>
<li>After opting out, you will stop receiving marketing communications within 10 business days. You will still receive essential service-related communications (e.g., security alerts, billing notices).</li>
</ul>

<h3>6. Data Protection</h3>
<ul>
<li>Information collected for marketing purposes is handled in accordance with our Privacy Policy.</li>
<li>We do not sell your personal information to third parties for their marketing purposes.</li>
<li>Marketing data is retained until you withdraw consent or delete your account.</li>
</ul>

<h3>7. Contact</h3>
<ul>
<li>Email: help@cookieapps.kr</li>
<li>Phone: +82-10-5386-6626</li>
<li>Address: 2309-dong 1501-ho, 97 Wiryegwangjang-ro, Seongnam-si, Gyeonggi-do, Republic of Korea</li>
</ul>',
    now()
  );

END $$;
