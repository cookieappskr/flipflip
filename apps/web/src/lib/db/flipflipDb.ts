import Dexie, { type Table } from 'dexie';
import type {
  Level,
  Skill,
  Sentence,
  Expression,
  Type,
  PolicySetting,
  UserSentenceScore,
  UserLearningProgress,
  UserProfile,
} from '@/types/database';
import type { SyncQueueEntry, DownloadStatusEntry } from '@/types/localDb';

class FlipFlipDB extends Dexie {
  levels!: Table<Level, string>;
  skills!: Table<Skill, string>;
  sentences!: Table<Sentence, string>;
  expressions!: Table<Expression, string>;
  types!: Table<Type, string>;
  policySettings!: Table<PolicySetting, string>;
  userSentenceScores!: Table<UserSentenceScore, string>;
  userLearningProgress!: Table<UserLearningProgress, string>;
  userProfiles!: Table<UserProfile, string>;
  syncQueue!: Table<SyncQueueEntry, number>;
  downloadStatus!: Table<DownloadStatusEntry, [number, string]>;

  constructor() {
    super('flipflip');
    this.version(1).stores({
      levels: '&id, level_number',
      skills: '&id, level_id, display_order',
      sentences: '&id, skill_id',
      expressions: '&id, sentence_id, [sentence_id+language_code]',
      types: '&id, type_code, parent_id',
      policySettings: '&id, key',
      userSentenceScores: '&id, [user_id+sentence_id], sentence_id, next_review_at',
      userLearningProgress: '&id, [user_id+skill_id], user_id',
      userProfiles: '&user_id',
      syncQueue: '++id, table_name, status, created_at',
      downloadStatus: '&[level_number+skill_id], level_number, status',
    });

    // v2: 기존 사용자 브라우저의 누락된 object store 생성을 위한 업그레이드 트리거
    this.version(2).stores({});
  }
}

export const db = new FlipFlipDB();
