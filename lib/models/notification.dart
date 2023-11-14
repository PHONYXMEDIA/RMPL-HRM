import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  const Notification({
    this.branch,
    this.date,
    this.isVisible,
    this.message,
    this.notificationID,
    this.receover,
    this.type,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();

  final String? branch;
  final String? date;
  final bool? isVisible;
  final String? message;
  final String? notificationID;
  final String? receover;
  final String? type;
}
