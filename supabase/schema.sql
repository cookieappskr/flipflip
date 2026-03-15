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
  display_order INT DEFAULT 0,
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
CREATE UNIQUE INDEX IF NOT EXISTS uq_types_parent_code
  ON public.types (COALESCE(parent_id, '00000000-0000-0000-0000-000000000000'::uuid), type_code);

-- ---------------------------------------------------------------------------
-- 3.3 levels
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.levels (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  level_number INT UNIQUE NOT NULL CHECK (level_number >= 1 AND level_number <= 100),
  level_summary VARCHAR(100),
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
  skill_name TEXT NOT NULL,
  skill_summary VARCHAR(200),
  display_order INT DEFAULT 0,
  tense_type_code TEXT,
  pattern_type_code TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ---------------------------------------------------------------------------
-- 3.5 sentences
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.sentences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  skill_id UUID NOT NULL REFERENCES public.skills(id) ON DELETE CASCADE,
  meaning VARCHAR(200),
  sentence_type VARCHAR(10) DEFAULT '기본',
  base_sentence_id UUID REFERENCES public.sentences(id) ON DELETE SET NULL,
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
  hint VARCHAR(300),
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
DROP POLICY IF EXISTS "admin_users_service_role_all" ON public.admin_users;
CREATE POLICY "admin_users_service_role_all" ON public.admin_users
  FOR ALL USING (auth.role() = 'service_role');

DROP POLICY IF EXISTS "admin_users_select_own" ON public.admin_users;
CREATE POLICY "admin_users_select_own" ON public.admin_users
  FOR SELECT USING (email = auth.jwt()->>'email');

DROP POLICY IF EXISTS "admin_users_insert_admin" ON public.admin_users;
CREATE POLICY "admin_users_insert_admin" ON public.admin_users
  FOR INSERT WITH CHECK (public.is_admin());

DROP POLICY IF EXISTS "admin_users_update_admin" ON public.admin_users;
CREATE POLICY "admin_users_update_admin" ON public.admin_users
  FOR UPDATE USING (public.is_admin());

-- ---------------------------------------------------------------------------
-- 4.2 Content tables: SELECT for all authenticated, CUD for admins
-- ---------------------------------------------------------------------------

-- types
DROP POLICY IF EXISTS "types_select_authenticated" ON public.types;
CREATE POLICY "types_select_authenticated" ON public.types
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "types_insert_admin" ON public.types;
CREATE POLICY "types_insert_admin" ON public.types
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "types_update_admin" ON public.types;
CREATE POLICY "types_update_admin" ON public.types
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "types_delete_admin" ON public.types;
CREATE POLICY "types_delete_admin" ON public.types
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- levels
DROP POLICY IF EXISTS "levels_select_authenticated" ON public.levels;
CREATE POLICY "levels_select_authenticated" ON public.levels
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "levels_insert_admin" ON public.levels;
CREATE POLICY "levels_insert_admin" ON public.levels
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "levels_update_admin" ON public.levels;
CREATE POLICY "levels_update_admin" ON public.levels
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "levels_delete_admin" ON public.levels;
CREATE POLICY "levels_delete_admin" ON public.levels
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- skills
DROP POLICY IF EXISTS "skills_select_authenticated" ON public.skills;
CREATE POLICY "skills_select_authenticated" ON public.skills
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "skills_insert_admin" ON public.skills;
CREATE POLICY "skills_insert_admin" ON public.skills
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "skills_update_admin" ON public.skills;
CREATE POLICY "skills_update_admin" ON public.skills
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "skills_delete_admin" ON public.skills;
CREATE POLICY "skills_delete_admin" ON public.skills
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- sentences
DROP POLICY IF EXISTS "sentences_select_authenticated" ON public.sentences;
CREATE POLICY "sentences_select_authenticated" ON public.sentences
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "sentences_insert_admin" ON public.sentences;
CREATE POLICY "sentences_insert_admin" ON public.sentences
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "sentences_update_admin" ON public.sentences;
CREATE POLICY "sentences_update_admin" ON public.sentences
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "sentences_delete_admin" ON public.sentences;
CREATE POLICY "sentences_delete_admin" ON public.sentences
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- expressions
DROP POLICY IF EXISTS "expressions_select_authenticated" ON public.expressions;
CREATE POLICY "expressions_select_authenticated" ON public.expressions
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "expressions_insert_admin" ON public.expressions;
CREATE POLICY "expressions_insert_admin" ON public.expressions
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "expressions_update_admin" ON public.expressions;
CREATE POLICY "expressions_update_admin" ON public.expressions
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "expressions_delete_admin" ON public.expressions;
CREATE POLICY "expressions_delete_admin" ON public.expressions
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- terms
DROP POLICY IF EXISTS "terms_select_authenticated" ON public.terms;
CREATE POLICY "terms_select_authenticated" ON public.terms
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "terms_insert_admin" ON public.terms;
CREATE POLICY "terms_insert_admin" ON public.terms
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "terms_update_admin" ON public.terms;
CREATE POLICY "terms_update_admin" ON public.terms
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "terms_delete_admin" ON public.terms;
CREATE POLICY "terms_delete_admin" ON public.terms
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- policy_settings
DROP POLICY IF EXISTS "policy_settings_select_authenticated" ON public.policy_settings;
CREATE POLICY "policy_settings_select_authenticated" ON public.policy_settings
  FOR SELECT USING (auth.role() = 'authenticated' OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "policy_settings_insert_admin" ON public.policy_settings;
CREATE POLICY "policy_settings_insert_admin" ON public.policy_settings
  FOR INSERT WITH CHECK (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "policy_settings_update_admin" ON public.policy_settings;
CREATE POLICY "policy_settings_update_admin" ON public.policy_settings
  FOR UPDATE USING (public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "policy_settings_delete_admin" ON public.policy_settings;
CREATE POLICY "policy_settings_delete_admin" ON public.policy_settings
  FOR DELETE USING (public.is_admin() OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.3 User-owned tables: SELECT/UPDATE own
-- ---------------------------------------------------------------------------

-- users
DROP POLICY IF EXISTS "users_select_own" ON public.users;
CREATE POLICY "users_select_own" ON public.users
  FOR SELECT USING (auth.uid() = id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "users_update_own" ON public.users;
CREATE POLICY "users_update_own" ON public.users
  FOR UPDATE USING (auth.uid() = id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "users_insert_service" ON public.users;
CREATE POLICY "users_insert_service" ON public.users
  FOR INSERT WITH CHECK (auth.uid() = id OR auth.role() = 'service_role');

-- user_profiles
DROP POLICY IF EXISTS "user_profiles_select_own" ON public.user_profiles;
CREATE POLICY "user_profiles_select_own" ON public.user_profiles
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_profiles_update_own" ON public.user_profiles;
CREATE POLICY "user_profiles_update_own" ON public.user_profiles
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_profiles_insert_own" ON public.user_profiles;
CREATE POLICY "user_profiles_insert_own" ON public.user_profiles
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.4 User-owned read-only tables: SELECT own
-- ---------------------------------------------------------------------------

-- subscriptions
DROP POLICY IF EXISTS "subscriptions_select_own" ON public.subscriptions;
CREATE POLICY "subscriptions_select_own" ON public.subscriptions
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "subscriptions_manage_admin" ON public.subscriptions;
CREATE POLICY "subscriptions_manage_admin" ON public.subscriptions
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- coupons
DROP POLICY IF EXISTS "coupons_select_own" ON public.coupons;
CREATE POLICY "coupons_select_own" ON public.coupons
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "coupons_manage_admin" ON public.coupons;
CREATE POLICY "coupons_manage_admin" ON public.coupons
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- mileage_transactions
DROP POLICY IF EXISTS "mileage_transactions_select_own" ON public.mileage_transactions;
CREATE POLICY "mileage_transactions_select_own" ON public.mileage_transactions
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "mileage_transactions_manage_admin" ON public.mileage_transactions;
CREATE POLICY "mileage_transactions_manage_admin" ON public.mileage_transactions
  FOR ALL USING (public.is_admin() OR auth.role() = 'service_role');

-- ---------------------------------------------------------------------------
-- 4.5 Learning data: SELECT/INSERT/UPDATE own
-- ---------------------------------------------------------------------------

-- user_learning_progress
DROP POLICY IF EXISTS "user_learning_progress_select_own" ON public.user_learning_progress;
CREATE POLICY "user_learning_progress_select_own" ON public.user_learning_progress
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_learning_progress_insert_own" ON public.user_learning_progress;
CREATE POLICY "user_learning_progress_insert_own" ON public.user_learning_progress
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_learning_progress_update_own" ON public.user_learning_progress;
CREATE POLICY "user_learning_progress_update_own" ON public.user_learning_progress
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

-- user_sentence_scores
DROP POLICY IF EXISTS "user_sentence_scores_select_own" ON public.user_sentence_scores;
CREATE POLICY "user_sentence_scores_select_own" ON public.user_sentence_scores
  FOR SELECT USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_sentence_scores_insert_own" ON public.user_sentence_scores;
CREATE POLICY "user_sentence_scores_insert_own" ON public.user_sentence_scores
  FOR INSERT WITH CHECK (auth.uid() = user_id OR auth.role() = 'service_role');

DROP POLICY IF EXISTS "user_sentence_scores_update_own" ON public.user_sentence_scores;
CREATE POLICY "user_sentence_scores_update_own" ON public.user_sentence_scores
  FOR UPDATE USING (auth.uid() = user_id OR public.is_admin() OR auth.role() = 'service_role');

-- =============================================================================
-- 5. Triggers (auto-update updated_at)
-- =============================================================================

DROP TRIGGER IF EXISTS on_admin_users_updated ON public.admin_users;
CREATE TRIGGER on_admin_users_updated BEFORE UPDATE ON public.admin_users
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_types_updated ON public.types;
CREATE TRIGGER on_types_updated BEFORE UPDATE ON public.types
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_levels_updated ON public.levels;
CREATE TRIGGER on_levels_updated BEFORE UPDATE ON public.levels
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_skills_updated ON public.skills;
CREATE TRIGGER on_skills_updated BEFORE UPDATE ON public.skills
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_sentences_updated ON public.sentences;
CREATE TRIGGER on_sentences_updated BEFORE UPDATE ON public.sentences
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_expressions_updated ON public.expressions;
CREATE TRIGGER on_expressions_updated BEFORE UPDATE ON public.expressions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_terms_updated ON public.terms;
CREATE TRIGGER on_terms_updated BEFORE UPDATE ON public.terms
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_policy_settings_updated ON public.policy_settings;
CREATE TRIGGER on_policy_settings_updated BEFORE UPDATE ON public.policy_settings
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_users_updated ON public.users;
CREATE TRIGGER on_users_updated BEFORE UPDATE ON public.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_user_profiles_updated ON public.user_profiles;
CREATE TRIGGER on_user_profiles_updated BEFORE UPDATE ON public.user_profiles
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_subscriptions_updated ON public.subscriptions;
CREATE TRIGGER on_subscriptions_updated BEFORE UPDATE ON public.subscriptions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_coupons_updated ON public.coupons;
CREATE TRIGGER on_coupons_updated BEFORE UPDATE ON public.coupons
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_mileage_transactions_updated ON public.mileage_transactions;
CREATE TRIGGER on_mileage_transactions_updated BEFORE UPDATE ON public.mileage_transactions
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_user_learning_progress_updated ON public.user_learning_progress;
CREATE TRIGGER on_user_learning_progress_updated BEFORE UPDATE ON public.user_learning_progress
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

DROP TRIGGER IF EXISTS on_user_sentence_scores_updated ON public.user_sentence_scores;
CREATE TRIGGER on_user_sentence_scores_updated BEFORE UPDATE ON public.user_sentence_scores
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- =============================================================================
-- 5.5 Schema Migration (for existing databases)
-- =============================================================================
-- Rename columns if they still use old names (safe: does nothing if already renamed)
DO $$
BEGIN
  -- levels: summary → level_summary
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='levels' AND column_name='summary') THEN
    ALTER TABLE public.levels RENAME COLUMN summary TO level_summary;
  END IF;

  -- skills: name → skill_name
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='name') THEN
    ALTER TABLE public.skills RENAME COLUMN name TO skill_name;
  END IF;

  -- skills: summary → skill_summary
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='summary') THEN
    ALTER TABLE public.skills RENAME COLUMN summary TO skill_summary;
  END IF;

  -- skills: sort_order → display_order
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='sort_order') THEN
    ALTER TABLE public.skills RENAME COLUMN sort_order TO display_order;
  END IF;

  -- skills: add tense_type_code if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='tense_type_code') THEN
    ALTER TABLE public.skills ADD COLUMN tense_type_code TEXT;
  END IF;

  -- skills: add pattern_type_code if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='pattern_type_code') THEN
    ALTER TABLE public.skills ADD COLUMN pattern_type_code TEXT;
  END IF;

  -- skills: drop old UUID FK columns if they exist
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='tense_type_id') THEN
    ALTER TABLE public.skills DROP COLUMN tense_type_id;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='purpose_type_id') THEN
    ALTER TABLE public.skills DROP COLUMN purpose_type_id;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='tone_type_id') THEN
    ALTER TABLE public.skills DROP COLUMN tone_type_id;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='skills' AND column_name='place_type_id') THEN
    ALTER TABLE public.skills DROP COLUMN place_type_id;
  END IF;

  -- sentences: summary → meaning
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='sentences' AND column_name='summary') THEN
    ALTER TABLE public.sentences RENAME COLUMN summary TO meaning;
  END IF;

  -- sentences: drop summary_en if exists
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='sentences' AND column_name='summary_en') THEN
    ALTER TABLE public.sentences DROP COLUMN summary_en;
  END IF;

  -- sentences: add sentence_type if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='sentences' AND column_name='sentence_type') THEN
    ALTER TABLE public.sentences ADD COLUMN sentence_type VARCHAR(10) DEFAULT '기본';
  END IF;

  -- sentences: add base_sentence_id if missing
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='sentences' AND column_name='base_sentence_id') THEN
    ALTER TABLE public.sentences ADD COLUMN base_sentence_id UUID REFERENCES public.sentences(id) ON DELETE SET NULL;
  END IF;

  -- expressions: expand hint from VARCHAR(100) to VARCHAR(300)
  ALTER TABLE public.expressions ALTER COLUMN hint TYPE VARCHAR(300);

  -- types: sort_order → display_order
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='public' AND table_name='types' AND column_name='sort_order') THEN
    ALTER TABLE public.types RENAME COLUMN sort_order TO display_order;
  END IF;
END $$;

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
-- 6.2 levels (1-100) with summary, description, native_level_type
-- ---------------------------------------------------------------------------
DO $$
DECLARE
  v_beginner_id UUID;
  v_intermediate_id UUID;
  v_advanced_id UUID;
  v_native_id UUID;
BEGIN
  SELECT id INTO v_beginner_id FROM public.types WHERE type_code = 'BEGINNER';
  SELECT id INTO v_intermediate_id FROM public.types WHERE type_code = 'INTERMEDIATE';
  SELECT id INTO v_advanced_id FROM public.types WHERE type_code = 'ADVANCED';
  SELECT id INTO v_native_id FROM public.types WHERE type_code = 'NATIVE';

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (1, '기본 인사, 인칭대명사, 지시어, 감정 단어 학습', '안녕하세요, 감사합니다 등 기초 인사말과 나, 너 등 인칭대명사, 이것/저것 등 지시어, 좋다/슬프다 등 감정 형용사를 단어 수준에서 학습합니다. 이 단어들은 모든 문장의 가장 기본적인 구성요소로, 이후 100개 레벨의 토대가 됩니다. 다음 레벨에서는 숫자와 가족 호칭으로 어휘를 확장합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (2, '기초 숫자, 가족 호칭, 신체 부위, 기본 색상 학습', '1부터 10까지의 숫자, 엄마/아빠 등 가족 호칭, 머리/손/발 등 신체 부위, 빨강/파랑 등 기본 색상을 학습합니다. 수량 표현, 가족 소개, 외모 묘사, 사물 설명에 필수적인 기초 어휘를 쌓는 단계입니다. 다음 레벨에서는 일상 사물과 음식 관련 어휘로 확장됩니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (3, '집 관련 사물, 기초 음식/음료, 동물, 장소 어휘 학습', '집/문/탁자 등 가정용품, 물/밥/빵 등 음식, 개/고양이 등 동물, 학교/병원 등 장소 단어를 학습합니다. 일상생활에서 매일 접하는 사물과 장소의 이름을 알면 기본적인 의사소통의 범위가 넓어집니다. 다음 레벨에서는 이 명사들과 함께 사용할 동사와 형용사를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (4, '기초 동작 동사, 상태 동사, 크기/양 형용사, 감각 형용사 학습', '가다/먹다/보다 등 동작 동사, 있다/좋아하다 등 상태 동사, 크다/작다 등 크기 형용사, 뜨겁다/차갑다 등 감각 형용사를 학습합니다. 동사와 형용사는 문장을 만드는 핵심 요소로, 이전에 배운 명사들과 결합하여 의미를 표현할 수 있게 됩니다. 다음 레벨에서는 시간과 날씨 관련 어휘를 추가합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (5, '요일, 기초 시간 표현, 날씨 표현, 계절과 월 학습', '월요일~일요일 요일, 아침/오후/내일 등 시간 표현, 맑다/비가 오다 등 날씨 표현, 봄~겨울 4계절과 1~12월을 학습합니다. 시간과 날씨는 일상 대화에서 가장 자주 등장하는 주제로, 약속을 잡거나 일정을 이야기할 때 반드시 필요합니다. 다음 레벨에서는 의류와 일상용품 어휘를 확장합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (6, '기초 의류, 일상 물건, 교통수단, 숫자 확장(11-100) 학습', '셔츠/바지 등 의류, 전화기/책 등 일상 물건, 버스/자전거 등 교통수단, 11~100까지의 숫자를 학습합니다. 일상생활에서 자주 사용하는 물건과 이동수단의 이름을 익히고, 가격이나 수량을 표현할 수 있는 숫자 범위를 넓힙니다. 다음 레벨에서는 음식과 맛에 관한 어휘를 심화합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (7, '과일/채소, 음료/간식, 식사 관련 단어, 맛 표현 학습', '사과/당근 등 과일과 채소, 커피/케이크 등 음료와 간식, 점심/주문 등 식사 단어, 맛있다/맵다 등 맛 표현을 학습합니다. 음식은 모든 문화에서 핵심적인 대화 주제이며, 식당 방문이나 요리 이야기에 필수적인 어휘입니다. 다음 레벨에서는 직업과 취미 관련 단어를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (8, '기초 직업, 학교/사무실 관련 단어, 기초 취미 단어 학습', '선생님/의사 등 직업, 수업/숙제 등 학교 단어, 사무실/회의 등 직장 단어, 음악/운동 등 취미 단어를 학습합니다. 자신의 직업을 소개하고 학교나 직장 생활을 이야기하며 취미를 말할 수 있는 기초 어휘를 다집니다. 다음 레벨에서는 위치와 방향을 나타내는 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (9, '위치 표현, 방향 표현, 거리/크기 표현, 순서 표현 학습', '안에/위에 등 위치 표현, 왼쪽/오른쪽 등 방향 표현, 가깝다/멀다 등 거리 표현, 첫 번째/마지막 등 순서 표현을 학습합니다. 공간과 순서를 나타내는 단어는 길 안내, 물건 위치 설명, 절차 설명 등 다양한 상황에서 활용됩니다. 다음 레벨에서는 기초 표현을 종합적으로 정리합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (10, '기초 의문사, 접속사/부사, 긍정/부정, 양/빈도 표현 종합 학습', '무엇/누구/어디 등 의문사, 그리고/하지만 등 접속사, 네/아니요 등 긍정/부정 표현, 항상/가끔 등 빈도 부사를 학습합니다. 이 기능어들은 문장의 의미를 연결하고 강조하며 질문을 만드는 핵심 도구로, 단어 단계의 총정리 역할을 합니다. 다음 레벨부터는 완전한 문장 구성을 시작합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (11, 'be동사/일반동사 현재 긍정문, 소유 표현, 존재 표현 학습', '"나는 학생이다", "나는 아침을 먹는다" 등 현재 시제 긍정문과 소유(have) 및 존재(there is/are) 표현을 학습합니다. 처음으로 주어와 서술어를 갖춘 완전한 문장을 만드는 단계로, 자신의 상태와 일상을 문장으로 표현할 수 있게 됩니다. 다음 레벨에서는 부정문과 금지 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (12, '현재 부정문(be동사/일반동사), 부정 표현 활용, 금지 표현 학습', '"좋아하지 않는다", "피곤하지 않다" 등 현재 시제 부정문과 "만지지 마세요" 등 금지 표현을 학습합니다. 부정문은 자신의 의사를 정확히 전달하는 데 필수적이며, 금지 표현은 공공장소에서 자주 접하는 실용적 표현입니다. 다음 레벨에서는 의문문을 통해 질문하는 방법을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (13, 'be동사/일반동사 의문문, what/who, where/when 의문문 학습', '"행복합니까?", "이것은 무엇입니까?", "역은 어디입니까?" 등 다양한 유형의 현재 시제 의문문을 학습합니다. 질문을 할 수 있어야 정보를 얻고 대화를 이어갈 수 있으므로, 의문문은 실용적 의사소통의 핵심입니다. 다음 레벨에서는 자기소개와 일상 인사 대화를 연습합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (14, '자기소개, 안부 인사, 감사/사과 표현, 작별 인사 학습', '"제 이름은 ~입니다", "어떻게 지내세요?", "감사합니다", "내일 봐요" 등 기초 일상 대화 표현을 학습합니다. 만남에서 헤어짐까지의 기본 인사 대화를 완성하여 실제 의사소통 상황에 대비합니다. 다음 레벨에서는 수량과 가격 관련 실용 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (15, '수량 표현, 가격 묻기/답하기, 비교 기초(더/덜), 충분/부족 표현 학습', '"커피 두 잔 주세요", "이것은 얼마입니까?", "물 더 주세요", "충분합니다" 등 수량과 가격 관련 표현을 학습합니다. 쇼핑이나 식당에서 즉시 활용할 수 있는 실용적인 문장들로, 숫자 어휘를 실제 상황에 적용하는 연습입니다. 다음 레벨에서는 시간 표현을 문장에 활용하는 방법을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (16, '시각 말하기, 일과 표현, 빈도 부사 활용문, 기간 표현 학습', '"3시입니다", "7시에 일어납니다", "항상 아침을 먹습니다", "두 시간 동안" 등 시간을 문장에 결합하는 표현을 학습합니다. 시간 표현을 자유롭게 사용하면 자신의 일과와 습관을 상세히 설명할 수 있습니다. 다음 레벨에서는 장소와 이동에 관한 대화 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (17, '장소 묻기/안내, 이동 수단, 소요시간, 위치 설명 문장 학습', '"화장실은 어디입니까?", "버스로 학교에 갑니다", "30분 걸립니다", "은행은 우체국 옆에 있습니다" 등 장소와 이동 관련 표현을 학습합니다. 새로운 환경에서 길을 묻고 교통수단을 이용하는 것은 가장 기본적인 생존 회화입니다. 다음 레벨에서는 취미와 선호를 표현하는 방법을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (18, '좋아하는 것/싫어하는 것 표현, 취미 말하기, 관심사 표현 학습', '"독서를 좋아합니다", "기다리는 것을 싫어합니다", "취미는 그림 그리기입니다", "과학에 관심이 있습니다" 등 선호와 취미 표현을 학습합니다. 자신의 취향과 관심사를 표현하는 것은 친밀한 관계를 형성하는 대화의 출발점입니다. 다음 레벨에서는 날씨를 주제로 한 대화를 연습합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (19, '날씨 묘사, 날씨 관련 대화, 계절 활동, 기온 표현 학습', '"오늘 매우 덥습니다", "우산 있으세요?", "여름에 수영을 좋아합니다", "30도입니다" 등 날씨 관련 대화 표현을 학습합니다. 날씨는 전 세계 어디서나 통하는 대화 주제이며, 계절별 활동과 연결하면 표현의 폭이 넓어집니다. 다음 레벨에서는 쇼핑 상황의 대화를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (20, '물건 찾기, 사이즈/색상 선택, 결제, 교환/환불 표현 학습', '"셔츠를 찾고 있습니다", "사이즈가 어떻게 되세요?", "카드로 결제하겠습니다", "교환할 수 있나요?" 등 쇼핑 전 과정의 표현을 학습합니다. 쇼핑은 해외여행이나 일상에서 반드시 필요한 실용 회화로, 물건 탐색부터 결제까지 완전한 대화를 구성합니다. 다음 레벨에서는 과거 시제를 배우기 시작합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (21, 'be동사/규칙/불규칙 동사 과거형, 과거 시간 표현 학습', '"어제 행복했습니다", "영어를 공부했습니다", "가게에 갔습니다", "지난주에" 등 과거 시제 긍정문을 학습합니다. 과거 시제를 통해 자신의 경험과 지난 사건을 이야기할 수 있게 되어 표현의 시간 범위가 크게 확장됩니다. 다음 레벨에서는 과거 부정문과 의문문을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (22, '과거 부정문, 과거 의문문, 과거 경험 대화, 과거 사건 묘사 학습', '"가지 않았습니다", "점심 먹었습니까?", "주말은 어땠어요?", "전화를 잃어버렸습니다" 등 과거 시제의 부정/의문/묘사 표현을 학습합니다. 과거에 대해 질문하고 답하며 사건을 설명할 수 있어야 풍부한 대화가 가능합니다. 다음 레벨에서는 명령문과 청유문을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (23, '긍정/부정 명령문, 청유/제안 표현, 정중한 요청 학습', '"앉으세요", "뛰지 마세요", "같이 갑시다", "도와주실 수 있나요?" 등 상대방에게 행동을 지시하거나 제안하는 표현을 학습합니다. 명령과 요청은 협력과 소통의 기본 도구로, 공손함의 정도에 따른 표현 차이도 익힙니다. 다음 레벨에서는 소유와 귀속 관련 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (24, '소유격/소유대명사, ~의 것 표현, 소유 질문, 귀속 표현 학습', '"이것은 제 것입니다", "누구의 것입니까?", "팀의 일원입니다" 등 소유와 소속을 나타내는 표현을 학습합니다. 물건의 주인을 확인하고 소속을 밝히는 것은 일상 대화와 공적 상황 모두에서 중요합니다. 다음 레벨에서는 비교급 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (25, '형용사/부사 비교급, 동등 비교, 비교 의문문 학습', '"이것이 저것보다 큽니다", "그녀는 어머니만큼 키가 큽니다", "어느 것이 더 좋습니까?" 등 두 대상을 비교하는 표현을 학습합니다. 비교 표현은 선택과 판단을 위한 의사소통의 핵심 도구입니다. 다음 레벨에서는 최상급 표현으로 비교를 심화합니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (26, '형용사/부사 최상급, 최상급 활용, 선호와 최상급 결합 학습', '"이것이 가장 큰 방입니다", "가장 빨리 뜁니다", "여름을 가장 좋아합니다" 등 셋 이상의 대상 중 최고를 나타내는 최상급 표현을 학습합니다. 최상급은 추천이나 평가를 할 때 자주 사용되며, 선호 표현과 결합하면 자연스러운 대화가 됩니다. 다음 레벨에서는 접속사를 활용한 문장 연결을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (27, 'and/but/or, because/so, when/while, before/after 접속사 학습', '"피곤하지만 행복합니다", "교통 때문에 늦었습니다", "도착하면 전화하겠습니다", "점심 전에 운동합니다" 등 접속사로 문장을 연결하는 방법을 학습합니다. 접속사는 단순한 문장들을 논리적으로 연결하여 복합적인 의미를 전달하게 해주는 필수 도구입니다. 다음 레벨에서는 능력과 허가를 나타내는 조동사를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (28, 'can/can''t 능력, may/might 가능성, 능력 질문, 허가 요청 학습', '"수영할 수 있습니다", "비가 올지도 모릅니다", "영어를 할 수 있나요?", "써도 됩니까?" 등 능력과 허가 관련 조동사 표현을 학습합니다. 자신의 능력을 말하고 허가를 구하는 것은 사회생활의 기본이며, 가능성 표현은 유연한 의사소통을 가능하게 합니다. 다음 레벨에서는 의무와 충고의 조동사를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (29, 'must/have to 의무, should 권고, need to 필요, 의무 부정 표현 학습', '"안전벨트를 매야 합니다", "쉬어야 합니다", "우유를 사야 합니다", "기다릴 필요 없습니다" 등 의무와 충고를 나타내는 표현을 학습합니다. 의무와 조언의 표현은 규칙을 이해하고 타인에게 도움을 주는 대화에서 핵심적인 역할을 합니다. 다음 레벨에서는 일상 루틴을 묘사하는 종합 표현을 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (30, '아침/직장·학교/저녁/주말 루틴 묘사 표현 학습', '"일어나면 양치질을 합니다", "9시에 출근합니다", "자기 전에 책을 읽습니다", "주말에는 부모님을 방문합니다" 등 하루 일과를 묘사하는 표현을 학습합니다. 일상 루틴 묘사는 지금까지 배운 현재형, 접속사, 시간 표현을 종합적으로 활용하는 단계입니다. 다음 레벨부터 중급으로 진입하여 미래 시제를 배웁니다.', v_beginner_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (31, 'will 긍정문/부정문/의문문, will 약속/의지 표현 학습', '"내일 전화하겠습니다", "늦지 않을 것입니다", "같이 가시겠습니까?", "최선을 다하겠습니다" 등 will을 사용한 미래 표현을 학습합니다. 미래 시제의 습득으로 시간의 세 축(과거-현재-미래)을 모두 표현할 수 있게 되어 의사소통 능력이 비약적으로 확장됩니다. 다음 레벨에서는 be going to를 통한 계획 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (32, 'be going to 계획/예측, be going to 의문문, will vs be going to 학습', '"유학을 갈 예정입니다", "비가 올 것 같습니다", "올 건가요?", "즉흥 vs 계획" 등 be going to를 활용한 미래 표현과 will과의 뉘앙스 차이를 학습합니다. 미래를 표현하는 두 가지 방식을 구별하여 사용하면 의도를 더 정확하게 전달할 수 있습니다. 다음 레벨에서는 현재진행형을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (33, '현재진행형 긍정문/부정문/의문문, 현재형 vs 현재진행형 학습', '"점심을 먹고 있습니다", "일하고 있지 않습니다", "뭐 하고 있어요?", "습관 vs 지금" 등 현재진행형 표현과 현재형과의 차이를 학습합니다. 지금 이 순간 일어나는 일을 생생하게 전달하는 진행형은 대화에 현장감을 부여합니다. 다음 레벨에서는 과거진행형을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (34, '과거진행형 긍정문/부정문/의문문, 과거 vs 과거진행 구분 학습', '"전화 왔을 때 TV를 보고 있었습니다", "그 시간에 자고 있지 않았습니다", "8시에 뭐 하고 있었어요?" 등 과거진행형 표현을 학습합니다. 과거의 특정 순간에 진행 중이던 행동을 표현하면 이야기에 배경과 맥락을 제공할 수 있습니다. 다음 레벨에서는 제안과 초대 관련 대화를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (35, '제안 표현, 초대 표현, 수락/거절, 약속 잡기 대화 학습', '"영화 보러 가는 게 어때요?", "파티에 오시겠어요?", "좋아요!/안 될 것 같아요", "토요일에 시간 있으세요?" 등 사교 대화 표현을 학습합니다. 제안과 초대는 인간관계를 형성하고 유지하는 핵심 대화 기술이며, 적절한 수락과 거절도 중요한 소통 능력입니다. 다음 레벨에서는 식당 대화를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (36, '식당 예약/입장, 음식 주문, 특별 요청, 계산 대화 학습', '"예약이 있습니다", "파스타로 하겠습니다", "양파 빼주세요", "계산서 주세요" 등 식당에서의 전체 대화 흐름을 학습합니다. 식당 대화는 여행과 일상에서 가장 빈번하게 발생하는 실용 회화 상황 중 하나입니다. 다음 레벨에서는 교통과 길 안내 대화를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (37, '길 묻기/안내하기, 대중교통 이용, 택시 이용 대화 학습', '"역까지 어떻게 가나요?", "직진해서 오른쪽으로 도세요", "시내로 가는 버스가 어느 건가요?", "이 주소로 가주세요" 등 교통 관련 대화를 학습합니다. 이동과 길 안내는 여행이나 새로운 환경에서 독립적으로 활동하기 위한 필수 기술입니다. 다음 레벨에서는 전화와 메시지 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (38, '전화 받기/걸기, 메시지 남기기, 약속 확인, 통화 마무리 학습', '"여보세요, 저는 ~입니다", "메시지 남겨도 될까요?", "회의를 확인하려고 전화했습니다", "전화해 주셔서 감사합니다" 등 전화 대화 표현을 학습합니다. 전화 통화는 비대면 상황에서의 의사소통 능력을 키우며, 업무와 일상 모두에서 활용됩니다. 다음 레벨에서는 감정을 문장으로 표현하는 방법을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (39, '기쁨/만족, 슬픔/실망, 놀람, 걱정 감정 표현 학습', '"정말 행복합니다", "실망스럽습니다", "정말요?", "시험이 걱정됩니다" 등 다양한 감정을 문장으로 표현하는 방법을 학습합니다. 감정 표현은 인간관계에서 공감과 이해를 형성하는 핵심 요소이며, 더 깊은 수준의 대화를 가능하게 합니다. 다음 레벨에서는 건강과 병원 관련 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (40, '증상 설명, 병원 방문, 처방/조언, 안부 묻기 표현 학습', '"두통이 있습니다", "의사를 만나야 합니다", "이 약을 드세요", "좀 나아졌어요?" 등 건강 관련 대화 표현을 학습합니다. 건강 문제를 설명하고 의료 상담을 받는 능력은 해외에서 특히 중요한 생존 회화입니다. 다음 레벨에서는 현재완료 시제를 배우기 시작합니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (41, '현재완료 경험 긍정문/부정문/의문문, 횟수 표현 학습', '"일본에 가본 적이 있습니다", "눈을 본 적이 없습니다", "파리에 가본 적 있나요?", "거기에 두 번 갔습니다" 등 현재완료로 경험을 표현하는 방법을 학습합니다. 과거 경험을 현재와 연결하는 현재완료는 영어의 핵심 시제이며, 대화의 깊이를 더해줍니다. 다음 레벨에서는 현재완료의 완료/결과 용법을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (42, '현재완료 완료/미완료 표현, 완료 의문문, just/already/yet 활용 학습', '"숙제를 끝냈습니다", "아직 먹지 않았습니다", "빨래 했어요?", "방금 도착했습니다" 등 행동의 완료와 결과를 나타내는 현재완료 표현을 학습합니다. just, already, yet 등의 부사와 결합하여 완료 시점의 뉘앙스를 세밀하게 전달할 수 있습니다. 다음 레벨에서는 1형 조건문을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (43, '1형 조건문 기본/부정, 1형 조건 의문문, unless 조건 학습', '"비가 오면 집에 있겠습니다", "서두르지 않으면 버스를 놓칩니다", "비가 오지 않으면 갈 것입니다" 등 현실적으로 가능한 조건을 표현하는 1형 조건문을 학습합니다. 조건문은 계획을 세우고 상황에 대비하는 논리적 사고를 표현하는 핵심 구조입니다. 다음 레벨에서는 수동태를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (44, '현재/과거 수동태, 수동태 의문문, 능동태 vs 수동태 전환 학습', '"여기서 영어가 사용됩니다", "창문이 깨졌습니다", "한국에서 만들어졌나요?" 등 수동태 표현과 능동태와의 전환을 학습합니다. 수동태는 행동의 대상에 초점을 맞출 때 사용하며, 뉴스나 공식 문서에서 빈번히 등장합니다. 다음 레벨에서는 동명사와 to부정사를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (45, '동명사/to부정사 목적어, 동명사 vs to부정사, 동명사 주어 학습', '"독서를 즐깁니다", "여행하고 싶습니다", "수영하는 것을 좋아합니다", "언어를 배우는 것은 시간이 걸립니다" 등 동명사와 to부정사 활용법을 학습합니다. 이 구문들은 동사 뒤에 다른 동사를 연결하는 핵심 문법으로, 표현의 유연성을 크게 높여줍니다. 다음 레벨에서는 형용사와 부사를 심화 학습합니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (46, '감정 형용사(-ed/-ing), 부사 위치/용법, 정도/빈도 부사 심화 학습', '"지루합니다 vs 지루한 영화", "유창하게 영어를 합니다", "꽤 비쌉니다", "패스트푸드를 거의 먹지 않습니다" 등 형용사와 부사의 심화 활용을 학습합니다. 정확한 형용사/부사 사용은 표현의 정밀도를 높여 원어민에 가까운 자연스러운 문장을 만듭니다. 다음 레벨에서는 복합문 연결을 심화합니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (47, '대등/대조/인과/선택 접속 심화, 복합문 구성 학습', '"가게에 가서 우유를 샀습니다", "가고 싶었지만 너무 피곤했습니다", "추웠기 때문에 재킷을 입었습니다" 등 다양한 접속 유형의 심화 복합문을 학습합니다. 복합문을 자유롭게 구사하면 하나의 문장으로 복잡한 상황을 논리적으로 설명할 수 있습니다. 다음 레벨에서는 호텔과 숙소 관련 대화를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (48, '숙소 예약, 체크인/체크아웃, 시설 문의, 문제 신고 대화 학습', '"2박으로 방을 예약하고 싶습니다", "체크아웃은 몇 시인가요?", "와이파이가 되나요?", "에어컨이 작동하지 않습니다" 등 숙소 관련 대화를 학습합니다. 여행 시 숙소에서의 의사소통은 필수적이며, 문제 상황 대처 능력도 함께 기릅니다. 다음 레벨에서는 공항과 비행 관련 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (49, '수속/출입국 심사, 기내 서비스, 수하물 관련 대화 학습', '"창가 좌석으로 부탁합니다", "얼마나 체류하실 건가요?", "물 좀 주시겠어요?", "짐이 없어졌습니다" 등 공항과 비행기에서의 대화를 학습합니다. 국제 여행의 전 과정에서 필요한 표현으로, 공식적인 상황에서의 질의응답 능력을 기릅니다. 다음 레벨에서는 의견을 표현하는 방법을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (50, '의견 말하기, 동의/반대, 이유 설명, 선호 표현 심화 학습', '"좋은 생각이라고 봅니다", "동의합니다", "이유는 ~이기 때문입니다", "집에 있는 게 낫겠습니다" 등 자신의 의견을 명확히 표현하는 방법을 학습합니다. 의견 표현은 토론과 협업의 기초이며, 이유를 논리적으로 설명하는 능력은 고급 의사소통의 시작점입니다. 다음 레벨에서는 관계대명사를 배우기 시작합니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (51, 'who/which/that 관계절, 관계대명사 생략, where 관계부사 학습', '"전화한 사람은 제 친구입니다", "내가 산 책은 재미있습니다", "우리가 먹은 식당은 비쌌습니다" 등 관계대명사를 활용한 복문을 학습합니다. 관계절은 명사를 상세히 수식하여 한 문장에 더 많은 정보를 담을 수 있게 해주는 핵심 구조입니다. 다음 레벨에서는 현재완료진행형을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (52, '현재완료진행 긍정문/의문문, 현재완료 vs 현재완료진행, since/for 학습', '"3시간째 공부하고 있습니다", "얼마나 기다리셨어요?", "완료 vs 진행 초점", "2020년부터 여기 살고 있습니다" 등 현재완료진행형 표현을 학습합니다. 이 시제는 과거부터 현재까지 계속되는 행동을 강조하며, 대화에서 지속성과 임시성의 뉘앙스를 전달합니다. 다음 레벨에서는 간접 의문문을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (53, '의문사/if·whether 간접 의문문, 간접 의문 요청/보고 학습', '"그녀가 어디 사는지 아세요?", "그가 올지 궁금합니다", "어떻게 가는지 알려주시겠어요?", "몇 시에 시작하는지 모르겠습니다" 등 간접 의문문을 학습합니다. 간접 의문문은 직접 질문보다 공손하고 자연스러운 표현으로, 실제 대화에서 매우 빈번하게 사용됩니다. 다음 레벨에서는 가정법 현재(2형 조건문)를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (54, '2형 조건문 긍정/부정/의문, wish + 과거형 가정 표현 학습', '"돈이 있다면 세계여행을 할 텐데", "바쁘지 않다면 도와줄 수 있을 텐데", "프랑스어를 할 수 있으면 좋겠다" 등 현재 사실과 반대되는 가정을 표현하는 2형 조건문을 학습합니다. 가정법은 상상과 소망을 표현하는 고급 문법으로, 창의적이고 깊이 있는 대화를 가능하게 합니다. 다음 레벨에서는 비교 구문을 심화합니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (55, '비교급 강조, 이중 비교급, 배수 비교, 비교급/최상급 관용 표현 학습', '"이것이 훨씬 좋습니다", "연습할수록 실력이 늡니다", "이것은 저것의 두 배 비쌉니다", "내가 본 최고의 영화 중 하나" 등 심화 비교 표현을 학습합니다. 세밀한 비교 표현은 분석적이고 설득력 있는 의사소통에 필수적입니다. 다음 레벨에서는 사역/지각 동사를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (56, 'make/let/have 사역, 지각 동사, get/help 사역 표현 학습', '"그녀가 나를 웃게 했습니다", "그가 나가는 것을 봤습니다", "그에게 고치게 했습니다", "이해하도록 도와주었습니다" 등 사역과 지각 동사 구문을 학습합니다. 다른 사람의 행동을 묘사하거나 지시하는 이 구문들은 관계와 상호작용을 표현하는 핵심 도구입니다. 다음 레벨에서는 직장 생활 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (57, '면접 표현, 업무 보고, 회의 표현, 이메일 표현 학습', '"5년 경력이 있습니다", "프로젝트가 예정대로 진행 중입니다", "화면을 공유하겠습니다", "알려드리기 위해 글을 씁니다" 등 직장 생활 표현을 학습합니다. 비즈니스 환경에서의 의사소통 능력은 전문적 성장의 핵심이며, 격식 있는 표현을 익히는 단계입니다. 다음 레벨에서는 뉴스와 사건 묘사를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (58, '뉴스 이해, 사건 설명, 통계/수치, 의견 교환 표현 학습', '"보고서에 따르면...", "화재가 발생했습니다", "매출이 20% 증가했습니다", "~~에 대해 어떻게 생각하세요?" 등 뉴스와 사건을 이해하고 논의하는 표현을 학습합니다. 시사 주제에 대해 대화하는 능력은 사회적 의사소통의 중요한 부분입니다. 다음 레벨에서는 문화와 예술 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (59, '영화/드라마, 음악/공연, 전시/박물관, 독서/문학 감상 표현 학습', '"연기가 인상적이었습니다", "~의 열렬한 팬입니다", "이 그림은 18세기 작품입니다", "이 이야기는 ~에 관한 것입니다" 등 문화와 예술에 대한 감상을 표현하는 방법을 학습합니다. 문화적 소양을 언어로 표현하는 능력은 교양 있는 의사소통의 핵심입니다. 다음 레벨에서는 사회와 환경 주제의 표현을 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (60, '환경 문제, 사회 이슈, 건강 생활, 기술과 생활 표현 학습', '"오염이 심해지고 있습니다", "교육은 모든 사람에게 중요합니다", "규칙적인 운동은 스트레스를 줄여줍니다", "기술이 우리 삶을 크게 바꿨습니다" 등 사회적 주제에 대한 의견을 표현하는 방법을 학습합니다. 추상적이고 사회적인 주제를 다루는 능력은 중급에서 상급으로 넘어가는 관문입니다. 다음 레벨부터 상급으로 진입하여 과거완료를 배웁니다.', v_intermediate_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (61, '과거완료 긍정문/부정문/의문문, 과거완료+과거 연결 학습', '"그녀가 도착했을 때 이미 먹었습니다", "아직 끝내지 못했습니다", "전에 가본 적 있었나요?", "공부를 마친 후 잠자리에 들었습니다" 등 과거완료 표현을 학습합니다. 과거완료는 두 과거 사건의 선후 관계를 명확히 하여 복잡한 이야기를 정확하게 전달할 수 있게 합니다. 다음 레벨에서는 미래진행형을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (62, '미래진행형 긍정문/의문문, 미래진행 예정/정중한 질문 학습', '"내일 3시에 일하고 있을 것입니다", "차를 사용하실 건가요?", "태평양 위를 비행하고 있을 것입니다", "저녁 식사에 참석하실 건가요?" 등 미래진행형 표현을 학습합니다. 미래진행형은 미래의 특정 시점에서의 상황을 묘사하며, 정중한 질문에도 활용되는 세련된 표현입니다. 다음 레벨에서는 간접화법을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (63, '평서문/의문문/명령문 간접화법, 시제 일치 규칙 학습', '"그는 피곤하다고 말했습니다", "어디에 사는지 물었습니다", "기다리라고 했습니다", "아팠다고 말했습니다" 등 다른 사람의 말을 간접적으로 전달하는 간접화법을 학습합니다. 간접화법은 보고, 전달, 인용에 필수적이며, 시제 후퇴 규칙을 이해하면 정확한 정보 전달이 가능합니다. 다음 레벨에서는 3형 조건문(가정법 과거)을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (64, '3형 조건문 긍정/부정/의문, wish + 과거완료 후회 표현 학습', '"더 열심히 공부했다면 합격했을 텐데", "도와주지 않았다면 실패했을 것입니다", "당신 말을 들었어야 했는데" 등 과거 사실과 반대되는 가정을 표현하는 3형 조건문을 학습합니다. 과거에 대한 후회와 반사실적 가정은 깊은 성찰과 복잡한 감정을 표현하는 고급 문법입니다. 다음 레벨에서는 수동태를 심화합니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (65, '완료/진행/조동사 수동태, 전치사 수동태 관용 표현 학습', '"다리가 수리되었습니다", "집이 칠해지고 있습니다", "고쳐져야 합니다", "재능으로 유명합니다" 등 심화 수동태 표현을 학습합니다. 다양한 시제와 조동사를 수동태에 적용하면 뉴스, 학술, 비즈니스 등 격식 있는 상황에서의 표현력이 크게 향상됩니다. 다음 레벨에서는 관계대명사를 심화합니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (66, 'whose, 전치사+관계대명사, 관계부사 심화, 복합관계대명사 학습', '"차가 도난당한 그 남자", "제가 이야기한 그 분", "늦은 이유는...", "먼저 오는 사람이 상을 받습니다" 등 심화 관계절 표현을 학습합니다. 복잡한 관계절을 자유롭게 구사하면 한 문장에 풍부한 정보를 정확하게 담을 수 있습니다. 다음 레벨에서는 설득과 협상 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (67, '설득 표현, 양보/타협, 조건 제시, 결론 유도 표현 학습', '"강력히 추천합니다", "말씀은 알겠지만...", "~라는 조건으로 동의하겠습니다", "따라서 ~라고 봅니다" 등 설득과 협상에 필요한 표현을 학습합니다. 논리적으로 설득하고 양보와 타협을 통해 합의를 이끌어내는 능력은 전문적 환경에서의 핵심 역량입니다. 다음 레벨에서는 감정 표현을 심화합니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (68, '복합 감정, 공감 표현, 위로/격려, 후회 표현 심화 학습', '"안도되면서도 약간 실망합니다", "기분을 이해합니다", "포기하지 마세요", "가지 않은 것이 후회됩니다" 등 복합적이고 미묘한 감정 표현을 학습합니다. 섬세한 감정 표현은 깊은 인간관계를 형성하고 정서적 유대를 강화하는 고급 의사소통 능력입니다. 다음 레벨에서는 묘사와 설명 기법을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (69, '인물/장소 묘사, 과정 설명, 비유 표현 기초 학습', '"곱슬머리의 키 큰 여성입니다", "방은 작지만 아늑했습니다", "먼저 ~을 해야 합니다", "꿈만 같습니다" 등 사람, 장소, 과정을 상세히 묘사하고 비유를 활용하는 표현을 학습합니다. 풍부한 묘사력은 이야기를 생동감 있게 전달하고 청자의 이해를 돕는 핵심 기술입니다. 다음 레벨에서는 논리적 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (70, '원인/결과, 조건/가정, 대조/양보, 추가/강조 논리 표현 학습', '"비 때문에 행사가 취소되었습니다", "모든 것이 잘 된다면...", "비싸긴 했지만 그만한 가치가 있었습니다", "게다가 서비스도 훌륭했습니다" 등 논리적 연결 표현을 학습합니다. due to, although, moreover 등 고급 연결어를 구사하면 주장의 논리성과 설득력이 크게 향상됩니다. 다음 레벨에서는 미래완료를 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (71, '미래완료 긍정문/부정문/의문문, 미래완료+기간 표현 학습', '"그때까지 끝낼 것입니다", "정오까지 도착하지 못할 것입니다", "금요일까지 완료하셨을까요?", "내년이면 여기 산 지 10년이 됩니다" 등 미래완료 표현을 학습합니다. 미래완료는 미래의 특정 시점까지의 완료를 표현하여 시간 개념의 정밀도를 극대화합니다. 다음 레벨에서는 가정법 혼합을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (72, '혼합 가정법, as if/as though, It''s time+가정법, would rather 학습', '"의학을 전공했다면 지금 의사일 텐데", "모든 것을 아는 것처럼 행동합니다", "이제 떠날 시간입니다", "여기서 담배를 피우지 않았으면 합니다" 등 혼합 가정법 표현을 학습합니다. 가정법의 다양한 변형을 구사하면 미묘한 뉘앙스와 정중한 표현을 자유롭게 사용할 수 있습니다. 다음 레벨에서는 분사 구문을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (73, '현재/과거 분사 구문, 분사구문 부정, 독립분사구문 학습', '"길을 걷다가 옛 친구를 만났습니다", "일에 지쳐서 바로 잠들었습니다", "뭐라고 말해야 할지 몰라 침묵을 지켰습니다", "날씨가 허락한다면 소풍을 갈 것입니다" 등 분사 구문을 학습합니다. 분사 구문은 문장을 간결하게 압축하면서도 풍부한 의미를 전달하는 세련된 문법 구조입니다. 다음 레벨에서는 강조 구문을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (74, 'It is...that 강조, do/does/did 강조, 부정어 도치 강조, what 강조절 학습', '"꽃병을 깬 것은 존이었습니다", "도움에 정말 감사합니다", "그런 아름다움은 본 적이 없습니다", "내가 필요한 것은 휴가입니다" 등 다양한 강조 구문을 학습합니다. 강조 구문은 문장의 특정 요소를 부각시켜 의사 전달의 임팩트를 극대화하는 고급 표현 기법입니다. 다음 레벨에서는 비즈니스 커뮤니케이션을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (75, '프레젠테이션, 협상, 클레임/불만, 공식 서신 표현 학습', '"데이터를 설명하겠습니다", "10% 할인을 제안할 용의가 있습니다", "불만을 접수하고 싶습니다", "우려를 표명하기 위해 글을 씁니다" 등 비즈니스 커뮤니케이션 표현을 학습합니다. 전문적 환경에서의 격식 있는 의사소통 능력은 경력 발전의 필수 요소입니다. 다음 레벨에서는 학술/전문 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (76, '연구 결과 보고, 인용/참조, 가설/추론, 정의/분류 학술 표현 학습', '"연구 결과 ~임이 밝혀졌습니다", "보고서에 의하면...", "~일 가능성이 있습니다", "이것은 ~로 정의될 수 있습니다" 등 학술적 표현을 학습합니다. 학술 논문이나 전문 보고서에서 사용되는 정형 표현을 익히면 전문적 글쓰기와 발표 능력이 향상됩니다. 다음 레벨에서는 추상적 개념 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (77, '철학적 표현, 가치관, 윤리적 판단, 미래 전망 추상적 표현 학습', '"행복은 사람마다 다른 의미입니다", "평등을 믿습니다", "~~하는 것이 옳은가?", "결국에는 상황이 변할 것입니다" 등 추상적 개념을 표현하는 방법을 학습합니다. 추상적 사고를 언어로 표현하는 능력은 지적 대화와 심층적 토론의 기반이 됩니다. 다음 레벨에서는 관용 표현과 비유를 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (78, '관용 표현, 비유/은유, 완곡 표현, 반어/아이러니 학습', '"비가 억수같이 옵니다", "시간은 돈이다", "돌아가셨습니다", "좋았어, 또 비가 오는군" 등 관용적이고 비유적인 표현을 학습합니다. 관용 표현과 비유는 해당 언어의 문화적 깊이를 반영하며, 원어민다운 자연스러운 표현력의 핵심입니다. 다음 레벨에서는 미디어 리터러시 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (79, '뉴스 보도, 소셜미디어, 광고/마케팅, 리뷰/평가 표현 학습', '"~로 보도되었습니다", "소셜미디어에서 유행 중입니다", "기간 한정 특가", "5점 만점에 4점을 주겠습니다" 등 미디어 관련 표현을 학습합니다. 현대 사회에서 미디어를 이해하고 활용하는 리터러시는 필수적인 언어 능력입니다. 다음 레벨에서는 법률/공식 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (80, '계약 표현, 규정/정책, 권리/의무, 면책/조건 법률 표현 학습', '"양 당사자는 이에 동의합니다", "~~하는 것은 금지됩니다", "~~할 권리가 있습니다", "다음 조건에 따라..." 등 법률적이고 공식적인 표현을 학습합니다. 계약서, 규정, 정책 문서를 이해하고 작성하는 능력은 전문적이고 법적인 상황에서 자신을 보호하는 핵심 역량입니다. 다음 레벨에서는 도치 구문을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (81, '부정어/장소부사/so·neither 도치, 조건절 도치 학습', '"앉자마자 전화가 울렸습니다", "버스가 옵니다(도치)", "저도 그렇습니다", "알았더라면 더 일찍 왔을 것입니다" 등 다양한 유형의 도치 구문을 학습합니다. 도치 구문은 문장에 극적 효과를 부여하고 특정 요소를 강조하는 고급 수사 기법입니다. 다음 레벨에서는 현재완료진행형을 심화합니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (82, '장기간 지속, 원인 설명, 불만/강조, 변화 추세 현재완료진행 심화 학습', '"몇 달째 이 프로젝트를 진행하고 있습니다", "뛰어왔기 때문에 피곤합니다", "1시간 넘게 기다리고 있습니다!", "물가가 꾸준히 오르고 있습니다" 등 현재완료진행의 심화 활용을 학습합니다. 지속, 원인, 불만, 추세 등 다양한 맥락에서의 활용으로 시제 표현의 정밀도를 극대화합니다. 다음 레벨에서는 복잡한 조건문을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (83, '혼합 시제 조건문, 조건 연쇄, but for 구문, 조건 관용표현 학습', '"비가 오지 않았다면 땅이 젖어있지 않을 텐데", "A가 일어나면 B가 따를 것이고...", "당신의 도움이 아니었다면 실패했을 것입니다", "무슨 일이 있더라도..." 등 복잡한 조건문을 학습합니다. 다양한 시제를 혼합한 조건문은 원어민 수준의 정교한 논리 표현을 가능하게 합니다. 다음 레벨에서는 학술 토론 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (84, '주장 제시, 반론, 근거 제시, 결론 도출 학술 토론 표현 학습', '"~~라고 주장합니다", "반면에...", "증거가 ~을 시사합니다", "종합하면..." 등 학술 토론에서 사용하는 격식 있는 표현을 학습합니다. 논리적으로 주장을 전개하고 반론에 대응하며 결론을 도출하는 능력은 학문적, 전문적 환경에서의 핵심 역량입니다. 다음 레벨에서는 외교적/완곡 표현을 배웁니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (85, '완곡한 거절, 정중한 비동의, 우회적 비판, 조심스러운 제안 학습', '"유감이지만 그것은 어려울 것 같습니다", "실례지만 동의하기 어렵습니다", "개선의 여지가 있을 수 있습니다", "대안적 접근을 제안해도 될까요?" 등 외교적이고 완곡한 표현을 학습합니다. 직접적 표현을 피하면서도 의사를 정확히 전달하는 기술은 전문적 환경과 국제적 소통에서 매우 중요합니다. 다음 레벨부터 원어민 수준으로 진입합니다.', v_advanced_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (86, '서사 기법, 감각적 묘사, 심리 묘사, 시적 표현 문학적 학습', '"옛날 옛적에...", "갓 구운 빵의 향기가 방을 가득 채웠습니다", "의무와 욕망 사이에서 갈등했습니다", "침묵이 말보다 크게 울렸습니다" 등 문학적 표현을 학습합니다. 서사, 감각, 심리, 시적 표현은 언어의 예술적 차원을 열어주며, 글과 말에 깊이와 감동을 더합니다. 다음 레벨에서는 과학/기술 표현을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (87, '과학적 설명, 기술적 설명, 통계 해석, 추세/전망 전문 표현 학습', '"실험은 ~을 입증합니다", "시스템은 데이터를 실시간으로 처리합니다", "유의미한 상관관계를 보여줍니다", "현재 추세에 기반하여 ~을 예측할 수 있습니다" 등 과학/기술 전문 표현을 학습합니다. STEM 분야의 전문 용어와 표현을 익히면 학술 논문과 기술 문서를 이해하고 작성할 수 있습니다. 다음 레벨에서는 금융/경제 표현을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (88, '경제 지표, 시장/투자, 거래/계약, 재정 계획 금융 표현 학습', '"인플레이션이 10년래 최고를 기록했습니다", "주식시장이 급락했습니다", "거래가 500만 달러에 성사되었습니다", "예산을 배정해야 합니다" 등 금융/경제 전문 표현을 학습합니다. 경제 뉴스와 금융 거래에서 사용되는 전문 용어를 구사하면 비즈니스 세계에서의 의사소통 능력이 완성됩니다. 다음 레벨에서는 법적 심화 표현을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (89, '법적 용어, 공식 통보, 조약/협정, 면책 조항 법적 심화 표현 학습', '"피고는 유죄 판결을 받았습니다", "~을 알려드립니다", "본 협정은 ~일에 발효됩니다", "회사는 ~에 대해 책임을 지지 않습니다" 등 법적 심화 표현을 학습합니다. 법률 문서와 공식 통보의 언어를 이해하고 작성하는 능력은 전문가 수준의 언어 능력을 증명합니다. 다음 레벨에서는 문화적 뉘앙스를 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (90, '문화적 관용표현, 세대별 표현 차이, 유머/위트, 지역 특색 표현 학습', '"로마에 가면 로마 법을 따르라", "대박이다 vs 매우 인상적이다", "말장난은 의도한 게 아닙니다", "미국 vs 영국 표현 차이" 등 문화적 뉘앙스를 담은 표현을 학습합니다. 언어의 문화적 맥락과 지역적 변이를 이해하는 것은 원어민 수준의 유창함에 도달하기 위한 필수 요소입니다. 다음 레벨에서는 고급 연결어를 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (91, '복합 연결어, 논리 전개, 부연/예시 심화, 요약/결론 심화 표현 학습', '"도전에도 불구하고...", "같은 맥락에서...", "이 점을 설명하자면...", "모든 것을 고려하면..." 등 고급 연결어를 활용한 복잡한 문장 구성을 학습합니다. 정교한 연결어를 구사하면 글과 말의 논리적 흐름이 자연스러워지고 학술적 수준의 담화를 생산할 수 있습니다. 다음 레벨에서는 추론과 추측 심화를 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (92, '강한/약한/과거 추측 표현, 논리적 추론 표현 학습', '"틀림없이 지쳤을 것입니다", "잊었을지도 모릅니다", "지금쯤 도착했을 것입니다", "~~라고 추론할 수 있습니다" 등 다양한 확신도의 추측과 논리적 추론 표현을 학습합니다. 확신의 정도를 세밀하게 조절하는 조동사 활용은 정보의 신뢰도를 정확하게 전달하는 고급 기술입니다. 다음 레벨에서는 수사적 표현을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (93, '수사 의문문, 점층법, 대구법, 역설 수사적 표현 학습', '"좋은 이야기를 싫어하는 사람이 있을까요?", "왔노라, 보았노라, 이겼노라", "쉽게 왔다 쉽게 간다", "적은 것이 더 많은 것이다" 등 수사적 표현 기법을 학습합니다. 수사법은 연설, 글쓰기, 토론에서 청중의 관심을 끌고 메시지의 임팩트를 극대화하는 언어 예술입니다. 다음 레벨에서는 학술 논문 스타일을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (94, '논문 서론, 방법론, 결과 보고, 한계/향후 연구 학술 논문 표현 학습', '"본 논문은 ~을 검토합니다", "질적 연구 방법이 사용되었습니다", "연구 결과는 유의미한 ~을 보여줍니다", "추가 연구가 필요합니다" 등 학술 논문의 각 섹션에서 사용되는 정형 표현을 학습합니다. 학술 논문 작성은 최고 수준의 언어 능력을 요구하는 분야로, 체계적인 지식 전달 능력을 완성합니다. 다음 레벨에서는 시사 토론 심화를 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (95, '정치/사회 담론, 찬반 토론, 중재/합의, 미래 제언 시사 토론 학습', '"이 정책은 불평등을 해소하는 것을 목표로 합니다", "찬성측은 ~라고 주장합니다", "균형 잡힌 접근이 필요합니다", "앞으로 ~이 필수적입니다" 등 시사 토론 심화 표현을 학습합니다. 복잡한 사회적 이슈에 대해 균형 잡힌 시각으로 토론하는 능력은 지식인 수준의 언어 역량을 증명합니다. 다음 레벨에서는 감성적 글쓰기를 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (96, '감정 전달 서신, 축사/조사, 동기부여, 회고/성찰 감성적 글쓰기 학습', '"얼마나 감사한지 말로 표현할 수 없습니다", "대단히 기쁜 마음으로...", "천 리 길도 한 걸음부터", "돌이켜보면 ~을 깨닫습니다" 등 감성적이고 격식 있는 글쓰기 표현을 학습합니다. 축하, 추모, 성찰 등 특별한 순간의 감정을 격조 있게 표현하는 능력은 언어 예술의 정수입니다. 다음 레벨에서는 다문화 의사소통을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (97, '문화 민감성, 다양성, 글로벌 에티켓, 포용적 표현 다문화 소통 학습', '"일부 문화에서는 ~이 무례하게 여겨집니다", "다양성이 우리의 시야를 넓혀줍니다", "일본에서는 고개 숙이는 것이 관례입니다", "모든 사람은 동등한 기회를 누릴 자격이 있습니다" 등 다문화 의사소통 표현을 학습합니다. 문화적 민감성과 포용적 언어 사용은 글로벌 환경에서의 소통 역량의 핵심입니다. 다음 레벨에서는 전문 발표/연설을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (98, '연설 도입, 핵심 메시지 전달, 청중 참여 유도, 연설 마무리 학습', '"오늘 이 자리에 서게 되어 영광입니다", "전하고 싶은 메시지는...", "한 가지 여쭤볼게요...", "마무리하면서 ~을 당부드립니다" 등 공식 연설과 발표 표현을 학습합니다. 청중 앞에서 효과적으로 메시지를 전달하는 퍼블릭 스피킹 능력은 리더십과 영향력의 근간입니다. 다음 레벨에서는 창의적 표현을 배웁니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (99, '스토리텔링, 설득적 글쓰기, 비평/분석, 창작 표현 학습', '"~한 세상을 상상해보세요", "증거가 압도적입니다", "이 작품은 ~를 포착하는 데 성공합니다", "새벽이 하늘을 황금빛으로 물들였습니다" 등 창의적이고 예술적인 표현을 학습합니다. 상상력을 자극하고 독자를 설득하며 작품을 분석하는 창의적 언어 능력은 언어 학습의 최고 경지에 해당합니다. 마지막 레벨에서는 모든 학습을 종합합니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

  INSERT INTO public.levels (level_number, level_summary, description, native_level_type_id)
  VALUES (100, '속담/격언 활용, 미묘한 뉘앙스, 자유 의사표현, 종합 표현력 학습', '"옛말에 ~~라고 하죠", "~와 ~ 사이에는 미묘한 차이가 있습니다", "이보다 더 잘 표현할 수 없을 것입니다", "모든 사항을 고려하면 ~이 분명해집니다" 등 원어민 수준의 종합 표현력을 학습합니다. 속담의 자연스러운 인용, 미세한 뉘앙스 구별, 자유로운 의사표현은 언어 완성의 결정적 지표이며, 100개 레벨의 여정을 완성하는 최종 단계입니다.', v_native_id)
  ON CONFLICT (level_number) DO UPDATE SET level_summary = EXCLUDED.level_summary, description = EXCLUDED.description, native_level_type_id = EXCLUDED.native_level_type_id;

END $$;

-- ---------------------------------------------------------------------------
-- 6.3 types - root categories (parent_id = NULL)
-- ---------------------------------------------------------------------------
INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, is_active) VALUES
  (NULL, '시제',          'TENSE',             1, 'Tense - parent category', true),
  (NULL, '문형',          'SENT_PATTERN',      2, 'Sentence Pattern - parent category', true),
  (NULL, '용도',          'PURPOSE',           3, 'Purpose - parent category', true),
  (NULL, '톤',            'TONE',              4, 'Tone - parent category', true),
  (NULL, '상황',          'SITUATION',         5, 'Situation - parent category', true),
  (NULL, '점검유형',      'CHECK_TYPE',        6, 'Check Type - parent category', true),
  (NULL, '익힘수준',      'MASTERY_LEVEL',     7, 'Mastery Level - parent category', true),
  (NULL, '일일 목표',     'DAILY_GOAL',        8, 'Daily Goal - parent category', true),
  (NULL, '언어',          'LANGUAGE',          9, 'Language - parent category', true),
  (NULL, '원어민수준유형', 'NATIVE_LEVEL_TYPE', 10, 'Native Level Type - parent category', true),
  (NULL, '약관유형',      'TERMS_TYPE',        11, 'Terms Type - parent category', true),
  (NULL, '모국어유형',    'MOTHER_TONGUE_TYPE', 12, 'Mother Tongue Type - parent category (references LANGUAGE children)', true),
  (NULL, '학습언어유형',  'LEARNING_LANG_TYPE', 13, 'Learning Language Type - parent category (references LANGUAGE children)', true)
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- 6.4 types - children (using DO $$ block for parent lookups)
-- ---------------------------------------------------------------------------
DO $$
DECLARE
  v_tense_id            UUID;
  v_sent_pattern_id     UUID;
  v_purpose_id          UUID;
  v_tone_id             UUID;
  v_situation_id        UUID;
  v_check_type_id       UUID;
  v_mastery_level_id    UUID;
  v_daily_goal_id       UUID;
  v_language_id         UUID;
  v_native_level_id     UUID;
  v_terms_type_id       UUID;
  v_mother_tongue_id    UUID;
  v_learning_lang_id    UUID;
BEGIN
  -- Fetch parent IDs
  SELECT id INTO v_tense_id           FROM public.types WHERE type_code = 'TENSE'             AND parent_id IS NULL;
  SELECT id INTO v_sent_pattern_id    FROM public.types WHERE type_code = 'SENT_PATTERN'      AND parent_id IS NULL;
  SELECT id INTO v_purpose_id         FROM public.types WHERE type_code = 'PURPOSE'           AND parent_id IS NULL;
  SELECT id INTO v_tone_id            FROM public.types WHERE type_code = 'TONE'              AND parent_id IS NULL;
  SELECT id INTO v_situation_id       FROM public.types WHERE type_code = 'SITUATION'         AND parent_id IS NULL;
  SELECT id INTO v_check_type_id      FROM public.types WHERE type_code = 'CHECK_TYPE'        AND parent_id IS NULL;
  SELECT id INTO v_mastery_level_id   FROM public.types WHERE type_code = 'MASTERY_LEVEL'     AND parent_id IS NULL;
  SELECT id INTO v_daily_goal_id      FROM public.types WHERE type_code = 'DAILY_GOAL'        AND parent_id IS NULL;
  SELECT id INTO v_language_id        FROM public.types WHERE type_code = 'LANGUAGE'           AND parent_id IS NULL;
  SELECT id INTO v_native_level_id    FROM public.types WHERE type_code = 'NATIVE_LEVEL_TYPE' AND parent_id IS NULL;
  SELECT id INTO v_terms_type_id      FROM public.types WHERE type_code = 'TERMS_TYPE'        AND parent_id IS NULL;
  SELECT id INTO v_mother_tongue_id   FROM public.types WHERE type_code = 'MOTHER_TONGUE_TYPE' AND parent_id IS NULL;
  SELECT id INTO v_learning_lang_id   FROM public.types WHERE type_code = 'LEARNING_LANG_TYPE' AND parent_id IS NULL;

  -- TENSE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, is_active) VALUES
    (v_tense_id, '현재',         'T-PRES',   1, 'Present', true),
    (v_tense_id, '과거',         'T-PAST',   2, 'Past', true),
    (v_tense_id, '미래',         'T-FUT',    3, 'Future', true),
    (v_tense_id, '현재완료',     'T-PPERF',  4, 'Present Perfect', true),
    (v_tense_id, '과거완료',     'T-PAPERF', 5, 'Past Perfect', true),
    (v_tense_id, '미래완료',     'T-FPERF',  6, 'Future Perfect', true),
    (v_tense_id, '현재진행',     'T-PCONT',  7, 'Present Continuous', true),
    (v_tense_id, '과거진행',     'T-PACONT', 8, 'Past Continuous', true),
    (v_tense_id, '미래진행',     'T-FCONT',  9, 'Future Continuous', true),
    (v_tense_id, '현재완료진행', 'T-PPCON', 10, 'Present Perfect Continuous', true),
    (v_tense_id, '혼합시제',     'T-MIX',   11, 'Mixed Tenses', true),
    (v_tense_id, '시제 무관',    'T-NA',    12, 'Tense N/A', true)
  ON CONFLICT DO NOTHING;

  -- SENT_PATTERN children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, is_active) VALUES
    (v_sent_pattern_id, '단어',                             'SP-WORD', 1, 'Single Word', true),
    (v_sent_pattern_id, '주어+동사',                        'SP-SV',   2, 'Subject+Verb', true),
    (v_sent_pattern_id, '주어+동사+목적어',                  'SP-SVO',  3, 'Subject+Verb+Object', true),
    (v_sent_pattern_id, '주어+동사+간접목적어+직접목적어',     'SP-SVOO', 4, 'S+V+IO+DO', true),
    (v_sent_pattern_id, '주어+동사+목적어+보어',              'SP-SVOC', 5, 'S+V+O+Complement', true),
    (v_sent_pattern_id, '부정문',                            'SP-NEG',  6, 'Negative', true),
    (v_sent_pattern_id, '의문문',                            'SP-QUES', 7, 'Question', true),
    (v_sent_pattern_id, '명령/청유문',                       'SP-IMP',  8, 'Imperative', true),
    (v_sent_pattern_id, '수동태',                            'SP-PASS', 9, 'Passive Voice', true),
    (v_sent_pattern_id, '조건문',                            'SP-COND', 10, 'Conditional', true),
    (v_sent_pattern_id, '관계절',                            'SP-REL',  11, 'Relative Clause', true),
    (v_sent_pattern_id, '복합문',                            'SP-COMP', 12, 'Compound Sentence', true),
    (v_sent_pattern_id, '복문',                              'SP-CPLX', 13, 'Complex Sentence', true),
    (v_sent_pattern_id, '가정법',                            'SP-SUBJ', 14, 'Subjunctive', true),
    (v_sent_pattern_id, '간접화법',                          'SP-IND',  15, 'Indirect Speech', true),
    (v_sent_pattern_id, '강조구문',                          'SP-EMPH', 16, 'Emphatic Structure', true),
    (v_sent_pattern_id, '도치구문',                          'SP-INV',  17, 'Inverted Structure', true),
    (v_sent_pattern_id, '분사구문',                          'SP-PAR',  18, 'Participial Phrase', true),
    (v_sent_pattern_id, '혼합문형',                          'SP-MIX',  19, 'Mixed Patterns', true)
  ON CONFLICT DO NOTHING;

  -- PURPOSE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, icon, is_active) VALUES
    (v_purpose_id, '서술/진술',   'P-STATE', 1, 'Statement', 'chat-bubble', true),
    (v_purpose_id, '질문',       'P-QUEST', 2, 'Question', 'question-mark', true),
    (v_purpose_id, '요청',       'P-REQ',   3, 'Request', 'hands-pray', true),
    (v_purpose_id, '명령',       'P-CMD',   4, 'Command', 'lightning', true),
    (v_purpose_id, '제안/권고',  'P-SUG',   5, 'Suggestion', 'lightbulb', true),
    (v_purpose_id, '설득',       'P-PERS',  6, 'Persuasion', 'target', true),
    (v_purpose_id, '설명',       'P-EXPL',  7, 'Explanation', 'book-open', true),
    (v_purpose_id, '인사',       'P-GREET', 8, 'Greeting', 'hand-wave', true),
    (v_purpose_id, '감사',       'P-THANK', 9, 'Gratitude', 'smile', true),
    (v_purpose_id, '사과',       'P-APOL', 10, 'Apology', 'face-sad', true),
    (v_purpose_id, '동의/반대',  'P-AGREE', 11, 'Agreement/Disagreement', 'thumb-up', true),
    (v_purpose_id, '비교',       'P-COMP', 12, 'Comparison', 'scale', true),
    (v_purpose_id, '의견 표현',  'P-OPIN', 13, 'Opinion', 'megaphone', true),
    (v_purpose_id, '감정 표현',  'P-EMOT', 14, 'Emotion', 'heart', true),
    (v_purpose_id, '경고/주의',  'P-WARN', 15, 'Warning', 'alert-triangle', true),
    (v_purpose_id, '약속',       'P-PROM', 16, 'Promise', 'handshake', true),
    (v_purpose_id, '서사/이야기', 'P-NARR', 17, 'Narration', 'pencil', true)
  ON CONFLICT DO NOTHING;

  -- TONE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, color, is_active) VALUES
    (v_tone_id, '비격식 (반말/일상)', 'TN-CASU', 1, 'Casual/Informal', '#4CAF50', true),
    (v_tone_id, '중립 (일반)',        'TN-NEUT', 2, 'Neutral', '#2196F3', true),
    (v_tone_id, '격식 (존대/공식)',   'TN-FORM', 3, 'Formal/Polite', '#9C27B0', true),
    (v_tone_id, '전문/비즈니스',      'TN-PROF', 4, 'Professional/Business', '#FF9800', true)
  ON CONFLICT DO NOTHING;

  -- SITUATION children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, icon, is_active) VALUES
    (v_situation_id, '집/가정',       'S-HOME',    1, 'Home/Family', 'home', true),
    (v_situation_id, '직장/사무실',   'S-WORK',    2, 'Workplace/Office', 'briefcase', true),
    (v_situation_id, '학교/교육',     'S-SCHOOL',  3, 'School/Education', 'graduation-cap', true),
    (v_situation_id, '여행/교통',     'S-TRAVEL',  4, 'Travel/Transportation', 'airplane', true),
    (v_situation_id, '쇼핑/상점',     'S-SHOP',    5, 'Shopping/Store', 'shopping-cart', true),
    (v_situation_id, '식당/카페',     'S-REST',    6, 'Restaurant/Cafe', 'utensils', true),
    (v_situation_id, '병원/의료',     'S-HOSP',    7, 'Hospital/Medical', 'hospital', true),
    (v_situation_id, '사교/모임',     'S-SOCIAL',  8, 'Social Gathering', 'party', true),
    (v_situation_id, '전화/온라인',   'S-PHONE',   9, 'Phone/Online', 'phone', true),
    (v_situation_id, '은행/관공서',   'S-BANK',   10, 'Bank/Government Office', 'bank', true),
    (v_situation_id, '운동/레저',     'S-SPORT',  11, 'Sports/Leisure', 'soccer', true),
    (v_situation_id, '미디어/문화',   'S-MEDIA',  12, 'Media/Culture', 'film', true),
    (v_situation_id, '자연/날씨',     'S-NATURE', 13, 'Nature/Weather', 'leaf', true),
    (v_situation_id, '일반/기타',     'S-GENERAL', 14, 'General/Others', 'pin', true)
  ON CONFLICT DO NOTHING;

  -- CHECK_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, value, description, is_active) VALUES
    (v_check_type_id, '완벽',       'PERFECT', 1, '2',    'Perfect - full score', true),
    (v_check_type_id, '대체로 맞음', 'MOSTLY',  2, '0.5',  'Mostly correct - partial score', true),
    (v_check_type_id, '놓침',       'MISSED',  3, '-1',   'Missed - penalty score', true)
  ON CONFLICT DO NOTHING;

  -- MASTERY_LEVEL children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, value, description, extra_attr_1, is_active) VALUES
    (v_mastery_level_id, '완전 익힘', 'MASTERED',       1, '10', 'Mastered - review interval 30 days', '43200', true),
    (v_mastery_level_id, '매우 익숙', 'VERY_FAMILIAR',  2, '5',  'Very Familiar - review interval 7 days', '10080', true),
    (v_mastery_level_id, '익숙',     'FAMILIAR',        3, '3',  'Familiar - review interval 1 day', '1440', true),
    (v_mastery_level_id, '약함',     'WEAK',            4, '1',  'Weak - review interval 4 hours', '240', true),
    (v_mastery_level_id, '처음',     'FIRST',           5, '0',  'First encounter - review interval 30 min', '30', true)
  ON CONFLICT DO NOTHING;

  -- DAILY_GOAL children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, extra_attr_1, is_active) VALUES
    (v_daily_goal_id, '5분',        '5MIN',       1, '5 minutes daily goal', '5', true),
    (v_daily_goal_id, '15분',       '15MIN',      2, '15 minutes daily goal', '15', true),
    (v_daily_goal_id, '30분',       '30MIN',      3, '30 minutes daily goal', '30', true),
    (v_daily_goal_id, '1시간',      '1HOUR',      4, '1 hour daily goal', '60', true),
    (v_daily_goal_id, '2시간',      '2HOUR',      5, '2 hours daily goal', '120', true),
    (v_daily_goal_id, '2시간 이상', '2HOUR_PLUS', 6, '2+ hours daily goal', '150', true)
  ON CONFLICT DO NOTHING;

  -- LANGUAGE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, description, is_active) VALUES
    (v_language_id, 'English',  'EN', 1, 'English', true),
    (v_language_id, 'Espanol',  'ES', 2, 'Spanish', true),
    (v_language_id, '中文',     'ZH', 3, 'Chinese', true),
    (v_language_id, '日本語',   'JA', 4, 'Japanese', true),
    (v_language_id, '한국어',   'KO', 5, 'Korean', true)
  ON CONFLICT DO NOTHING;

  -- NATIVE_LEVEL_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order) VALUES
    (v_native_level_id, '초급',   'BEGINNER',      1),
    (v_native_level_id, '중급',   'INTERMEDIATE',  2),
    (v_native_level_id, '고급',   'ADVANCED',      3),
    (v_native_level_id, '원어민', 'NATIVE',        4)
  ON CONFLICT DO NOTHING;

  -- TERMS_TYPE children
  INSERT INTO public.types (parent_id, type_name, type_code, display_order) VALUES
    (v_terms_type_id, '서비스이용약관',       'SERVICE_TERMS',      1),
    (v_terms_type_id, '개인정보처리방침',     'PRIVACY_POLICY',     2),
    (v_terms_type_id, '개인정보수집및이용동의', 'DATA_COLLECTION',    3),
    (v_terms_type_id, '유료서비스이용약관',   'PAID_SERVICE_TERMS', 4),
    (v_terms_type_id, '마케팅활용동의',       'MARKETING',          5)
  ON CONFLICT DO NOTHING;

  -- MOTHER_TONGUE_TYPE children (same language codes as LANGUAGE for app functionality)
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, value) VALUES
    (v_mother_tongue_id, '한국어', 'KO', 1, 'ko'),
    (v_mother_tongue_id, '영어',   'EN', 2, 'en')
  ON CONFLICT DO NOTHING;

  -- LEARNING_LANG_TYPE children (same language codes as LANGUAGE for app functionality)
  INSERT INTO public.types (parent_id, type_name, type_code, display_order, value) VALUES
    (v_learning_lang_id, '영어',     'EN', 1, 'en'),
    (v_learning_lang_id, '스페인어', 'ES', 2, 'es'),
    (v_learning_lang_id, '중국어',   'ZH', 3, 'zh'),
    (v_learning_lang_id, '일어',     'JA', 4, 'ja'),
    (v_learning_lang_id, '한국어',   'KO', 5, 'ko')
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
