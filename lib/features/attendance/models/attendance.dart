import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/converters/converters.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  @TimestampConverter()
  @DocumentReferenceConverter()
  const factory Attendance({
    DateTime? createdAt,
    DateTime? punchedIn,
    DateTime? punchedOut,
    DocumentReference? punchedBy,
    DocumentReference? under,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
