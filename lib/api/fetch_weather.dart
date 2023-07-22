import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/model/weather_daily.dart';

import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/model/weather_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weather;
  final RxBool _isApiKeysValid = false.obs;

  // processing the data from json => toJSON
  Future<WeatherData?> processData(lat, long) async {
    for (var apiKey in apiKeys) {
      var response = await http.get(Uri.parse(apiUrl(lat, long, apiKey)));
      if (response.statusCode != 200) continue;
      var jsonString = jsonDecode(response.body);
      weather = WeatherData(
        WeatherCurrent.fromJSON(jsonString),
        WeatherHourly.fromJSON(jsonString),
        WeatherDaily.fromJSON(jsonString),
      );
      _isApiKeysValid.value = true;
      debugPrint("API_KEY: $apiKey");
      return weather!;
    }

    if (_isApiKeysValid.isFalse) {
      Get.snackbar(
        'API',
        'API is currently work not working\nPlease try again later!',
        duration: const Duration(seconds: 5),
      );
    }
    return null;
  }
}
