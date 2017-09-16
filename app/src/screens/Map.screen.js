import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import LinearGradient from 'react-native-linear-gradient';

import MapView from 'react-native-maps';

export class MapScreen extends Component {
  constructor(props) {
    super(props);

    this.state = {
      region: {
        latitude: 49.2827,
        longitude: -123.1207,
        latitudeDelta: 0.5,
        longitudeDelta: 0.5,
        // latitudeDelta: 0.005,
        // longitudeDelta: 0.005,
      },
      userLocation: {
        latitude: 49.2827,
        longitude: -123.1207,
      }
    }

    this.renderHeader = this.renderHeader.bind(this);
    this.renderUserMarker = this.renderUserMarker.bind(this);
  }
  
  onRegionChange(region) {
    const newState = { region };
    this.state = {
      ...this.state,
      ...newState
    };
  }

  onUserLocationChange(location) {
    const newState = { userLocation: location.coords };
    this.state = {
      ...this.state,
      ...newState
    };

    console.log('locationChange', this.state);
  }

  renderUserMarker() {
    navigator.geolocation.requestAuthorization();
    navigator.geolocation.getCurrentPosition(this.onUserLocationChange);

    return (
      <View>
        <MapView.Circle
          center={{
            latitude: this.state.userLocation.latitude,
            longitude: this.state.userLocation.longitude,
          }}
          radius={50}
          strokeWidth={1}
          strokeColor={'rgba(255,255,255,0.5)'}
          fillColor={'rgba(102,0,255,0.3)'}
        />
        <MapView.Circle
          center={{
            latitude: this.state.userLocation.latitude,
            longitude: this.state.userLocation.longitude,
          }}
          radius={7}
          strokeWidth={2}
          strokeColor={'#fff'}
          fillColor={'rgba(102,0,255,1)'}
        />
      </View>
    )
  }

  renderHeader() {
    return (
      <LinearGradient colors={['rgba(28,28,28,1)', 'rgba(28,28,28,0)']} style={styles.headerWrapper}>
        <Text style={styles.headerText}>Locate</Text>
      </LinearGradient>
    )
  }

  render() {
    return (
      <View style={{flex: 1}}>
        <MapView
          style={{flex: 1}}
          region={this.state.region}
          onRegionChange={this.onRegionChange}
          showsUserLocation={true}
          showsMyLocationButton={true}
        >

          <MapView.UrlTile urlTemplate={'https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaWFtamJlY2tlciIsImEiOiJjajdsaDA1ZDAya2oxMnhseHNhcWt1YzByIn0.YYts0doYZLyZUSLiSYW0aw'} />
          
          { /* this.renderUserMarker() */ }
          { this.renderHeader() }
        </MapView>

      </View>
    );
  }
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  headerWrapper: {
    height: 150,
    paddingBottom: 50,
    backgroundColor: 'transparent',
    alignItems: 'center',
    justifyContent: 'center',
  },
  headerText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 15,
  },
});
