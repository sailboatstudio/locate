import React, { Component } from 'react';
import { Alert, AsyncStorage, StatusBar, StyleSheet, Text, View } from 'react-native';
import { StackNavigator } from 'react-navigation';

import { MapScreen } from './screens/Map.screen';

// NAVIGATOR
const BaseAppNavigator = StackNavigator({
  map: {
    screen: MapScreen,
    navigationOptions: {
      header: null,
    },
  },
})

// BASE APPLICATION

export class Locate extends Component {
  componentDidUpdate(oldProps) {
    this.globalError(oldProps, this.props);
  }

  globalError(oldProps, newProps) {
    if (newProps.system.error && newProps.system.error !== oldProps.system.error) {
      Alert.alert(
        'Something went wrong',
        newProps.system.error,
        [
          { text: 'Okay', onPress: () => newProps.dispatch(clearGlobalError()) },
        ],
      );
    }
  }

  render() {
    return (
      <View style={{ flex: 1 }}>
        <StatusBar
          backgroundColor="#080808"
          barStyle="light-content"
        />
        <BaseAppNavigator screenProps={{
          dispatch: this.props.dispatch,
          system: this.props.system,
        }} />
      </View>
    );
  }
}
