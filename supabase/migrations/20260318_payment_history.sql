-- payment_history table
CREATE TABLE IF NOT EXISTS public.payment_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  subscription_id UUID REFERENCES public.subscriptions(id) ON DELETE SET NULL,
  payment_key TEXT,
  order_id TEXT UNIQUE NOT NULL,
  amount INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  payment_provider TEXT DEFAULT 'toss',
  billing_key TEXT,
  receipt_url TEXT,
  failure_reason TEXT,
  refunded_amount INTEGER DEFAULT 0,
  refunded_at TIMESTAMPTZ,
  paid_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE public.payment_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "payment_history_select_own" ON public.payment_history
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "payment_history_manage_service" ON public.payment_history
  FOR ALL USING (auth.role() = 'service_role');

CREATE TRIGGER on_payment_history_updated BEFORE UPDATE ON public.payment_history
  FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();

-- Add columns to subscriptions
ALTER TABLE public.subscriptions ADD COLUMN IF NOT EXISTS billing_key TEXT;
ALTER TABLE public.subscriptions ADD COLUMN IF NOT EXISTS next_billing_date TIMESTAMPTZ;
ALTER TABLE public.subscriptions ADD COLUMN IF NOT EXISTS last_payment_id UUID REFERENCES public.payment_history(id);
