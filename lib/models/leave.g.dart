// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      from: const TimestampConverter().fromJson(json['from'] as Timestamp?),
      to: const TimestampConverter().fromJson(json['to'] as Timestamp?),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      day: json['day'] as String?,
      reason: json['reason'] as String?,
      leaveType: json['leaveType'] as String?,
      status: json['status'] as String?,
      userId: const DocumentReferenceJsonConverter().fromJson(json['uid']),
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'from': const TimestampConverter().toJson(instance.from),
      'to': const TimestampConverter().toJson(instance.to),
      'date': const TimestampConverter().toJson(instance.date),
      'day': instance.day,
      'reason': instance.reason,
      'leaveType': instance.leaveType,
      'status': instance.status,
      'uid': const DocumentReferenceJsonConverter().toJson(instance.userId),
    };
