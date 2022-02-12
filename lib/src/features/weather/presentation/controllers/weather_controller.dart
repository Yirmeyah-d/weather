import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather/src/core/utils/failure_api.dart';
import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_five_days_three_hours_data.dart';

import '../../../../core/use_cases/use_cases.dart';
import '../../domain/entities/current_weather_data.dart';

class WeatherController extends GetxController {
  String city;
  final GetCurrentWeatherData getCurrentWeatherData;
  final GetFiveDaysThreeHoursData getFiveDaysThreeHoursData;

  CurrentWeatherData? currentWeatherData;
  List<CurrentWeatherData> currentWeatherDataList = [];
  List<FiveDaysThreeHoursData> fiveDaysThreeHoursData = [];

  WeatherController({
    required this.city,
    required this.getCurrentWeatherData,
    required this.getFiveDaysThreeHoursData,
  });

  @override
  void onInit() {
    updateWeather();
    getTopFiveCities();
    super.onInit();
  }

  Future<void> updateWeather() async {
    final failureOrCurrentWeatherData =
        await getCurrentWeatherData(Params(city: city));
    failureOrCurrentWeatherData.fold(
      (failure) {
        print(failure.mapFailureToMessage);
        update();
      },
      (currentWeatherData) {
        this.currentWeatherData = currentWeatherData;
        update();
      },
    );

    final failureOrFiveDaysThreeHoursData =
        await getFiveDaysThreeHoursData(Params(city: city));
    failureOrFiveDaysThreeHoursData.fold(
      (failure) {
        print(failure.mapFailureToMessage);
        update();
      },
      (fiveDaysThreeHoursData) {
        this.fiveDaysThreeHoursData = fiveDaysThreeHoursData;
        update();
      },
    );
  }

  void getTopFiveCities() {
    List<String> cities = ['London', 'New York', 'Paris', 'Moscow', 'Tokyo'];
    cities.forEach((c) async {
      final failureOrCurrentWeatherData =
          await getCurrentWeatherData(Params(city: c));
      failureOrCurrentWeatherData.fold(
        (failure) {
          print(failure.mapFailureToMessage);
          update();
        },
        (currentWeatherData) {
          currentWeatherDataList.add(currentWeatherData);
          update();
        },
      );
    });
  }
}
