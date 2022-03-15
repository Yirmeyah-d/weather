// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:weather/src/core/utils/failure_api.dart';
// import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';
// import 'package:weather/src/features/weather/domain/use_cases/get_cities.dart';
// import 'package:weather/src/features/weather/domain/use_cases/get_current_weather_data.dart';
// import 'package:weather/src/features/weather/domain/use_cases/get_five_days_three_hours_data.dart';
//
// import '../../../../core/use_cases/use_cases.dart';
// import '../../domain/entities/current_weather_data.dart';
//
// enum WeatherState { INITIAL, LOADING, ERROR, SUCCESS }
//
// class WeatherController extends GetxController {
//   String city;
//   var weatherState = WeatherState.INITIAL;
//   final GetCurrentWeatherData getCurrentWeatherData;
//   final GetFiveDaysThreeHoursData getFiveDaysThreeHoursData;
//   final GetCities getCities;
//   CurrentWeatherData? currentWeatherData;
//   List<CurrentWeatherData> currentWeatherDataList = [];
//   List<FiveDaysThreeHoursData> fiveDaysThreeHoursData = [];
//   List<String> cities = [];
//   WeatherController({
//     required this.city,
//     required this.getCurrentWeatherData,
//     required this.getFiveDaysThreeHoursData,
//     required this.getCities,
//   });
//
//   @override
//   void onInit() async {
//     await updateWeather();
//     await getCityList();
//     await getTopFiveCities();
//     super.onInit();
//   }
//
//   void updateCity(String newCity) {
//     city = newCity;
//     update();
//   }
//
//   Future<void> updateWeather() async {
//     weatherState = WeatherState.LOADING;
//     update();
//     final failureOrCurrentWeatherData =
//         await getCurrentWeatherData(Params(city: city));
//     failureOrCurrentWeatherData.fold(
//       (failure) {
//         weatherState = WeatherState.ERROR;
//         print(failure.mapFailureToMessage);
//         update();
//       },
//       (currentWeatherData) {
//         this.currentWeatherData = currentWeatherData;
//         weatherState = WeatherState.SUCCESS;
//         update();
//       },
//     );
//
//     final failureOrFiveDaysThreeHoursData =
//         await getFiveDaysThreeHoursData(Params(city: city));
//     failureOrFiveDaysThreeHoursData.fold(
//       (failure) {
//         weatherState = WeatherState.ERROR;
//         print(failure.mapFailureToMessage);
//         update();
//       },
//       (fiveDaysThreeHoursData) {
//         this.fiveDaysThreeHoursData = fiveDaysThreeHoursData;
//         weatherState = WeatherState.SUCCESS;
//         update();
//       },
//     );
//   }
//
//   Future<void> getCityList() async {
//     cities = await getCities(NoParams());
//   }
//
//   Future<void> getTopFiveCities() async {
//     List<String> cities = ['London', 'New York', 'Paris', 'Moscow', 'Tokyo'];
//     cities.forEach((c) async {
//       final failureOrCurrentWeatherData =
//           await getCurrentWeatherData(Params(city: c));
//       failureOrCurrentWeatherData.fold(
//         (failure) {
//           weatherState = WeatherState.ERROR;
//           print(failure.mapFailureToMessage);
//           update();
//         },
//         (currentWeatherData) {
//           currentWeatherDataList.add(currentWeatherData);
//           update();
//         },
//       );
//     });
//     weatherState = WeatherState.SUCCESS;
//     update();
//   }
// }
