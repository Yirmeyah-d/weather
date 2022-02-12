import 'package:fpdart/fpdart.dart';
import 'package:weather/src/features/weather/domain/entities/current_weather_data.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_cases.dart';

class GetCurrentWeatherData implements UseCase<CurrentWeatherData, Params> {
  final WeatherRepository repository;

  GetCurrentWeatherData(this.repository);

  @override
  Future<Either<Failure, CurrentWeatherData>> call(Params params) async {
    return await repository.getCurrentWeatherData(params.city);
  }
}
