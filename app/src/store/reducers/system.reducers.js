import { handleActions } from 'redux-actions';

export const SystemReducers = handleActions({

  SET_GLOBAL_ERROR: {
    next: (state, action) => {
      return {
        ...state,
        error: action.payload.error,
      };
    },
    throw: (state, action) => ({}),
  },

  CLEAR_GLOBAL_ERROR: {
    next: (state, action) => {
      return {
        ...state,
        error: null,
      };
    },
    throw: (state, action) => ({}),
  },
}, {
  error: null,
});
