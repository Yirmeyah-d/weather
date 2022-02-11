import 'package:weather/src/features/weather/data/models/coord_model.dart';
import 'package:weather/src/features/weather/data/models/sys_model.dart';
import 'package:weather/src/features/weather/data/models/weather_model.dart';
import 'package:weather/src/features/weather/data/models/wind_model.dart';
import 'package:weather/src/features/weather/domain/entities/current_weather_data.dart';

import 'clouds_model.dart';
import 'main_weather_model.dart';

class CurrentWeatherDataModel extends CurrentWeatherData {
  const CurrentWeatherDataModel({
    required CoordModel coord,
    required List<WeatherModel> weather,
    required String base,
    required MainWeatherModel main,
    required int visibility,
    required WindModel wind,
    required CloudsModel clouds,
    required int dt,
    required SysModel sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) : super(
          coord: coord,
          weather: weather,
          base: base,
          main: main,
          visibility: visibility,
          wind: wind,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          id: id,
          name: name,
          cod: cod,
        );

  factory CurrentWeatherDataModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDataModel(
      coord: CoordModel.fromJson(json['coord']),
      weather: (json['weather'] as List)
              ?.map((w) => WeatherModel.fromJson(w))
              ?.toList() ??
          List.empty(),
      base: json['base'],
      main: MainWeatherModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      clouds: CloudsModel.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord,
      'weather': weather,
      'base': base,
      'main': main,
      'visibility': visibility,
      'wind': wind,
      'clouds': clouds,
      'dt': dt,
      'sys': sys,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }
}
