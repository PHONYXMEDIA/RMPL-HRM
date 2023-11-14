import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'holiday.g.dart';

@JsonSerializable()
class Holiday extends Equatable {
  const Holiday({
    this.date,
    this.formattedDate,
    this.holidayID,
    this.title,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayToJson(this);

  final String? date;
  final String? formattedDate;
  final String? holidayID;
  final String? title;

  @override
  List<Object?> get props => [date, formattedDate, holidayID, title];
}
