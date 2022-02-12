import 'package:get/instance_manager.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';
import 'package:weather/src/features/weather/domain/use_cases/get_five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController(
        city: '京都市',
        getCurrentWeatherData: Get.find<GetCurrentWeatherData>(),
        getFiveDaysThreeHoursData: Get.find<GetFiveDaysThreeHoursData>()));
  }
}
