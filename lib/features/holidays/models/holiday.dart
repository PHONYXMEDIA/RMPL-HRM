import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/converters/converters.dart';

part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
class Holiday with _$Holiday {
  @TimestampConverter()
  @DocumentReferenceConverter()
  const factory Holiday({
    String? id,
    String? title,
    DateTime? date,
    DocumentReference? creator,
    DateTime? createdAt,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
}
