// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      punchedIn:
          const TimestampConverter().fromJson(json['punchedIn'] as Timestamp?),
      punchedOut:
          const TimestampConverter().fromJson(json['punchedOut'] as Timestamp?),
      punchedBy:
          const DocumentReferenceJsonConverter().fromJson(json['punchedBy']),
      under: const DocumentReferenceJsonConverter().fromJson(json['under']),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'punchedIn': const TimestampConverter().toJson(instance.punchedIn),
      'punchedOut': const TimestampConverter().toJson(instance.punchedOut),
      'punchedBy':
          const DocumentReferenceJsonConverter().toJson(instance.punchedBy),
      'under': const DocumentReferenceJsonConverter().toJson(instance.under),
    };
