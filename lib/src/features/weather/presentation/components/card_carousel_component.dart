import 'package:flutter/material.dart';

import '../../domain/entities/current_weather_data.dart';

class CardCarouselComponent extends StatelessWidget {
  final List<CurrentWeatherData> cardsContent;

  const CardCarouselComponent({
    required this.cardsContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: cardsContent.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data;
          (cardsContent.isNotEmpty) ? data = cardsContent[index] : data = null;
          return SizedBox(
            width: 140,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (data != null) ? data.name : '',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  Text(
                    (data != null)
                        ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                        : '',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sunny-cloud.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    (data != null) ? data.weather[0].description : '',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
