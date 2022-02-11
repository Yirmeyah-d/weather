import 'dart:convert';

import 'package:weather/src/features/weather/data/models/current_weather_data_model.dart';
import 'package:weather/src/features/weather/data/models/five_days_three_hours_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached [CurrentWeatherDataModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CurrentWeatherDataModel> getLastCurrentWeatherData();

  /// Add in the cache the [CurrentWeatherDataModel]
  ///
  Future<void> cacheCurrentWeatherData(
      CurrentWeatherDataModel currentWeatherDataToCache);

  /// Gets the cached [FiveDaysThreeHoursDataModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<FiveDaysThreeHoursDataModel>> getLastFiveDaysThreeHoursData();

  /// Add in the cache the [FiveDaysThreeHoursDataModel]
  ///
  Future<void> cacheFiveDaysThreeHoursData(
      List<FiveDaysThreeHoursDataModel> fiveDaysThreeHoursDataToCache);
}

const CACHED_CURRENT_WEATHER_DATA = 'CACHED_CURRENT_WEATHER_DATA';

const CACHED_FIVE_DAYS_THREE_HOURS_DATA = 'CACHED_FIVE_DAYS_THREE_HOURS_DATA';

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CurrentWeatherDataModel> getLastCurrentWeatherData() {
    final jsonString = sharedPreferences.getString(CACHED_CURRENT_WEATHER_DATA);
    if (jsonString != null) {
      return Future.value(
          CurrentWeatherDataModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCurrentWeatherData(
      CurrentWeatherDataModel currentWeatherDataToCache) {
    return sharedPreferences.setString(
      CACHED_CURRENT_WEATHER_DATA,
      jsonEncode(currentWeatherDataToCache.toJson()),
    );
  }

  @override
  Future<List<FiveDaysThreeHoursDataModel>> getLastFiveDaysThreeHoursData() {
    final jsonFiveDaysThreeHoursDataList =
        sharedPreferences.getStringList(CACHED_FIVE_DAYS_THREE_HOURS_DATA);
    if (jsonFiveDaysThreeHoursDataList != null) {
      return Future.value(jsonFiveDaysThreeHoursDataList
          .map((country) =>
              FiveDaysThreeHoursDataModel.fromJson(jsonDecode(country)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheFiveDaysThreeHoursData(
      List<FiveDaysThreeHoursDataModel> fiveDaysThreeHoursDataToCache) {
    List<String> countryListEncoded = fiveDaysThreeHoursDataToCache
        .map((country) => jsonEncode(country.toJson()))
        .toList();

    return sharedPreferences.setStringList(
      CACHED_FIVE_DAYS_THREE_HOURS_DATA,
      countryListEncoded,
    );
  }
}
