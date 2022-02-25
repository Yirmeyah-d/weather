import '../../domain/entities/five_days_three_hours_data.dart';

class FiveDaysThreeHoursDataModel extends FiveDaysThreeHoursData {
  const FiveDaysThreeHoursDataModel({
    required String dateTime,
    required int temp,
  }) : super(
          dateTime: dateTime,
          temp: temp,
        );

  factory FiveDaysThreeHoursDataModel.fromJson(Map<String, dynamic> json) {
    return FiveDaysThreeHoursDataModel(
      dateTime: json['dt_txt'],
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt_txt': dateTime,
      'main': {
        'temp': temp,
      }
    };
  }

  factory FiveDaysThreeHoursDataModel.timestampToDateTime(
      FiveDaysThreeHoursDataModel fiveDaysThreeHoursDataModel) {
    var f = fiveDaysThreeHoursDataModel.dateTime.split(' ')[0].split('-')[2];
    var l = fiveDaysThreeHoursDataModel.dateTime.split(' ')[1].split(':')[0];
    var dateTime = '$f-$l';
    return FiveDaysThreeHoursDataModel(
      dateTime: dateTime,
      temp: (fiveDaysThreeHoursDataModel.temp - 273.15).round(),
    );
  }
}
