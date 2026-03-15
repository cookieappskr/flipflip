-- =============================================================================
-- FlipFlip - Supabase Database Schema
-- Generated: 2026-03-15
-- =============================================================================

-- =============================================================================
-- 1. Extensions
-- =============================================================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- =============================================================================
-- 2. Functions (shared)
-- =============================================================================

-- Auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Helper: check if current user is an admin
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.admin_users
    WHERE email = auth.jwt()->>'email'
      AND is_active = true
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =============================================================================
-- 3. Tables
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 3.1 admin_users
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.admin_users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT UNIQUE NOT NULL,
  name TEXT,
  profile_image_url TEXT,
  role TEXT DEFAULT 'admin' CHECK (role IN ('superadmin', 'admin', 'editor', 'viewer')),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.2 types (hierarchical code table)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.types (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  parent_id UUID REFERENCES public.types(id) ON DELETE CASCADE,
  type_name TEXT NOT NULL,
  type_code TEXT NOT NULL,
  sort_order INT DEFAULT 0,
  value TEXT,
  description TEXT,
  color TEXT,
  icon TEXT,
  extra_attr_1 TEXT,
  extra_attr_2 TEXT,
  extra_attr_3 TEXT,
  extra_attr_4 TEXT,
  extra_attr_5 TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- UNIQUE constraint handling NULL parent_id with COALESCE
CREATE UNIQUE INDEX uq_types_parent_code
  ON public.types (COALESCE(parent_id, '00000000-0000-0000-0000-000000000000'::uuid), type_code);

-- ---------------------------------------------------------------------------
-- 3.3 levels
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.levels (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  level_number INT UNIQUE NOT NULL CHECK (level_number >= 1 AND level_number <= 100),
  summary VARCHAR(100),
  description TEXT,
  native_level_type_id UUID REFERENCES public.types(id),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.4 skills
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  level_id UUID NOT NULL REFERENCES public.levels(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  summary VARCHAR(200),
  sort_order INT DEFAULT 0,
  tense_type_id UUID REFERENCES public.types(id),
  purpose_type_id UUID REFERENCES public.types(id),
  tone_type_id UUID REFERENCES public.types(id),
  place_type_id UUID REFERENCES public.types(id),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.5 sentences
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.sentences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  skill_id UUID NOT NULL REFERENCES public.skills(id) ON DELETE CASCADE,
  summary VARCHAR(200),
  summary_en VARCHAR(200),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.6 expressions
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.expressions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  sentence_id UUID NOT NULL REFERENCES public.sentences(id) ON DELETE CASCADE,
  language_code TEXT NOT NULL,
  expression_text VARCHAR(200),
  hint VARCHAR(100),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.7 terms
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.terms (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  country_code TEXT NOT NULL,
  terms_type_id UUID NOT NULL REFERENCES public.types(id),
  version TEXT NOT NULL,
  revision_summary TEXT,
  summary VARCHAR(200),
  non_consent_notice TEXT,
  is_required BOOLEAN DEFAULT true,
  is_active BOOLEAN DEFAULT true,
  content TEXT,
  published_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.8 policy_settings
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.policy_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  key TEXT UNIQUE NOT NULL,
  value TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.9 users
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  auth_email TEXT,
  role TEXT DEFAULT 'user',
  deleted_at TIMESTAMPTZ,
  dormant_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.10 user_profiles
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.user_profiles (
  user_id UUID PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  nickname VARCHAR(16),
  email TEXT,
  phone TEXT,
  birth_date DATE,
  profile_image_url TEXT,
  mother_tongue TEXT,
  learning_language TEXT,
  daily_goal_type_id UUID REFERENCES public.types(id),
  referrer_id UUID REFERENCES public.users(id),
  country_code TEXT,
  current_level INT DEFAULT 1,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.11 subscriptions
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.subscriptions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  plan_type TEXT,
  status TEXT DEFAULT 'trial',
  trial_start_at TIMESTAMPTZ,
  trial_end_at TIMESTAMPTZ,
  current_period_start TIMESTAMPTZ,
  current_period_end TIMESTAMPTZ,
  payment_provider TEXT,
  external_subscription_id TEXT,
  auto_renew BOOLEAN DEFAULT true,
  cancelled_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.12 coupons
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.coupons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  coupon_type TEXT,
  benefit_type TEXT,
  benefit_days INT,
  issued_at TIMESTAMPTZ DEFAULT now(),
  expires_at TIMESTAMPTZ,
  used_at TIMESTAMPTZ,
  is_used BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.13 mileage_transactions
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.mileage_transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  amount INT NOT NULL,
  balance_after INT NOT NULL,
  transaction_type TEXT,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.14 user_learning_progress
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.user_learning_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  skill_id UUID REFERENCES public.skills(id) ON DELETE CASCADE,
  achievement_score DECIMAL DEFAULT 0,
  is_cleared BOOLEAN DEFAULT false,
  cleared_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.15 user_sentence_scores
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.user_sentence_scores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  sentence_id UUID REFERENCES public.sentences(id) ON DELETE CASCADE,
  accumulated_score DECIMAL DEFAULT 0,
  mastery_level_type_id UUID REFERENCES public.types(id),
  mastery_score DECIMAL DEFAULT 0,
  next_review_at TIMESTAMPTZ,
  last_checked_at TIMESTAMPTZ,
  check_count INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- =============================================================================
-- 4. Row Level Security (RLS)
-- =============================================================================

-- Enable RLS on ALL tables
ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.types ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.sentences ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.expressions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.terms ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.policy_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mileage_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_learning_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_sentence_scores ENABLE ROW LEVEL SECURITY;

-- ---------------------------------------------------------------------------
-- 4.1 admin_users policies
-- ---------------------------------------------------------------------------
CREATE POLICY "admin_users_service_role_all" ON public.admin_users
  FOR ALL USING (auth.role() = 'service_role');

CREATE POLICY "admin_users_select_own" ON public.admin_users
  FOR SELECT USING (email = auth.jwt()->>'email');

CREATE POLICY "admin_users_insert_admin" ON public.admin_users
  FOR INSERT WITH CHECK (public.is_admin());

CREATE POLICY "admin_users_update_admin" ON public.admin_users
  FOR UPDATE USING (public.is_admin());

-- ---------------------------------------------------------------------------
-- 4.2 Content tables: SELECT for all authenticated, CUD for admins
-- ---------------------------------------------------------------------------

-- types
CREATE POLICY "types_select_authenticated" ON public.types
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "types_insert_admin" ON public.types
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "types_update_admin" ON public.types
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "types_delete_admin" ON public.types
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- levels
CREATE POLICY "levels_select_authenticated" ON public.levels
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "levels_insert_admin" ON public.levels
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "levels_update_admin" ON public.levels
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "levels_delete_admin" ON public.levels
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- skills
CREATE POLICY "skills_select_authenticated" ON public.skills
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "skills_insert_admin" ON public.skills
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "skills_update_admin" ON public.skills
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "skills_delete_admin" ON public.skills
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- sentences
CREATE POLICY "sentences_select_authenticated" ON public.sentences
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "sentences_insert_admin" ON public.sentences
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "sentences_update_admin" ON public.sentences
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "sentences_delete_admin" ON public.sentences
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- expressions
CREATE POLICY "expressions_select_authenticated" ON public.expressions
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "expressions_insert_admin" ON public.expressions
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "expressions_update_admin" ON public.expressions
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "expressions_delete_admin" ON public.expressions
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- terms
CREATE POLICY "terms_select_authenticated" ON public.terms
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "terms_insert_admin" ON public.terms
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "terms_update_admin" ON public.terms
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "terms_delete_admin" ON public.terms
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- policy_settings
CREATE POLICY "policy_settings_select_authenticated" ON public.policy_settings
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

CREATE POLICY "policy_settings_insert_admin" ON public.policy_settings
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "policy_settings_update_admin" ON public.policy_settings
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "policy_settings_delete_admin" ON public.policy_settings
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.3 User-owned tables: SELECT/UPDATE own
-- ---------------------------------------------------------------------------

-- users
CREATE POLICY "users_select_own" ON public.users
  FOR SELECT USING (auth.uid() = id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "users_update_own" ON public.users
  FOR UPDATE USING (auth.uid() = id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "users_insert_service" ON public.users
  FOR INSERT WITH CHECK (auth.uid() = id OR auth.role() = 'service_role');

-- user_profiles
CREATE POLICY "user_profiles_select_own" ON public.user_profiles
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "user_profiles_update_own" ON public.user_profiles
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "user_profiles_insert_own" ON public.user_profiles
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.4 User-owned read-only tables: SELECT own
-- ---------------------------------------------------------------------------

-- subscriptions
CREATE POLICY "subscriptions_select_own" ON public.subscriptions
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "subscriptions_manage_admin" ON public.subscriptions
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- coupons
CREATE POLICY "coupons_select_own" ON public.coupons
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "coupons_manage_admin" ON public.coupons
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- mileage_transactions
CREATE POLICY "mileage_transactions_select_own" ON public.mileage_transactions
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "mileage_transactions_manage_admin" ON public.mileage_transactions
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.5 Learning data: SELECT/INSERT/UPDATE own
-- ---------------------------------------------------------------------------

-- user_learning_progress
CREATE POLICY "user_learning_progress_select_own" ON public.user_learning_progress
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "user_learning_progress_insert_own" ON public.user_learning_progress
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

CREATE POLICY "user_learning_progress_update_own" ON public.user_learning_progress
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

-- user_sentence_scores
CREATE POLICY "user_sentence_scores_select_own" ON public.user_sentence_scores
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

CREATE POLICY "user_sentence_scores_insert_own" ON public.user_sentence_scores
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

CREATE POLICY "user_sentence_scores_update_own" ON public.user_sentence_scores
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

-- =============================================================================
-- 5. Triggers (auto-update updated_at)
-- =============================================================================

CREATE TRIGGER on_admin_users_updated
  BEFORE UPDATE ON public.admin_users
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_types_updated
  BEFORE UPDATE ON public.types
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_levels_updated
  BEFORE UPDATE ON public.levels
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_skills_updated
  BEFORE UPDATE ON public.skills
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_sentences_updated
  BEFORE UPDATE ON public.sentences
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_expressions_updated
  BEFORE UPDATE ON public.expressions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_terms_updated
  BEFORE UPDATE ON public.terms
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_policy_settings_updated
  BEFORE UPDATE ON public.policy_settings
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_users_updated
  BEFORE UPDATE ON public.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_user_profiles_updated
  BEFORE UPDATE ON public.user_profiles
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_subscriptions_updated
  BEFORE UPDATE ON public.subscriptions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_coupons_updated
  BEFORE UPDATE ON public.coupons
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_mileage_transactions_updated
  BEFORE UPDATE ON public.mileage_transactions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_user_learning_progress_updated
  BEFORE UPDATE ON public.user_learning_progress
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

CREATE TRIGGER on_user_sentence_scores_updated
  BEFORE UPDATE ON public.user_sentence_scores
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- =============================================================================
-- 6. Seed Data
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 6.1 admin_users
-- ---------------------------------------------------------------------------
INSERT INTO public.admin_users (email, name, role, is_active)
VALUES ('help@cookieapps.kr', 'Super Admin', 'superadmin', true)
ON CONFLICT (email) DO NOTHING;

-- ---------------------------------------------------------------------------
-- 6.2 levels (1~100)
-- ---------------------------------------------------------------------------
INSERT INTO public.levels (level_number, summary, description)
SELECT g, NULL, NULL
FROM generate_series(1, 100) AS g
ON CONFLICT (level_number) DO NOTHING;

-- ---------------------------------------------------------------------------
-- 6.3 types - root categories (parent_id = NULL)
-- ---------------------------------------------------------------------------
INSERT INTO public.types (parent_id, type_name, type_code, sort_order) VALUES
  (NULL, '체크유형',        'CHECK_TYPE',          1),
  (NULL, '익힘수준',        'MASTERY_LEVEL',       2),
  (NULL, '일학습목표시간',   'DAILY_GOAL_TIME',     3),
  (NULL, '시제유형',        'TENSE_TYPE',          4),
  (NULL, '용도유형',        'PURPOSE_TYPE',        5),
  (NULL, '톤유형',          'TONE_TYPE',           6),
  (NULL, '장소유형',        'PLACE_TYPE',          7),
  (NULL, '원어민수준유형',   'NATIVE_LEVEL_TYPE',   8),
  (NULL, '모국어유형',      'MOTHER_TONGUE_TYPE',  9),
  (NULL, '학습언어유형',    'LEARNING_LANG_TYPE',  10),
  (NULL, '표현언어유형',    'EXPRESSION_LANG_TYPE', 11),
  (NULL, '약관유형',        'TERMS_TYPE',          12)
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- 6.4 types - children (using DO $$ block for parent lookups)
-- ---------------------------------------------------------------------------
DO $$
DECLARE
  v_check_type_id       UUID;
  v_mastery_level_id    UUID;
  v_daily_goal_id       UUID;
  v_tense_type_id       UUID;
  v_purpose_type_id     UUID;
  v_tone_type_id        UUID;
  v_place_type_id       UUID;
  v_native_level_id     UUID;
  v_mother_tongue_id    UUID;
  v_learning_lang_id    UUID;
  v_expression_lang_id  UUID;
  v_terms_type_id       UUID;
BEGIN
  -- Fetch parent IDs
  SELECT id INTO v_check_type_id      FROM public.types WHERE type_code = 'CHECK_TYPE'          AND parent_id IS NULL;
  SELECT id INTO v_mastery_level_id   FROM public.types WHERE type_code = 'MASTERY_LEVEL'       AND parent_id IS NULL;
  SELECT id INTO v_daily_goal_id      FROM public.types WHERE type_code = 'DAILY_GOAL_TIME'     AND parent_id IS NULL;
  SELECT id INTO v_tense_type_id      FROM public.types WHERE type_code = 'TENSE_TYPE'          AND parent_id IS NULL;
  SELECT id INTO v_purpose_type_id    FROM public.types WHERE type_code = 'PURPOSE_TYPE'        AND parent_id IS NULL;
  SELECT id INTO v_tone_type_id       FROM public.types WHERE type_code = 'TONE_TYPE'           AND parent_id IS NULL;
  SELECT id INTO v_place_type_id      FROM public.types WHERE type_code = 'PLACE_TYPE'          AND parent_id IS NULL;
  SELECT id INTO v_native_level_id    FROM public.types WHERE type_code = 'NATIVE_LEVEL_TYPE'   AND parent_id IS NULL;
  SELECT id INTO v_mother_tongue_id   FROM public.types WHERE type_code = 'MOTHER_TONGUE_TYPE'  AND parent_id IS NULL;
  SELECT id INTO v_learning_lang_id   FROM public.types WHERE type_code = 'LEARNING_LANG_TYPE'  AND parent_id IS NULL;
  SELECT id INTO v_expression_lang_id FROM public.types WHERE type_code = 'EXPRESSION_LANG_TYPE' AND parent_id IS NULL;
  SELECT id INTO v_terms_type_id      FROM public.types WHERE type_code = 'TERMS_TYPE'          AND parent_id IS NULL;

  -- CHECK_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value) VALUES
    (v_check_type_id, '완벽히맞춤', 'PERFECT',  1, '2'),
    (v_check_type_id, '대부분맞춤', 'MOSTLY',   2, '0.5'),
    (v_check_type_id, '못맞춤',     'MISSED',   3, '-1')
  ON CONFLICT DO NOTHING;

  -- MASTERY_LEVEL children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value, extra_attr_1) VALUES
    (v_mastery_level_id, '첫암기',   'FIRST_MEMORIZE',   1, '0', '30'),
    (v_mastery_level_id, '미비',     'WEAK',             2, '1', '240'),
    (v_mastery_level_id, '익숙',     'FAMILIAR',         3, '3', '1440'),
    (v_mastery_level_id, '매우익숙', 'VERY_FAMILIAR',    4, '5', '10080'),
    (v_mastery_level_id, '완벽',     'PERFECT_MASTERY',  5, '8', '43200')
  ON CONFLICT DO NOTHING;

  -- DAILY_GOAL_TIME children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value, extra_attr_1) VALUES
    (v_daily_goal_id, '5분',       'MIN_5',       1, '5',   '5'),
    (v_daily_goal_id, '15분',      'MIN_15',      2, '15',  '15'),
    (v_daily_goal_id, '30분',      'MIN_30',      3, '30',  '30'),
    (v_daily_goal_id, '1시간',     'HOUR_1',      4, '60',  '60'),
    (v_daily_goal_id, '2시간',     'HOUR_2',      5, '120', '120'),
    (v_daily_goal_id, '2시간이상', 'HOUR_2_PLUS', 6, '150', '150')
  ON CONFLICT DO NOTHING;

  -- TENSE_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, color, icon) VALUES
    (v_tense_type_id, '현재',     'PRESENT',       1, '#4CAF50', 'clock'),
    (v_tense_type_id, '과거',     'PAST',          2, '#FF9800', 'history'),
    (v_tense_type_id, '과거완료', 'PAST_PERFECT',  3, '#F44336', 'check-circle'),
    (v_tense_type_id, '미래',     'FUTURE',        4, '#2196F3', 'trending-up')
  ON CONFLICT DO NOTHING;

  -- PURPOSE_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, color, icon) VALUES
    (v_purpose_type_id, '질문', 'QUESTION',     1, '#9C27B0', 'help-circle'),
    (v_purpose_type_id, '요구', 'REQUEST',      2, '#E91E63', 'alert-circle'),
    (v_purpose_type_id, '설득', 'PERSUASION',   3, '#FF5722', 'message-circle'),
    (v_purpose_type_id, '설명', 'EXPLANATION',  4, '#00BCD4', 'info')
  ON CONFLICT DO NOTHING;

  -- TONE_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, color, icon) VALUES
    (v_tone_type_id, '비공식', 'INFORMAL', 1, '#8BC34A', 'smile'),
    (v_tone_type_id, '공식',   'FORMAL',   2, '#607D8B', 'briefcase')
  ON CONFLICT DO NOTHING;

  -- PLACE_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, color, icon) VALUES
    (v_place_type_id, '회사', 'OFFICE', 1, '#795548', 'building'),
    (v_place_type_id, '집',   'HOME',   2, '#FF9800', 'home'),
    (v_place_type_id, '여행', 'TRAVEL', 3, '#03A9F4', 'map')
  ON CONFLICT DO NOTHING;

  -- NATIVE_LEVEL_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order) VALUES
    (v_native_level_id, '초급',   'BEGINNER',      1),
    (v_native_level_id, '중급',   'INTERMEDIATE',  2),
    (v_native_level_id, '고급',   'ADVANCED',      3),
    (v_native_level_id, '원어민', 'NATIVE',        4)
  ON CONFLICT DO NOTHING;

  -- MOTHER_TONGUE_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value) VALUES
    (v_mother_tongue_id, '한국어', 'KO', 1, 'ko'),
    (v_mother_tongue_id, '영어',   'EN', 2, 'en')
  ON CONFLICT DO NOTHING;

  -- LEARNING_LANG_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value) VALUES
    (v_learning_lang_id, '영어',     'EN', 1, 'en'),
    (v_learning_lang_id, '스페인어', 'ES', 2, 'es'),
    (v_learning_lang_id, '중국어',   'ZH', 3, 'zh'),
    (v_learning_lang_id, '일어',     'JA', 4, 'ja'),
    (v_learning_lang_id, '한국어',   'KO', 5, 'ko')
  ON CONFLICT DO NOTHING;

  -- EXPRESSION_LANG_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order, value) VALUES
    (v_expression_lang_id, '영어',     'EN', 1, 'en'),
    (v_expression_lang_id, '스페인어', 'ES', 2, 'es'),
    (v_expression_lang_id, '중국어',   'ZH', 3, 'zh'),
    (v_expression_lang_id, '일어',     'JA', 4, 'ja')
  ON CONFLICT DO NOTHING;

  -- TERMS_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, sort_order) VALUES
    (v_terms_type_id, '서비스이용약관',       'SERVICE_TERMS',      1),
    (v_terms_type_id, '개인정보처리방침',     'PRIVACY_POLICY',     2),
    (v_terms_type_id, '개인정보수집및이용동의', 'DATA_COLLECTION',    3),
    (v_terms_type_id, '유료서비스이용약관',   'PAID_SERVICE_TERMS', 4),
    (v_terms_type_id, '마케팅활용동의',       'MARKETING',          5)
  ON CONFLICT DO NOTHING;

END $$;

-- ---------------------------------------------------------------------------
-- 6.5 policy_settings
-- ---------------------------------------------------------------------------
INSERT INTO public.policy_settings (key, value, description) VALUES
  ('skill_up_ratio',           '80',    'Achievement score threshold (%) to clear a skill'),
  ('referral_mileage',         '0',     'Mileage awarded for a referral'),
  ('daily_complete_mileage',   '10',    'Mileage awarded for daily goal completion'),
  ('streak_3_mileage',         '30',    'Bonus mileage for 3-day streak'),
  ('streak_10_mileage',        '200',   'Bonus mileage for 10-day streak'),
  ('streak_30_mileage',        '500',   'Bonus mileage for 30-day streak'),
  ('mileage_exchange_points',  '10000', 'Mileage required for exchange'),
  ('mileage_exchange_days',    '7',     'Subscription days granted per mileage exchange')
ON CONFLICT (key) DO NOTHING;

-- =============================================================================
-- End of schema
-- =============================================================================
