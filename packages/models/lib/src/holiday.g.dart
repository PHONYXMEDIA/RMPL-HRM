// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayImpl _$$HolidayImplFromJson(Map<String, dynamic> json) =>
    _$HolidayImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$HolidayImplToJson(_$HolidayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': const TimestampConverter().toJson(instance.date),
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
