import { createAction } from 'redux-actions';

export const setGlobalError = createAction('SET_GLOBAL_ERROR', (payload) => {
  return { error: payload };
});

export const clearGlobalError = createAction('CLEAR_GLOBAL_ERROR', () => {
  return {};
});
