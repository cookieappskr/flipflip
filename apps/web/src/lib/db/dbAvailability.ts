let cachedResult: boolean | null = null;

/**
 * Check if IndexedDB is available in the current environment.
 * Returns false for SSR, workers without IndexedDB, or private browsing modes
 * that block IndexedDB.
 */
export async function isLocalDbAvailable(): Promise<boolean> {
  if (cachedResult !== null) return cachedResult;

  try {
    if (typeof window === 'undefined' || !window.indexedDB) {
      cachedResult = false;
      return false;
    }

    // Actually try to open a test database to catch private browsing blocks
    const testDb = window.indexedDB.open('__flipflip_test__');
    await new Promise<void>((resolve, reject) => {
      testDb.onsuccess = () => {
        testDb.result.close();
        window.indexedDB.deleteDatabase('__flipflip_test__');
        resolve();
      };
      testDb.onerror = () => reject(testDb.error);
    });

    cachedResult = true;
    return true;
  } catch {
    cachedResult = false;
    return false;
  }
}
