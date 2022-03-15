import 'package:fpdart/fpdart.dart';
import 'package:weather/src/features/weather/data/data_sources/weather_local_data_source.dart';
import 'package:weather/src/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather/src/features/weather/domain/entities/current_weather_data.dart';
import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../models/five_days_three_hours_data_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CurrentWeatherData>> getCurrentWeatherData(
      String city) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCurrentWeatherData =
            await remoteDataSource.getCurrentWeatherData(city);
        localDataSource.cacheCurrentWeatherData(remoteCurrentWeatherData);
        return Right(remoteCurrentWeatherData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCurrentWeatherData =
            await localDataSource.getLastCurrentWeatherData();
        return Right(localCurrentWeatherData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<FiveDaysThreeHoursData>>>
      getFiveDaysThreeHoursData(String city) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFiveDaysThreeHoursDataToCache =
            await remoteDataSource.getFiveDaysThreeHoursData(city);
        final remoteFiveDaysThreeHoursData = remoteFiveDaysThreeHoursDataToCache
            .map((fiveDaysThreeHoursData) =>
                FiveDaysThreeHoursDataModel.timestampToDateTime(
                    fiveDaysThreeHoursData))
            .toList();
        localDataSource
            .cacheFiveDaysThreeHoursData(remoteFiveDaysThreeHoursData);
        return Right(remoteFiveDaysThreeHoursData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFiveDaysThreeHoursData =
            await localDataSource.getLastFiveDaysThreeHoursData();
        return Right(localFiveDaysThreeHoursData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<List<String>> getCities() async {
      final cityList =
          await localDataSource.getCities();
      return cityList;
  }
}
