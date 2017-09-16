import { combineReducers } from 'redux';
import { SystemReducers } from './system.reducers';

export const combinedReducers = combineReducers({
  system: SystemReducers,
});
