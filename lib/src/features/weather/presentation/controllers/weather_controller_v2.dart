import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather/src/core/utils/failure_api.dart';

import '../../../../core/use_cases/use_cases.dart';
import '../../domain/entities/current_weather_data.dart';
import '../../domain/entities/five_days_three_hours_data.dart';
import '../../domain/use_cases/get_cities.dart';
import '../../domain/use_cases/get_current_weather_data.dart';
import '../../domain/use_cases/get_five_days_three_hours_data.dart';

enum WeatherState { INITIAL, LOADING, ERROR, SUCCESS }

class WeatherController extends GetxController {
  final GetCurrentWeatherData getCurrentWeatherData;
  final GetFiveDaysThreeHoursData getFiveDaysThreeHoursData;
  final GetCities getCities;
  String city;
  var weatherState = WeatherState.INITIAL.obs;
  Rx<CurrentWeatherData?> currentWeatherData = Rx<CurrentWeatherData?>(null);
  RxList<CurrentWeatherData> currentWeatherDataList =
      RxList<CurrentWeatherData>([]);
  RxList<FiveDaysThreeHoursData> fiveDaysThreeHoursData =
      RxList<FiveDaysThreeHoursData>([]);
  RxList<String> cities = RxList([]);

  WeatherController({
    required this.city,
    required this.getCurrentWeatherData,
    required this.getFiveDaysThreeHoursData,
    required this.getCities,
  });

  @override
  void onInit() async {
    await updateWeather(city);
    await getCityList();
    await getTopFiveCities();
    super.onInit();
  }

  Future<void> updateWeather(String city) async {
    weatherState.value = WeatherState.LOADING;
    final failureOrCurrentWeatherData =
        await getCurrentWeatherData(Params(city: city));
    failureOrCurrentWeatherData.fold(
      (failure) {
        weatherState.value = WeatherState.ERROR;
        print(failure.mapFailureToMessage);
      },
      (currentWeatherData) {
        this.currentWeatherData.value = currentWeatherData;
        weatherState.value = WeatherState.SUCCESS;
      },
    );

    final failureOrFiveDaysThreeHoursData =
        await getFiveDaysThreeHoursData(Params(city: city));
    failureOrFiveDaysThreeHoursData.fold(
      (failure) {
        weatherState.value = WeatherState.ERROR;
        print(failure.mapFailureToMessage);
      },
      (fiveDaysThreeHoursData) {
        this.fiveDaysThreeHoursData.value = fiveDaysThreeHoursData;
        weatherState.value = WeatherState.SUCCESS;
      },
    );
  }

  Future<void> getCityList() async {
    cities.value = await getCities(NoParams());
  }

  Future<void> getTopFiveCities() async {
    List<String> cities = ['London', 'New York', 'Paris', 'Moscow', 'Tokyo'];
    cities.forEach((c) async {
      final failureOrCurrentWeatherData =
          await getCurrentWeatherData(Params(city: c));
      failureOrCurrentWeatherData.fold(
        (failure) {
          weatherState.value = WeatherState.ERROR;
          print(failure.mapFailureToMessage);
        },
        (currentWeatherData) {
          currentWeatherDataList.add(currentWeatherData);
        },
      );
    });
    weatherState.value = WeatherState.SUCCESS;
  }
}
