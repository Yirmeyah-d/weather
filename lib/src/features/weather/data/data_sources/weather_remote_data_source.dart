import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather/src/features/weather/data/models/current_weather_data_model.dart';

import '../../../../core/error/exceptions.dart';
import '../models/five_days_three_hours_data_model.dart';
import 'package:weather/src/core/env/sk.dart';

abstract class WeatherRemoteDataSource {
  /// Calls the $baseUrl/weather?q=$city&lang=en&$apiKey endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String city);

  /// Calls the $baseUrl/forecast?q=$city&lang=en&$apiKey endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<FiveDaysThreeHoursDataModel>> getFiveDaysThreeHoursData(
      String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final Dio dio;

  WeatherRemoteDataSourceImpl({required this.dio});

  @override
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String city) async =>
      _getCurrentWeatherDataFromUrl(
          '$baseUrl/weather?q=$city&lang=en&appid=$apiKey');

  @override
  Future<List<FiveDaysThreeHoursDataModel>> getFiveDaysThreeHoursData(
          String city) async =>
      _getFiveDaysThreeHoursDataFromUrl(
          '$baseUrl/forecast?q=$city&lang=en&appid=$apiKey');

  Future<CurrentWeatherDataModel> _getCurrentWeatherDataFromUrl(
      String url) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return CurrentWeatherDataModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  Future<List<FiveDaysThreeHoursDataModel>> _getFiveDaysThreeHoursDataFromUrl(
      String url) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return (response.data['list'] as List)
          .map((fiveDaysThreeHoursData) =>
              FiveDaysThreeHoursDataModel.fromJson(fiveDaysThreeHoursData))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
