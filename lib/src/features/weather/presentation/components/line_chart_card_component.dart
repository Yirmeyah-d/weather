import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entities/five_days_three_hours_data.dart';

class LineChartCardComponent extends StatelessWidget {
  final List<FiveDaysThreeHoursData> dataSource;

  const LineChartCardComponent({
    required this.dataSource,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDaysThreeHoursData, String>>[
            SplineSeries<FiveDaysThreeHoursData, String>(
              dataSource: dataSource,
              xValueMapper: (FiveDaysThreeHoursData f, _) => f.dateTime,
              yValueMapper: (FiveDaysThreeHoursData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
