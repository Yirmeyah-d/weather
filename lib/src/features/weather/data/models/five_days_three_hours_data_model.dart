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
    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDaysThreeHoursDataModel(
      dateTime: fandl,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'temp': temp,
    };
  }
}
