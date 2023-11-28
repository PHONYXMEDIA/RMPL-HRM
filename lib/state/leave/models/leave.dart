import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/models/leave.dart';

part 'leave.freezed.dart';
part 'leave.g.dart';

@freezed
class Leave with _$Leave {
  @TimestampConverter()
  @DocumentReferenceJsonConverter()
  const factory Leave({
    DateTime? createdAt,
    DateTime? date,
    DateTime? fromDate,
    DateTime? toDate,
    String? leaveType,
    String? reason,
    String? status,
    DocumentReference? uid,
  }) = _Leave;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}
