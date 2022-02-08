import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/src/features/weather/domain/entities/five_day_three_hour_data.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/use_cases.dart';

class GetFiveDaysThreeHoursData
    implements UseCase<List<FiveDayThreeHourData>, Params> {
  final WeatherRepository repository;

  GetFiveDaysThreeHoursData(this.repository);

  @override
  Future<Either<Failure, List<FiveDayThreeHourData>>> call(
      Params params) async {
    return await repository.getFiveDaysThreeHoursData(params.city);
  }
}

class Params extends Equatable {
  final String city;

  const Params({required this.city});

  @override
  List<Object> get props => [city];
}
