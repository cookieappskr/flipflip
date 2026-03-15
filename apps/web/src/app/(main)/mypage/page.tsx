'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { useTheme } from '@/components/layout/ThemeProvider';
import Button from '@/components/core/Button';
import Input from '@/components/core/Input';
import Toggle from '@/components/core/Toggle';
import type { UserProfile, Subscription, Type } from '@/types/database';

export default function MyPage() {
  const router = useRouter();
  const supabase = createClient();
  const { theme, toggleTheme } = useTheme();
  const [profile, setProfile] = useState<UserProfile | null>(null);
  const [subscription, setSubscription] = useState<Subscription | null>(null);
  const [dailyGoalTypes, setDailyGoalTypes] = useState<Type[]>([]);
  const [editing, setEditing] = useState(false);
  const [nickname, setNickname] = useState('');
  const [email, setEmail] = useState('');
  const [selectedGoal, setSelectedGoal] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;

      const [profileRes, subRes] = await Promise.all([
        supabase.from('user_profiles').select('*').eq('user_id', user.id).single(),
        supabase.from('subscriptions').select('*').eq('user_id', user.id).order('created_at', { ascending: false }).limit(1).single(),
      ]);

      if (profileRes.data) {
        setProfile(profileRes.data);
        setNickname(profileRes.data.nickname || '');
        setEmail(profileRes.data.email || '');
        setSelectedGoal(profileRes.data.daily_goal_type_id || '');
      }
      if (subRes.data) setSubscription(subRes.data);

      // Load daily goal types
      const { data: parent } = await supabase
        .from('types')
        .select('id')
        .eq('type_code', 'DAILY_GOAL')
        .is('parent_id', null)
        .single();

      if (parent) {
        const { data: goals } = await supabase
          .from('types')
          .select('*')
          .eq('parent_id', parent.id)
          .eq('is_active', true)
          .order('display_order');

        setDailyGoalTypes(goals || []);
      }
    };

    fetchData();
  }, []);

  const handleSave = async () => {
    setSaving(true);
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;

    await supabase
      .from('user_profiles')
      .update({
        nickname,
        email,
        daily_goal_type_id: selectedGoal || null,
      })
      .eq('user_id', user.id);

    setProfile((prev) => prev ? { ...prev, nickname, email, daily_goal_type_id: selectedGoal } : null);
    setEditing(false);
    setSaving(false);
  };

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    router.push('/login');
  };

  const subscriptionLabel = subscription
    ? subscription.status === 'trial'
      ? `무료체험 (${subscription.trial_end_at ? new Date(subscription.trial_end_at).toLocaleDateString('ko-KR') : ''} 까지)`
      : subscription.status === 'active'
      ? '구독 중'
      : '만료'
    : '없음';

  return (
    <div className="max-w-lg mx-auto px-4 py-6">
      <h1 className="text-xl font-bold text-text-primary mb-6">마이페이지</h1>

      {/* Profile Section */}
      <div className="bg-surface rounded-2xl shadow-sm p-6 mb-4">
        <div className="flex items-center gap-4 mb-4">
          <div className="w-14 h-14 rounded-full bg-primary-100 flex items-center justify-center">
            <span className="text-xl font-bold text-primary-600">
              {(profile?.nickname || '?')[0]}
            </span>
          </div>
          <div>
            <h2 className="text-lg font-semibold text-text-primary">{profile?.nickname}</h2>
            <p className="text-sm text-text-secondary">{profile?.email}</p>
          </div>
        </div>

        {editing ? (
          <div className="space-y-3">
            <Input label="닉네임" value={nickname} onChange={(e) => setNickname(e.target.value)} />
            <Input label="이메일" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />

            <div>
              <label className="block text-sm font-medium text-text-primary mb-1">일학습목표시간</label>
              <div className="grid grid-cols-3 gap-2">
                {dailyGoalTypes.map((g) => (
                  <button
                    key={g.id}
                    onClick={() => setSelectedGoal(g.id)}
                    className={[
                      'py-2 rounded-lg text-sm font-medium border transition-colors',
                      g.id === selectedGoal
                        ? 'border-primary-600 bg-primary-50 text-primary-700'
                        : 'border-border text-text-secondary hover:border-primary-300',
                    ].join(' ')}
                  >
                    {g.type_name}
                  </button>
                ))}
              </div>
            </div>

            <div className="flex gap-2">
              <Button className="flex-1" loading={saving} onClick={handleSave}>저장</Button>
              <Button className="flex-1" variant="secondary" onClick={() => setEditing(false)}>취소</Button>
            </div>
          </div>
        ) : (
          <Button variant="secondary" className="w-full" onClick={() => setEditing(true)}>
            프로필 수정
          </Button>
        )}
      </div>

      {/* Info Cards */}
      <div className="space-y-3">
        <div className="bg-surface rounded-2xl shadow-sm p-4 flex items-center justify-between">
          <div>
            <p className="text-sm font-medium text-text-primary">현재 레벨</p>
            <p className="text-lg font-bold text-primary-600">Level {profile?.current_level || 1}</p>
          </div>
        </div>

        <div className="bg-surface rounded-2xl shadow-sm p-4 flex items-center justify-between">
          <div>
            <p className="text-sm font-medium text-text-primary">구독 상태</p>
            <p className="text-sm text-text-secondary">{subscriptionLabel}</p>
          </div>
          <Button variant="secondary" size="sm" onClick={() => router.push('/pricing')}>
            플랜 보기
          </Button>
        </div>

        <div className="bg-surface rounded-2xl shadow-sm p-4 flex items-center justify-between">
          <span className="text-sm font-medium text-text-primary">다크 모드</span>
          <Toggle checked={theme === 'dark'} onChange={toggleTheme} />
        </div>

        <button
          onClick={handleSignOut}
          className="w-full bg-surface rounded-2xl shadow-sm p-4 text-left text-sm text-error font-medium hover:bg-error/5 transition-colors"
        >
          로그아웃
        </button>
      </div>
    </div>
  );
}
