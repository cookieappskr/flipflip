// Binary search level test algorithm

export interface LevelTestQuestion {
  sentence_id: string;
  meaning: string;
  expression: string;
  hint: string | null;
  level_number: number;
}

export interface LevelTestState {
  currentLevel: number;
  questions: LevelTestQuestion[];
  currentQuestionIndex: number;
  correctCount: number;
  history: { level: number; passed: boolean }[];
  lowBound: number;
  highBound: number;
  finished: boolean;
  finalLevel: number;
}

const QUESTIONS_PER_LEVEL = 3;
const PASS_THRESHOLD = 2;
const JUMP_SIZE = 10;

export function initLevelTest(startLevel: number = 5): LevelTestState {
  return {
    currentLevel: startLevel,
    questions: [],
    currentQuestionIndex: 0,
    correctCount: 0,
    history: [],
    lowBound: startLevel,
    highBound: 100,
    finished: false,
    finalLevel: startLevel,
  };
}

export function processAnswer(
  state: LevelTestState,
  correct: boolean // PERFECT or MOSTLY = true, MISSED = false
): LevelTestState {
  const newCorrectCount = state.correctCount + (correct ? 1 : 0);
  const newQuestionIndex = state.currentQuestionIndex + 1;

  // Not done with current level's questions yet
  if (newQuestionIndex < QUESTIONS_PER_LEVEL) {
    return {
      ...state,
      currentQuestionIndex: newQuestionIndex,
      correctCount: newCorrectCount,
    };
  }

  // Done with current level — determine pass/fail
  const passed = newCorrectCount >= PASS_THRESHOLD;

  const newHistory = [...state.history, { level: state.currentLevel, passed }];

  let newLowBound = state.lowBound;
  let newHighBound = state.highBound;
  let nextLevel: number;

  if (passed) {
    // Record this as new low bound
    newLowBound = state.currentLevel;
    nextLevel = Math.min(state.currentLevel + JUMP_SIZE, 100);

    // If we've already tested higher and failed, use binary search
    if (state.highBound < 100 || newHistory.some((h) => !h.passed && h.level > state.currentLevel)) {
      const failedAbove = newHistory
        .filter((h) => !h.passed && h.level > state.currentLevel)
        .map((h) => h.level);
      if (failedAbove.length > 0) {
        newHighBound = Math.min(...failedAbove);
        nextLevel = Math.floor((newLowBound + newHighBound) / 2);
      }
    }
  } else {
    // Failed — set high bound
    newHighBound = state.currentLevel;
    const passedBelow = newHistory
      .filter((h) => h.passed)
      .map((h) => h.level);
    if (passedBelow.length > 0) {
      newLowBound = Math.max(...passedBelow);
    }
    nextLevel = Math.floor((newLowBound + newHighBound) / 2);
  }

  // Check if range is narrow enough to finish
  const rangeSize = newHighBound - newLowBound;
  if (rangeSize <= 1 || nextLevel === state.currentLevel || newHistory.length >= 10) {
    return {
      ...state,
      correctCount: newCorrectCount,
      currentQuestionIndex: newQuestionIndex,
      history: newHistory,
      lowBound: newLowBound,
      highBound: newHighBound,
      finished: true,
      finalLevel: newLowBound,
    };
  }

  // Clamp nextLevel
  nextLevel = Math.max(1, Math.min(100, nextLevel));

  return {
    ...state,
    currentLevel: nextLevel,
    questions: [], // Will be loaded
    currentQuestionIndex: 0,
    correctCount: 0,
    history: newHistory,
    lowBound: newLowBound,
    highBound: newHighBound,
    finished: false,
    finalLevel: newLowBound,
  };
}
