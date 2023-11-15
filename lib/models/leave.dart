import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leave.g.dart';

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) => timestamp?.toDate();

  @override
  Timestamp? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}

class DocumentReferenceJsonConverter
    implements JsonConverter<DocumentReference?, Object?> {
  const DocumentReferenceJsonConverter();

  @override
  DocumentReference? fromJson(Object? json) {
    return tryCast<DocumentReference>(json);
  }

  @override
  Object? toJson(DocumentReference? documentReference) => documentReference;
}

T? tryCast<T>(value) {
  return value == null ? null : value as T;
}

@JsonSerializable()
@TimestampConverter()
@DocumentReferenceJsonConverter()
class Leave extends Equatable {
  final DateTime? createdAt;
  @JsonKey(name: 'fromDate')
  final DateTime? from;
  @JsonKey(name: 'toDate')
  final DateTime? to;
  final DateTime? date;
  final String? day;
  final String? reason;
  final String? leaveType;
  final String? status;
  @JsonKey(name: 'uid')
  final DocumentReference? userId;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);

  const Leave({
    this.createdAt,
    this.from,
    this.to,
    this.date,
    this.day,
    this.reason,
    this.leaveType,
    this.status,
    this.userId,
  });

  @override
  List<Object?> get props => [
        createdAt,
        from,
        to,
        date,
        day,
        reason,
        leaveType,
        status,
        userId,
      ];
}
