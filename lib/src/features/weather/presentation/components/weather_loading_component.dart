import 'package:flutter/material.dart';

class WeatherLoadingComponent extends StatelessWidget {
  const WeatherLoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
