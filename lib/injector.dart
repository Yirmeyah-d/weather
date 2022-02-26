import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/src/core/network/network_info.dart';
import 'package:weather/src/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:weather/src/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_cities.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_five_days_three_hours_data.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller_v2.dart';

Future<void> init() async {
  //! Features - Weather

  // Controller
  Get.lazyPut(
    () => WeatherController(
        city: 'Poissy',
        getCurrentWeatherData: Get.find<GetCurrentWeatherData>(),
        getFiveDaysThreeHoursData: Get.find<GetFiveDaysThreeHoursData>(),
        getCities: Get.find<GetCities>()),
  );

  // Use Cases
  Get.lazyPut(() => GetCurrentWeatherData(Get.find<WeatherRepository>()));
  Get.lazyPut(() => GetFiveDaysThreeHoursData(Get.find<WeatherRepository>()));
  Get.lazyPut(() => GetCities(Get.find<WeatherRepository>()));

  // Data Sources
  Get.lazyPut<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      dio: Get.find<Dio>(),
    ),
  );
  Get.lazyPut<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(
      sharedPreferences: Get.find<SharedPreferences>(),
    ),
  );

  // Repository
  Get.lazyPut<WeatherRepository>(() => WeatherRepositoryImpl(
      remoteDataSource: Get.find<WeatherRemoteDataSource>(),
      localDataSource: Get.find<WeatherLocalDataSource>(),
      networkInfo: Get.find<NetworkInfo>()));

  //! Core
  Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(Get.find<InternetConnectionChecker>()));

  //! External
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => InternetConnectionChecker());
  Get.lazyPut(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.putAsync<SharedPreferences>(() async => sharedPreferences);
}
