import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/models/leave.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  @TimestampConverter()
  @DocumentReferenceJsonConverter()
  const factory Notification({
    String? id,
    String? branch,
    DocumentReference? creator,
    String? message,
    String? type,
    String? receiver,
    DateTime? createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
