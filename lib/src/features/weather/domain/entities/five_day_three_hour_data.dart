import 'package:equatable/equatable.dart';

class FiveDayThreeHourData extends Equatable {
  final String dateTime;
  final int temp;

  const FiveDayThreeHourData({required this.dateTime, required this.temp});

  @override
  List<Object> get props => [
        dateTime,
        temp,
      ];
}
