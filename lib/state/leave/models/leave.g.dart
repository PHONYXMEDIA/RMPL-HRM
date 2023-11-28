// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveImpl _$$LeaveImplFromJson(Map<String, dynamic> json) => _$LeaveImpl(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      fromDate:
          const TimestampConverter().fromJson(json['fromDate'] as Timestamp?),
      toDate: const TimestampConverter().fromJson(json['toDate'] as Timestamp?),
      leaveType: json['leaveType'] as String?,
      reason: json['reason'] as String?,
      status: json['status'] as String?,
      uid: const DocumentReferenceJsonConverter().fromJson(json['uid']),
    );

Map<String, dynamic> _$$LeaveImplToJson(_$LeaveImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'date': const TimestampConverter().toJson(instance.date),
      'fromDate': const TimestampConverter().toJson(instance.fromDate),
      'toDate': const TimestampConverter().toJson(instance.toDate),
      'leaveType': instance.leaveType,
      'reason': instance.reason,
      'status': instance.status,
      'uid': const DocumentReferenceJsonConverter().toJson(instance.uid),
    };
