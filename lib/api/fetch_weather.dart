import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_current.dart';

class FetchWeatherAPI {
  WeatherData? weather;

  // processing the data from json => toJSON
  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    var jsonString = jsonDecode(response.body);
    weather = WeatherData(WeatherCurrent.fromJSON(jsonString));
    return weather!;
  }
}

String apiUrl(lat, long) {
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  return url;
}
