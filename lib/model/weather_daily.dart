class WeatherDaily {
  List<Daily> daily;
  WeatherDaily({required this.daily});

  factory WeatherDaily.fromJSON(Map<String, dynamic> json) => WeatherDaily(
      daily: List<Daily>.from(json['daily'].map((e) => Daily.fromJSON(e))));
}

class Daily {
  int? dt;
  Temp? temp;

  List<Weather>? weather;

  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Daily.fromJSON(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        temp: json['temp'] == null
            ? null
            : Temp.fromJSON(json['temp'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJSON(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJSON() => {
        'dt': dt,
        'temp': temp?.toJSON(),
        'weather': weather?.map((e) => e.toJSON()).toList(),
      };
}

class Temp {
  double? day;
  int? min;
  int? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJSON(Map<String, dynamic> json) => Temp(
        day: (json['day'] as num?)?.toDouble(),
        min: (json['min'] as num?)?.round(),
        max: (json['max'] as num?)?.round(),
        night: (json['night'] as num?)?.toDouble(),
        eve: (json['eve'] as num?)?.toDouble(),
        morn: (json['morn'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJSON() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
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
