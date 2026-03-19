INSERT INTO public.policy_settings (id, key, value, description)
VALUES (gen_random_uuid(), 'welcome_points', '1000', '회원가입 축하 포인트');

INSERT INTO public.policy_settings (id, key, value, description)
VALUES (gen_random_uuid(), 'trial_days', '3', '무료 체험 기간 (일)');
