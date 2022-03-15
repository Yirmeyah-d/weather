import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBarComponent extends StatelessWidget {
  final Future<void> Function(String city) onSubmitted;
  //final Function onChanged;
  final List<String> cities;
  final TextEditingController _typeAheadController = TextEditingController();

  SearchBarComponent({
    required this.onSubmitted,
    // required this.onChanged,
    required this.cities,
    Key? key,
  }) : super(key: key);

  List<String> _getSuggestions(List<String> cityList, String query) {
    List<String> matches = [];

    for (var city in cityList) {
      matches.add(city);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches.take(10).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          textInputAction: TextInputAction.search,
          controller: _typeAheadController,
          decoration: InputDecoration(
            hintText: 'Type here city name',
            hintStyle: const TextStyle(fontSize: 16),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ),
            ),
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
        suggestionsCallback: (pattern) {
          return _getSuggestions(cities, pattern);
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion as String),
          );
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        onSuggestionSelected: (suggestion) {
          _typeAheadController.text = suggestion as String;
          // onChanged(suggestion);
          onSubmitted(suggestion);
        },
      ),
    );
  }
}
