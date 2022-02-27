import 'package:fpdart/fpdart.dart';
import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_cases.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';

class GetFiveDaysThreeHoursData
    implements UseCase<List<FiveDaysThreeHoursData>, Params> {
  final WeatherRepository repository;

  GetFiveDaysThreeHoursData(this.repository);

  @override
  Future<Either<Failure, List<FiveDaysThreeHoursData>>> call(
      Params params) async {
    return await repository.getFiveDaysThreeHoursData(params.city);
  }
}
