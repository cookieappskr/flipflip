// Database types for FlipFlip Web App

export interface Type {
  id: string;
  parent_id: string | null;
  type_name: string;
  type_code: string;
  display_order: number;
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

export interface Level {
  id: string;
  level_number: number;
  level_summary: string | null;
  description: string | null;
  native_level_type_id: string | null;
  created_at: string;
  updated_at: string;
}

export interface Skill {
  id: string;
  level_id: string;
  skill_name: string;
  skill_summary: string | null;
  display_order: number;
  tense_type_code: string | null;
  pattern_type_code: string | null;
  created_at: string;
  updated_at: string;
}

export interface Sentence {
  id: string;
  skill_id: string;
  meaning: string | null;
  sentence_type: string;
  base_sentence_id: string | null;
  created_at: string;
  updated_at: string;
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

export interface UserLearningProgress {
  id: string;
  user_id: string;
  skill_id: string;
  achievement_score: number;
  is_cleared: boolean;
  cleared_at: string | null;
  created_at: string;
  updated_at: string;
}

export interface UserSentenceScore {
  id: string;
  user_id: string;
  sentence_id: string;
  accumulated_score: number;
  mastery_level_type_id: string | null;
  mastery_score: number;
  next_review_at: string | null;
  last_checked_at: string | null;
  check_count: number;
  created_at: string;
  updated_at: string;
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

export interface PolicySetting {
  id: string;
  key: string;
  value: string;
  description: string | null;
  created_at: string;
  updated_at: string;
}

export interface MileageTransaction {
  id: string;
  user_id: string;
  amount: number;
  balance_after: number;
  transaction_type: string | null;
  description: string | null;
  created_at: string;
  updated_at: string;
}

// Check type values
export type CheckType = 'PERFECT' | 'MOSTLY' | 'MISSED';

// Mastery level codes
export type MasteryLevelCode = 'FIRST_MEMORIZE' | 'WEAK' | 'FAMILIAR' | 'VERY_FAMILIAR' | 'PERFECT_MASTERY';

// Learning card — joined data for UI
export interface LearningCard {
  sentence_id: string;
  meaning: string;        // meaning field from sentence
  expression: string;     // expression_text in learning_language
  hint: string | null;
  skill_name: string;
  skill_id: string;
  tense_type_code?: string | null;
  pattern_type_code?: string | null;
  is_review: boolean;
  current_score: number;
  mastery_level_code: string | null;
}

// Score result from API
export interface ScoreResult {
  accumulated_score: number;
  mastery_level_type_id: string;
  mastery_level_code: string;
  mastery_score: number;
  next_review_at: string;
  skill_achievement_score: number;
  skill_total_score: number;
  skill_up: boolean;
  level_up: boolean;
  new_level: number | null;
}
