const { withSentryConfig } = require('@sentry/nextjs');

/** @type {import('next').NextConfig} */
const nextConfig = {
  transpilePackages: [],
};

module.exports = withSentryConfig(nextConfig, {
  silent: true,
  disableServerWebpackPlugin: true,
  disableClientWebpackPlugin: true,
});
