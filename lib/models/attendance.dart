import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rmpl_hrm/models/leave.dart';

part 'attendance.g.dart';

@JsonSerializable()
@DocumentReferenceJsonConverter()
@TimestampConverter()
class Attendance extends Equatable {
  const Attendance({
    this.createdAt,
    this.punchedIn,
    this.punchedOut,
    this.punchedBy,
    this.under,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  @override
  List<Object?> get props => [
        createdAt,
        punchedIn,
        punchedOut,
        punchedBy,
        under,
      ];

  final DateTime? createdAt;
  final DateTime? punchedIn;
  final DateTime? punchedOut;
  final DocumentReference? punchedBy;
  final DocumentReference? under;
}
