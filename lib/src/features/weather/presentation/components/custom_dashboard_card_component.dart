import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/current_weather_data.dart';

class CustomDashboardCardComponent extends StatelessWidget {
  final CurrentWeatherData? cardContent;

  const CustomDashboardCardComponent({
    required this.cardContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 1.0),
      child: SizedBox(
        height: 10,
        width: 10,
        child: OverflowBox(
          minWidth: 0.0,
          maxWidth: MediaQuery.of(context).size.width,
          minHeight: 0.0,
          maxHeight: (MediaQuery.of(context).size.height / 4),
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                    cardContent!.name.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                          color: Colors.black45,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'flutterfonts',
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    DateFormat()
                                        .add_MMMMEEEEd()
                                        .format(DateTime.now()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                          color: Colors.black45,
                                          fontSize: 10,
                                          fontFamily: 'flutterfonts',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  cardContent!.weather[0].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 15,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${((cardContent?.main.temp)! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: Colors.black45,
                                          fontFamily: 'flutterfonts'),
                                ),
                                Text(
                                  'min: ${((cardContent?.main.tempMin)! - 273.15).round().toString()}\u2103 / max: ${((cardContent?.main.tempMax)! - 273.15).round().toString()}\u2103',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/sunny-cloud.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'wind ${cardContent?.wind.speed} m/s',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
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
    );
  }
}
