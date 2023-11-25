// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
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

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'punchedIn': const TimestampConverter().toJson(instance.punchedIn),
      'punchedOut': const TimestampConverter().toJson(instance.punchedOut),
      'punchedBy':
          const DocumentReferenceJsonConverter().toJson(instance.punchedBy),
      'under': const DocumentReferenceJsonConverter().toJson(instance.under),
    };
