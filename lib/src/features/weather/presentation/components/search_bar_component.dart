import 'package:flutter/material.dart';
import 'package:weather/src/features/weather/presentation/controllers/weather_controller.dart';

class SearchBarComponent extends StatelessWidget {
  final Future<void> Function() onSubmitted;
  final Function onChanged;
  const SearchBarComponent({
    required this.onSubmitted,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: TextField(
        onChanged: (value) => onChanged(value),
        style: const TextStyle(
          color: Colors.white,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) => onSubmitted(),
        decoration: InputDecoration(
          suffix: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: 'Search'.toUpperCase(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
