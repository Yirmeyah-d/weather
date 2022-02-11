import 'package:weather/src/features/weather/domain/entities/main_weather.dart';

class MainWeatherModel extends MainWeather {
  const MainWeatherModel({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
        );

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherModel(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}
