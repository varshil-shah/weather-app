import 'package:weather_app/model/weather_current.dart';
import 'package:weather_app/model/weather_daily.dart';
import 'package:weather_app/model/weather_hourly.dart';

class WeatherData {
  final WeatherCurrent? current;
  final WeatherHourly? hourly;
  final WeatherDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherCurrent getCurrentWeather() => current!;
  WeatherHourly getHourlyWeather() => hourly!;
  WeatherDaily getDailyWeather() => daily!;
}
