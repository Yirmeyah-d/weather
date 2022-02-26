import 'package:flutter/material.dart';

class LineChartCardTitleComponent extends StatelessWidget {
  final String title;
  final Future<void> Function(String city) onPressed;
  final String city;
  const LineChartCardTitleComponent({
    required this.onPressed,
    required this.title,
    required this.city,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
          ),
          IconButton(
            icon: const Icon(
              Icons.next_plan_outlined,
              color: Colors.black45,
            ),
            onPressed: () {
              onPressed(city);
            },
          ),
        ],
      ),
    );
  }
}
