import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/src/features/weather/domain/entities/five_days_three_hours_data.dart';
import 'package:weather/src/features/weather/presentation/components/components.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

import '../../domain/entities/current_weather_data.dart';

class WeatherView extends StatelessWidget {
  //TODO : clean the view by refactoring some parts and implementing some new functionality
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
            return const WeatherLoadingComponent();
          case WeatherState.LOADING:
            return const WeatherLoadingComponent();
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
                        Container(
                          padding: const EdgeInsets.only(
                              top: 100, left: 20, right: 20),
                          child: TextField(
                            onChanged: (value) => controller.city = value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) => controller.updateWeather(),
                            decoration: InputDecoration(
                              suffix: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: 'Search'.toUpperCase(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.0, 1.0),
                          child: SizedBox(
                            height: 10,
                            width: 10,
                            child: OverflowBox(
                              minWidth: 0.0,
                              maxWidth: MediaQuery.of(context).size.width,
                              minHeight: 0.0,
                              maxHeight:
                                  (MediaQuery.of(context).size.height / 4),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 20, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        controller
                                                            .currentWeatherData!
                                                            .name
                                                            .toUpperCase(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption
                                                            ?.copyWith(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'flutterfonts',
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        DateFormat()
                                                            .add_MMMMEEEEd()
                                                            .format(
                                                                DateTime.now()),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption
                                                            ?.copyWith(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 5,
                                                              fontFamily:
                                                                  'flutterfonts',
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 50),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      controller
                                                          .currentWeatherData!
                                                          .weather[0]
                                                          .description,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          ?.copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '${((controller.currentWeatherData?.main.temp)! - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2
                                                          ?.copyWith(
                                                              color: Colors
                                                                  .black45,
                                                              fontFamily:
                                                                  'flutterfonts'),
                                                    ),
                                                    Text(
                                                      'min: ${((controller.currentWeatherData?.main.tempMin)! - 273.15).round().toString()}\u2103 / max: ${((controller.currentWeatherData?.main.tempMax)! - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          ?.copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 120,
                                                      height: 120,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/sunny-cloud.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'wind ${controller.currentWeatherData?.wind.speed} m/s',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          ?.copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                                Container(
                                  height: 150,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                    itemCount: controller
                                        .currentWeatherDataList.length,
                                    itemBuilder: (context, index) {
                                      CurrentWeatherData? data;
                                      (controller.currentWeatherDataList
                                              .isNotEmpty)
                                          ? data = controller
                                              .currentWeatherDataList[index]
                                          : data = null;
                                      return SizedBox(
                                        width: 140,
                                        height: 150,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                (data != null) ? data.name : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                              Text(
                                                (data != null)
                                                    ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/sunny-cloud.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                (data != null)
                                                    ? data
                                                        .weather[0].description
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts',
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'forcast next 5 days'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                      ),
                                      const Icon(
                                        Icons.next_plan_outlined,
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 240,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      series: <
                                          ChartSeries<FiveDaysThreeHoursData,
                                              String>>[
                                        SplineSeries<FiveDaysThreeHoursData,
                                            String>(
                                          dataSource:
                                              controller.fiveDaysThreeHoursData,
                                          xValueMapper:
                                              (FiveDaysThreeHoursData f, _) =>
                                                  f.dateTime,
                                          yValueMapper:
                                              (FiveDaysThreeHoursData f, _) =>
                                                  f.temp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
            return WeatherLoadingComponent();
        }
      }),
    );
  }
}
