// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String?,
      branch: json['branch'] as String?,
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
      message: json['message'] as String?,
      type: json['type'] as String?,
      receiver: json['receiver'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
      'message': instance.message,
      'type': instance.type,
      'receiver': instance.receiver,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
