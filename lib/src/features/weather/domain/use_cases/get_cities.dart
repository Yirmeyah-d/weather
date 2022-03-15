import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/use_cases/use_cases.dart';

class GetCities implements UseCaseNoFailure<List<String>, NoParams> {
  final WeatherRepository repository;

  GetCities(this.repository);

  @override
  Future<List<String>> call(NoParams params) async {
    return await repository.getCities();
  }
}
