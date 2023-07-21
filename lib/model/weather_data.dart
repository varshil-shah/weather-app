import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/model/weather_hourly.dart';

class WeatherData {
  final WeatherCurrent? current;
  final WeatherHourly? hourly;

  WeatherData([this.current, this.hourly]);

  WeatherCurrent getCurrentWeather() => current!;
  WeatherHourly getHourlyWeather() => hourly!;
}
