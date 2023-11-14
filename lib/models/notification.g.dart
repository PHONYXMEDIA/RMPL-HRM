// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      branch: json['branch'] as String?,
      date: json['date'] as String?,
      isVisible: json['isVisible'] as bool?,
      message: json['message'] as String?,
      notificationID: json['notificationID'] as String?,
      receover: json['receover'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'date': instance.date,
      'isVisible': instance.isVisible,
      'message': instance.message,
      'notificationID': instance.notificationID,
      'receover': instance.receover,
      'type': instance.type,
    };
