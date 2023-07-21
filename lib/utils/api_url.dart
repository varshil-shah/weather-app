import 'package:weather_app/api/api_key.dart';

String apiUrl(lat, long) {
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  return url;
}
