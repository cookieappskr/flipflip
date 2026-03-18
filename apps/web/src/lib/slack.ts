type AlertLevel = 'info' | 'warning' | 'error';

const LEVEL_EMOJI: Record<AlertLevel, string> = {
  info: ':information_source:',
  warning: ':warning:',
  error: ':rotating_light:',
};

const LEVEL_COLOR: Record<AlertLevel, string> = {
  info: '#2563eb',
  warning: '#d97706',
  error: '#dc2626',
};

/**
 * Send an alert to the FlipFlip Slack channel.
 * Fails silently in development or when no webhook is configured.
 */
export async function sendSlackAlert(
  message: string,
  level: AlertLevel = 'info',
  details?: Record<string, string>
): Promise<void> {
  const webhookUrl = process.env.SLACK_WEBHOOK_URL;
  if (!webhookUrl) return;

  const fields = details
    ? Object.entries(details).map(([title, value]) => ({
        type: 'mrkdwn' as const,
        text: `*${title}*\n${value}`,
      }))
    : [];

  const payload = {
    blocks: [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `${LEVEL_EMOJI[level]} *[FlipFlip Web]* ${message}`,
        },
      },
      ...(fields.length > 0
        ? [{ type: 'section', fields }]
        : []),
      {
        type: 'context',
        elements: [
          {
            type: 'mrkdwn',
            text: `${new Date().toISOString()} | ${process.env.NODE_ENV || 'development'}`,
          },
        ],
      },
    ],
  };

  try {
    await fetch(webhookUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });
  } catch {
    // Slack alert should never break the app
  }
}
