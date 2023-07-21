// instance for getting the api response
class WeatherCurrent {
  final Current current;

  WeatherCurrent({required this.current});

  factory WeatherCurrent.fromJSON(Map<String, dynamic> json) {
    return WeatherCurrent(current: Current.fromJson(json['current']));
  }
}

class Current {
  int? temp;
  int? humidity;
  double? uvIndex;
  double? feelsLike;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.uvIndex,
    this.feelsLike,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        feelsLike: (json['feels_like'] as num).toDouble(),
        uvIndex: (json['uvi'] as num).toDouble(),
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJSON(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'feels_like': feelsLike,
        'uvi': uvIndex,
        'weather': weather?.map((e) => e.toJSON()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJSON() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
