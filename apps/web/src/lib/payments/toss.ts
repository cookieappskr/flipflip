const TOSS_API_URL = 'https://api.tosspayments.com/v1';

function getAuthHeader(): string {
  const secretKey = process.env.TOSS_SECRET_KEY!;
  const encoded = Buffer.from(`${secretKey}:`).toString('base64');
  return `Basic ${encoded}`;
}

interface BillingKeyResponse {
  billingKey: string;
  customerKey: string;
  authenticatedAt: string;
  method: string;
  cardCompany: string;
  cardNumber: string;
}

interface BillingPaymentResponse {
  paymentKey: string;
  orderId: string;
  status: string;
  receipt?: { url: string };
  totalAmount: number;
  method: string;
}

interface CancelResponse {
  paymentKey: string;
  cancelAmount: number;
  cancelReason: string;
  canceledAt: string;
}

export async function issueBillingKey(
  authKey: string,
  customerKey: string,
): Promise<BillingKeyResponse> {
  const res = await fetch(`${TOSS_API_URL}/billing/authorizations/issue`, {
    method: 'POST',
    headers: {
      Authorization: getAuthHeader(),
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ authKey, customerKey }),
  });

  if (!res.ok) {
    const error = await res.json();
    throw new Error(error.message || 'Failed to issue billing key');
  }

  return res.json();
}

export async function executeBillingPayment(params: {
  billingKey: string;
  customerKey: string;
  orderId: string;
  amount: number;
  orderName: string;
}): Promise<BillingPaymentResponse> {
  const res = await fetch(`${TOSS_API_URL}/billing/${params.billingKey}`, {
    method: 'POST',
    headers: {
      Authorization: getAuthHeader(),
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      customerKey: params.customerKey,
      orderId: params.orderId,
      amount: params.amount,
      orderName: params.orderName,
    }),
  });

  if (!res.ok) {
    const error = await res.json();
    throw new Error(error.message || 'Payment failed');
  }

  return res.json();
}

export async function cancelPayment(
  paymentKey: string,
  cancelReason: string,
  cancelAmount?: number,
): Promise<CancelResponse> {
  const body: Record<string, unknown> = { cancelReason };
  if (cancelAmount != null) body.cancelAmount = cancelAmount;

  const res = await fetch(`${TOSS_API_URL}/payments/${paymentKey}/cancel`, {
    method: 'POST',
    headers: {
      Authorization: getAuthHeader(),
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    const error = await res.json();
    throw new Error(error.message || 'Cancel failed');
  }

  return res.json();
}
