// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttendanceState {
  AttendanceStatus get status => throw _privateConstructorUsedError;
  PunchStatus? get punchStatus => throw _privateConstructorUsedError;
  Attendance? get attendance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceStateCopyWith<AttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStateCopyWith<$Res> {
  factory $AttendanceStateCopyWith(
          AttendanceState value, $Res Function(AttendanceState) then) =
      _$AttendanceStateCopyWithImpl<$Res, AttendanceState>;
  @useResult
  $Res call(
      {AttendanceStatus status,
      PunchStatus? punchStatus,
      Attendance? attendance});

  $AttendanceCopyWith<$Res>? get attendance;
}

/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res, $Val extends AttendanceState>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? punchStatus = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      punchStatus: freezed == punchStatus
          ? _value.punchStatus
          : punchStatus // ignore: cast_nullable_to_non_nullable
              as PunchStatus?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceCopyWith<$Res>? get attendance {
    if (_value.attendance == null) {
      return null;
    }

    return $AttendanceCopyWith<$Res>(_value.attendance!, (value) {
      return _then(_value.copyWith(attendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceStateImplCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$$AttendanceStateImplCopyWith(_$AttendanceStateImpl value,
          $Res Function(_$AttendanceStateImpl) then) =
      __$$AttendanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AttendanceStatus status,
      PunchStatus? punchStatus,
      Attendance? attendance});

  @override
  $AttendanceCopyWith<$Res>? get attendance;
}

/// @nodoc
class __$$AttendanceStateImplCopyWithImpl<$Res>
    extends _$AttendanceStateCopyWithImpl<$Res, _$AttendanceStateImpl>
    implements _$$AttendanceStateImplCopyWith<$Res> {
  __$$AttendanceStateImplCopyWithImpl(
      _$AttendanceStateImpl _value, $Res Function(_$AttendanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? punchStatus = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_$AttendanceStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      punchStatus: freezed == punchStatus
          ? _value.punchStatus
          : punchStatus // ignore: cast_nullable_to_non_nullable
              as PunchStatus?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance?,
    ));
  }
}

/// @nodoc

class _$AttendanceStateImpl implements _AttendanceState {
  const _$AttendanceStateImpl(
      {this.status = AttendanceStatus.nothing,
      this.punchStatus = PunchStatus.initial,
      this.attendance});

  @override
  @JsonKey()
  final AttendanceStatus status;
  @override
  @JsonKey()
  final PunchStatus? punchStatus;
  @override
  final Attendance? attendance;

  @override
  String toString() {
    return 'AttendanceState(status: $status, punchStatus: $punchStatus, attendance: $attendance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.punchStatus, punchStatus) ||
                other.punchStatus == punchStatus) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, punchStatus, attendance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceStateImplCopyWith<_$AttendanceStateImpl> get copyWith =>
      __$$AttendanceStateImplCopyWithImpl<_$AttendanceStateImpl>(
          this, _$identity);
}

abstract class _AttendanceState implements AttendanceState {
  const factory _AttendanceState(
      {final AttendanceStatus status,
      final PunchStatus? punchStatus,
      final Attendance? attendance}) = _$AttendanceStateImpl;

  @override
  AttendanceStatus get status;
  @override
  PunchStatus? get punchStatus;
  @override
  Attendance? get attendance;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceStateImplCopyWith<_$AttendanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
