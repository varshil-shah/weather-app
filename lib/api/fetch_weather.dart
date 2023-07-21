import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_daily.dart';

import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/model/weather_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weather;

  // processing the data from json => toJSON
  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    var jsonString = jsonDecode(response.body);
    weather = WeatherData(
      WeatherCurrent.fromJSON(jsonString),
      WeatherHourly.fromJSON(jsonString),
      WeatherDaily.fromJSON(jsonString),
    );
    return weather!;
  }
}
