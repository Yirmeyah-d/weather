import 'package:equatable/equatable.dart';

class FiveDaysThreeHoursData extends Equatable {
  final String dateTime;
  final int temp;

  const FiveDaysThreeHoursData({required this.dateTime, required this.temp});

  @override
  List<Object> get props => [
        dateTime,
        temp,
      ];
}
