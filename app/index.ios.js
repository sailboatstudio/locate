/*******
 * Created by Jeremy, on 09/14/17
 * 
 * Connects Redux Store to the base app component and registers the JS Project.
 */


import React, { Component } from 'react';
import { AppRegistry, AsyncStorage } from 'react-native';

import { connect, Provider } from 'react-redux';
import { applyMiddleware, compose, createStore } from 'redux';
import { createLogger } from 'redux-logger';
import { autoRehydrate, persistStore } from 'redux-persist';

import { combinedReducers } from './src/store/reducers';

import { Locate } from './src/App';

const loggerMiddleware = createLogger();

const store = createStore(
  combinedReducers,
  compose(
    applyMiddleware(
      loggerMiddleware,
    ),
    autoRehydrate(),
  ),
);

persistStore(store, { storage: AsyncStorage });

const mapStateToProps = (state) => ( console.log('state', state), {
  system: state.system,
});

const AppWithNavigationState = connect(mapStateToProps)(Locate);

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <AppWithNavigationState />
      </Provider>
    )
  }
}

AppRegistry.registerComponent('Locate', () => App);
