import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/model/weather_data.dart';

class GlobalController extends GetxController {
  // Create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  final weatherData = WeatherData().obs;

  // instance of them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;
  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    LocationPermission locationPermission;
    bool isServiceEnable;

    isServiceEnable = await Geolocator.isLocationServiceEnabled();

    // Return if service is not enabled
    if (!isServiceEnable) {
      return Future.error("Location is not enabled");
    }

    // Check the status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever!");
    } else if (locationPermission == LocationPermission.denied) {
      // Ask for permission again
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied!");
      }
    }

    // get current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    ).then((value) {
      // update latitude & longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      // Make an API call
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
