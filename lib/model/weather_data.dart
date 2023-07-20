import 'package:weather_app/model/weather_current.dart';

class WeatherData {
  final WeatherCurrent? current;

  WeatherData([this.current]);

  WeatherCurrent getCurrentWeather() => current!;
}
