import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:weather/src/features/weather/presentation/components/components.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

class WeatherView extends StatelessWidget {
  //TODO : Implementing some new functionality
  //TODO : adding some animation
  const WeatherView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<WeatherController>(builder: (controller) {
        switch (controller.weatherState) {
          case WeatherState.INITIAL:
            return const LoadingCircleComponent();
          case WeatherState.LOADING:
            return const LoadingCircleComponent();
          case WeatherState.ERROR:
            return const Text('Error');
          case WeatherState.SUCCESS:
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SearchBarComponent(
                          onSubmitted: controller.updateWeather,
                          onChanged: controller.updateCity,
                          cities: controller.cities,
                        ),
                        CustomDashboardCardComponent(
                            cardContent: controller.currentWeatherData)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.only(top: 120),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'other city'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                          fontSize: 16,
                                          fontFamily: 'flutterfonts',
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                CardCarouselComponent(
                                  cardsContent:
                                      controller.currentWeatherDataList,
                                ),
                                const LineChartCardTitleComponent(
                                  title: 'forcast next 5 days',
                                ),
                                LineChartCardComponent(
                                  dataSource: controller.fiveDaysThreeHoursData,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          default:
            return const LoadingCircleComponent();
        }
      }),
    );
  }
}
