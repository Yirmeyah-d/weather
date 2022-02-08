import 'package:get/instance_manager.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController(city: '京都市'));
  }
}
