import { initLevelTest, processAnswer, type LevelTestState } from '@/lib/utils/levelTest';

describe('initLevelTest', () => {
  it('initializes with default start level', () => {
    const state = initLevelTest();
    expect(state.currentLevel).toBe(5);
    expect(state.finished).toBe(false);
    expect(state.history).toEqual([]);
    expect(state.currentQuestionIndex).toBe(0);
    expect(state.correctCount).toBe(0);
  });

  it('initializes with custom start level', () => {
    const state = initLevelTest(10);
    expect(state.currentLevel).toBe(10);
    expect(state.lowBound).toBe(10);
  });
});

describe('processAnswer', () => {
  it('increments question index for first answer', () => {
    const state = initLevelTest(1);
    const newState = processAnswer(state, true);
    expect(newState.currentQuestionIndex).toBe(1);
    expect(newState.correctCount).toBe(1);
  });

  it('increments question index for second answer', () => {
    let state = initLevelTest(1);
    state = processAnswer(state, true);
    state = processAnswer(state, false);
    expect(state.currentQuestionIndex).toBe(2);
    expect(state.correctCount).toBe(1);
  });

  it('jumps +10 levels after passing 3 questions (2/3 correct)', () => {
    let state = initLevelTest(1);
    state = { ...state, questions: Array(3) as any }; // Mock questions
    state = processAnswer(state, true);   // q1: correct
    state = processAnswer(state, true);   // q2: correct
    state = processAnswer(state, false);  // q3: wrong → passed (2/3)
    expect(state.currentLevel).toBe(11);
    expect(state.currentQuestionIndex).toBe(0);
    expect(state.correctCount).toBe(0);
  });

  it('goes down after failing (0/3 correct)', () => {
    let state = initLevelTest(1);
    // Simulate having passed level 1 and jumped to 11
    state = { ...state, currentLevel: 11, lowBound: 1, highBound: 100, history: [{ level: 1, passed: true }] };
    state = processAnswer(state, false);
    state = processAnswer(state, false);
    state = processAnswer(state, false);
    // Failed at 11, should go to midpoint between 1 and 11
    expect(state.currentLevel).toBe(6);
  });

  it('finishes when range is narrow', () => {
    let state: LevelTestState = {
      currentLevel: 5,
      questions: Array(3) as any,
      currentQuestionIndex: 0,
      correctCount: 0,
      history: [
        { level: 1, passed: true },
        { level: 11, passed: false },
        { level: 6, passed: false },
        { level: 3, passed: true },
        { level: 4, passed: true },
      ],
      lowBound: 4,
      highBound: 6,
      finished: false,
      finalLevel: 4,
    };

    // Answer all wrong
    state = processAnswer(state, false);
    state = processAnswer(state, false);
    state = processAnswer(state, false);

    expect(state.finished).toBe(true);
    expect(state.finalLevel).toBe(4);
  });
});
