// Database types for FlipFlip

export interface AdminUser {
  id: string;
  email: string;
  name: string | null;
  profile_image_url: string | null;
  role: 'superadmin' | 'admin' | 'editor' | 'viewer';
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Type {
  id: string;
  parent_id: string | null;
  type_name: string;
  type_code: string;
  sort_order: number;
  value: string | null;
  description: string | null;
  color: string | null;
  icon: string | null;
  extra_attr_1: string | null;
  extra_attr_2: string | null;
  extra_attr_3: string | null;
  extra_attr_4: string | null;
  extra_attr_5: string | null;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface TypeInsert {
  parent_id?: string | null;
  type_name: string;
  type_code: string;
  sort_order?: number;
  value?: string | null;
  description?: string | null;
  color?: string | null;
  icon?: string | null;
  extra_attr_1?: string | null;
  extra_attr_2?: string | null;
  extra_attr_3?: string | null;
  extra_attr_4?: string | null;
  extra_attr_5?: string | null;
  is_active?: boolean;
}

export interface Level {
  id: string;
  level_number: number;
  summary: string | null;
  description: string | null;
  native_level_type_id: string | null;
  created_at: string;
  updated_at: string;
}

export interface LevelUpdate {
  summary?: string | null;
  description?: string | null;
  native_level_type_id?: string | null;
}

export interface Skill {
  id: string;
  level_id: string;
  name: string;
  summary: string | null;
  sort_order: number;
  tense_type_id: string | null;
  purpose_type_id: string | null;
  tone_type_id: string | null;
  place_type_id: string | null;
  created_at: string;
  updated_at: string;
}

export interface SkillInsert {
  level_id: string;
  name: string;
  summary?: string | null;
  sort_order?: number;
  tense_type_id?: string | null;
  purpose_type_id?: string | null;
  tone_type_id?: string | null;
  place_type_id?: string | null;
}

export interface Sentence {
  id: string;
  skill_id: string;
  summary: string | null;
  summary_en: string | null;
  created_at: string;
  updated_at: string;
}

export interface SentenceInsert {
  skill_id: string;
  summary?: string | null;
  summary_en?: string | null;
}

export interface Expression {
  id: string;
  sentence_id: string;
  language_code: string;
  expression_text: string | null;
  hint: string | null;
  created_at: string;
  updated_at: string;
}

export interface ExpressionInsert {
  sentence_id: string;
  language_code: string;
  expression_text?: string | null;
  hint?: string | null;
}

export interface Terms {
  id: string;
  country_code: string;
  terms_type_id: string;
  version: string;
  revision_summary: string | null;
  summary: string | null;
  non_consent_notice: string | null;
  is_required: boolean;
  is_active: boolean;
  content: string | null;
  published_at: string | null;
  created_at: string;
  updated_at: string;
}

export interface TermsInsert {
  country_code: string;
  terms_type_id: string;
  version: string;
  revision_summary?: string | null;
  summary?: string | null;
  non_consent_notice?: string | null;
  is_required?: boolean;
  is_active?: boolean;
  content?: string | null;
  published_at?: string | null;
}

export interface PolicySetting {
  id: string;
  key: string;
  value: string;
  description: string | null;
  created_at: string;
  updated_at: string;
}

export interface User {
  id: string;
  auth_email: string | null;
  role: string;
  created_at: string;
  deleted_at: string | null;
  dormant_at: string | null;
  is_active: boolean;
}

export interface UserProfile {
  user_id: string;
  nickname: string | null;
  email: string | null;
  phone: string | null;
  birth_date: string | null;
  profile_image_url: string | null;
  mother_tongue: string | null;
  learning_language: string | null;
  daily_goal_type_id: string | null;
  referrer_id: string | null;
  country_code: string | null;
  current_level: number;
}

export interface Subscription {
  id: string;
  user_id: string;
  plan_type: string | null;
  status: string;
  trial_start_at: string | null;
  trial_end_at: string | null;
  current_period_start: string | null;
  current_period_end: string | null;
  payment_provider: string | null;
  external_subscription_id: string | null;
  auto_renew: boolean;
  cancelled_at: string | null;
  created_at: string;
  updated_at: string;
}

// Member = users + user_profiles + subscriptions joined
export interface Member {
  id: string;
  auth_email: string | null;
  role: string;
  is_active: boolean;
  created_at: string;
  nickname: string | null;
  email: string | null;
  phone: string | null;
  subscription_status: string | null;
}

// Supabase Database type definition
export interface Database {
  public: {
    Tables: {
      admin_users: { Row: AdminUser; Insert: Omit<AdminUser, 'id' | 'created_at' | 'updated_at'>; Update: Partial<Omit<AdminUser, 'id' | 'created_at' | 'updated_at'>> };
      types: { Row: Type; Insert: TypeInsert; Update: Partial<TypeInsert> };
      levels: { Row: Level; Insert: Omit<Level, 'id' | 'created_at' | 'updated_at'>; Update: LevelUpdate };
      skills: { Row: Skill; Insert: SkillInsert; Update: Partial<SkillInsert> };
      sentences: { Row: Sentence; Insert: SentenceInsert; Update: Partial<SentenceInsert> };
      expressions: { Row: Expression; Insert: ExpressionInsert; Update: Partial<ExpressionInsert> };
      terms: { Row: Terms; Insert: TermsInsert; Update: Partial<TermsInsert> };
      policy_settings: { Row: PolicySetting; Insert: Omit<PolicySetting, 'id' | 'created_at' | 'updated_at'>; Update: Partial<{ key: string; value: string; description: string | null }> };
      users: { Row: User };
      user_profiles: { Row: UserProfile };
      subscriptions: { Row: Subscription };
    };
  };
}
