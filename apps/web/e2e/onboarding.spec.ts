import { test, expect } from '@playwright/test';

test.describe('Onboarding', () => {
  test('shows onboarding slides and navigates to login', async ({ page }) => {
    await page.goto('/onboarding');
    await expect(page.getByText('카드를 넘기며 학습해요')).toBeVisible();

    // Click through slides
    await page.getByRole('button', { name: '다음' }).click();
    await expect(page.getByText('스마트한 복습 시스템')).toBeVisible();

    await page.getByRole('button', { name: '다음' }).click();
    await expect(page.getByText('체계적인 레벨 시스템')).toBeVisible();

    await page.getByRole('button', { name: '다음' }).click();
    await expect(page.getByText('하루 5분이면 충분해요')).toBeVisible();

    // Final slide has "시작하기" button
    await page.getByRole('button', { name: '시작하기' }).click();

    // Should navigate to login
    await expect(page).toHaveURL(/\/login/);
  });

  test('can skip onboarding', async ({ page }) => {
    await page.goto('/onboarding');
    await page.getByText('건너뛰기').click();
    await expect(page).toHaveURL(/\/login/);
  });
});

test.describe('Login', () => {
  test('shows login page with Google button', async ({ page }) => {
    await page.goto('/login');
    await expect(page.getByText('FlipFlip')).toBeVisible();
    await expect(page.getByText('Google로 시작하기')).toBeVisible();
  });
});
