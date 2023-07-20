import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // Create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // instance of them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

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

    debugPrint("Latitude: $_lattitude");
    debugPrint("Longitude: $_longitude");

    // get current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    ).then((value) {
      // update latitude & longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}
