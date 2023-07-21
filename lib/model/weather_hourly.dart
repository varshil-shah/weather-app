class WeatherHourly {
  List<Hourly> hourly;
  WeatherHourly({required this.hourly});

  factory WeatherHourly.fromJSON(Map<String, dynamic> json) => WeatherHourly(
      hourly: List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJSON(e))));
}

class Hourly {
  int? dt;
  int? temp;

  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Hourly.fromJSON(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJSON(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJSON() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJSON()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // from json
  factory Weather.fromJSON(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
