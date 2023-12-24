// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Leave _$LeaveFromJson(Map<String, dynamic> json) {
  return _Leave.fromJson(json);
}

/// @nodoc
mixin _$Leave {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  String? get leaveType => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DocumentReference<Object?>? get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveCopyWith<Leave> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveCopyWith<$Res> {
  factory $LeaveCopyWith(Leave value, $Res Function(Leave) then) =
      _$LeaveCopyWithImpl<$Res, Leave>;
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? date,
      DateTime? fromDate,
      DateTime? toDate,
      String? leaveType,
      String? reason,
      String? status,
      DocumentReference<Object?>? uid});
}

/// @nodoc
class _$LeaveCopyWithImpl<$Res, $Val extends Leave>
    implements $LeaveCopyWith<$Res> {
  _$LeaveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? date = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? leaveType = freezed,
    Object? reason = freezed,
    Object? status = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leaveType: freezed == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveImplCopyWith<$Res> implements $LeaveCopyWith<$Res> {
  factory _$$LeaveImplCopyWith(
          _$LeaveImpl value, $Res Function(_$LeaveImpl) then) =
      __$$LeaveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? date,
      DateTime? fromDate,
      DateTime? toDate,
      String? leaveType,
      String? reason,
      String? status,
      DocumentReference<Object?>? uid});
}

/// @nodoc
class __$$LeaveImplCopyWithImpl<$Res>
    extends _$LeaveCopyWithImpl<$Res, _$LeaveImpl>
    implements _$$LeaveImplCopyWith<$Res> {
  __$$LeaveImplCopyWithImpl(
      _$LeaveImpl _value, $Res Function(_$LeaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? date = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? leaveType = freezed,
    Object? reason = freezed,
    Object? status = freezed,
    Object? uid = freezed,
  }) {
    return _then(_$LeaveImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leaveType: freezed == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@TimestampConverter()
@DocumentReferenceConverter()
class _$LeaveImpl implements _Leave {
  const _$LeaveImpl(
      {this.createdAt,
      this.date,
      this.fromDate,
      this.toDate,
      this.leaveType,
      this.reason,
      this.status,
      this.uid});

  factory _$LeaveImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveImplFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? date;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
  @override
  final String? leaveType;
  @override
  final String? reason;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? uid;

  @override
  String toString() {
    return 'Leave(createdAt: $createdAt, date: $date, fromDate: $fromDate, toDate: $toDate, leaveType: $leaveType, reason: $reason, status: $status, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.leaveType, leaveType) ||
                other.leaveType == leaveType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, date, fromDate,
      toDate, leaveType, reason, status, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveImplCopyWith<_$LeaveImpl> get copyWith =>
      __$$LeaveImplCopyWithImpl<_$LeaveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveImplToJson(
      this,
    );
  }
}

abstract class _Leave implements Leave {
  const factory _Leave(
      {final DateTime? createdAt,
      final DateTime? date,
      final DateTime? fromDate,
      final DateTime? toDate,
      final String? leaveType,
      final String? reason,
      final String? status,
      final DocumentReference<Object?>? uid}) = _$LeaveImpl;

  factory _Leave.fromJson(Map<String, dynamic> json) = _$LeaveImpl.fromJson;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get date;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override
  String? get leaveType;
  @override
  String? get reason;
  @override
  String? get status;
  @override
  DocumentReference<Object?>? get uid;
  @override
  @JsonKey(ignore: true)
  _$$LeaveImplCopyWith<_$LeaveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
