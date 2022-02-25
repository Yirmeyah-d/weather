import 'package:get/instance_manager.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_cities.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

//Not use but kept just as a reminder of how should be the architecture if i were using bindings !!
class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController(
          city: '京都市',
          getCurrentWeatherData: Get.find<GetCurrentWeatherData>(),
          getFiveDaysThreeHoursData: Get.find<GetFiveDaysThreeHoursData>(),
          getCities: Get.find<GetCities>(),
        ));
  }
}
