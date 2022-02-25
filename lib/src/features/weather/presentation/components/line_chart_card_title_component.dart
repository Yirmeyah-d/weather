import 'package:flutter/material.dart';

class LineChartCardTitleComponent extends StatelessWidget {
  final String title;
  const LineChartCardTitleComponent({
    required this.title,
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
          const Icon(
            Icons.next_plan_outlined,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
