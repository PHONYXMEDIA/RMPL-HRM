// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
      date: json['date'] as String?,
      formattedDate: json['formattedDate'] as String?,
      holidayID: json['holidayID'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
      'date': instance.date,
      'formattedDate': instance.formattedDate,
      'holidayID': instance.holidayID,
      'title': instance.title,
    };
