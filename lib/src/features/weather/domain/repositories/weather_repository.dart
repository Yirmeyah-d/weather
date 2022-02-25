import 'package:fpdart/fpdart.dart';
import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';

import '../../../../core/error/failures.dart';
import '../entities/current_weather_data.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherData>> getCurrentWeatherData(
      String city);
  Future<Either<Failure, List<FiveDaysThreeHoursData>>>
      getFiveDaysThreeHoursData(String city);
  Future<List<String>> getCities();
}
