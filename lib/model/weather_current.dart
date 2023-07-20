// instance for getting the api response
class WeatherCurrent {
  final Current current;

  WeatherCurrent({required this.current});

  factory WeatherCurrent.fromJSON(Map<String, dynamic> json) {
    return WeatherCurrent(current: Current.fromJson(json['current']));
  }
}

class Current {
  double? temp;
  int? humidity;
  double? uvi;
  int? clouds;
  double? windSpeed;

  Current({
    this.temp,
    this.humidity,
    this.uvi,
    this.clouds,
    this.windSpeed,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'uvi': uvi,
        'clouds': clouds,
        'wind_speed': windSpeed,
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
