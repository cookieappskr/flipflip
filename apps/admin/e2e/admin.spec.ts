import { test, expect } from '@playwright/test';

test.describe('Admin App', () => {
  test('login page loads', async ({ page }) => {
    await page.goto('/login');
    await expect(page.getByText('FlipFlip')).toBeVisible();
    await expect(page.getByText('Google로 로그인')).toBeVisible();
  });

  test('unauthenticated user redirected to login', async ({ page }) => {
    await page.goto('/types');
    await expect(page).toHaveURL(/\/login/);
  });

  test('login page shows error for unauthorized', async ({ page }) => {
    await page.goto('/login?error=unauthorized');
    await expect(page.getByText('접근 권한이 없습니다')).toBeVisible();
  });

  test('minimum viewport width 1280px renders properly', async ({ page }) => {
    await page.setViewportSize({ width: 1280, height: 720 });
    await page.goto('/login');
    await expect(page.getByText('FlipFlip')).toBeVisible();
  });
});
