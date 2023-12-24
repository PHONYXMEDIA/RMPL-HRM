// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_leave_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OneDayState {
  Date get date => throw _privateConstructorUsedError;
  DayType get dayType => throw _privateConstructorUsedError;
  LeaveType get leaveType => throw _privateConstructorUsedError;
  Reason get reason => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OneDayStateCopyWith<OneDayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneDayStateCopyWith<$Res> {
  factory $OneDayStateCopyWith(
          OneDayState value, $Res Function(OneDayState) then) =
      _$OneDayStateCopyWithImpl<$Res, OneDayState>;
  @useResult
  $Res call(
      {Date date,
      DayType dayType,
      LeaveType leaveType,
      Reason reason,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class _$OneDayStateCopyWithImpl<$Res, $Val extends OneDayState>
    implements $OneDayStateCopyWith<$Res> {
  _$OneDayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayType = null,
    Object? leaveType = null,
    Object? reason = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      dayType: null == dayType
          ? _value.dayType
          : dayType // ignore: cast_nullable_to_non_nullable
              as DayType,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as LeaveType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneDayStateImplCopyWith<$Res>
    implements $OneDayStateCopyWith<$Res> {
  factory _$$OneDayStateImplCopyWith(
          _$OneDayStateImpl value, $Res Function(_$OneDayStateImpl) then) =
      __$$OneDayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Date date,
      DayType dayType,
      LeaveType leaveType,
      Reason reason,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class __$$OneDayStateImplCopyWithImpl<$Res>
    extends _$OneDayStateCopyWithImpl<$Res, _$OneDayStateImpl>
    implements _$$OneDayStateImplCopyWith<$Res> {
  __$$OneDayStateImplCopyWithImpl(
      _$OneDayStateImpl _value, $Res Function(_$OneDayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayType = null,
    Object? leaveType = null,
    Object? reason = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OneDayStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      dayType: null == dayType
          ? _value.dayType
          : dayType // ignore: cast_nullable_to_non_nullable
              as DayType,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as LeaveType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OneDayStateImpl implements _OneDayState {
  const _$OneDayStateImpl(
      {this.date = const Date.pure(),
      this.dayType = const DayType.pure(),
      this.leaveType = const LeaveType.pure(),
      this.reason = const Reason.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage});

  @override
  @JsonKey()
  final Date date;
  @override
  @JsonKey()
  final DayType dayType;
  @override
  @JsonKey()
  final LeaveType leaveType;
  @override
  @JsonKey()
  final Reason reason;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OneDayState(date: $date, dayType: $dayType, leaveType: $leaveType, reason: $reason, status: $status, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneDayStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayType, dayType) || other.dayType == dayType) &&
            (identical(other.leaveType, leaveType) ||
                other.leaveType == leaveType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, dayType, leaveType, reason,
      status, isValid, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneDayStateImplCopyWith<_$OneDayStateImpl> get copyWith =>
      __$$OneDayStateImplCopyWithImpl<_$OneDayStateImpl>(this, _$identity);
}

abstract class _OneDayState implements OneDayState {
  const factory _OneDayState(
      {final Date date,
      final DayType dayType,
      final LeaveType leaveType,
      final Reason reason,
      final FormzSubmissionStatus status,
      final bool isValid,
      final String? errorMessage}) = _$OneDayStateImpl;

  @override
  Date get date;
  @override
  DayType get dayType;
  @override
  LeaveType get leaveType;
  @override
  Reason get reason;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OneDayStateImplCopyWith<_$OneDayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MultipleDayState {
  Date get fromDate => throw _privateConstructorUsedError;
  Date get toDate => throw _privateConstructorUsedError;
  LeaveType get leaveType => throw _privateConstructorUsedError;
  Reason get reason => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultipleDayStateCopyWith<MultipleDayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultipleDayStateCopyWith<$Res> {
  factory $MultipleDayStateCopyWith(
          MultipleDayState value, $Res Function(MultipleDayState) then) =
      _$MultipleDayStateCopyWithImpl<$Res, MultipleDayState>;
  @useResult
  $Res call(
      {Date fromDate,
      Date toDate,
      LeaveType leaveType,
      Reason reason,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class _$MultipleDayStateCopyWithImpl<$Res, $Val extends MultipleDayState>
    implements $MultipleDayStateCopyWith<$Res> {
  _$MultipleDayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromDate = null,
    Object? toDate = null,
    Object? leaveType = null,
    Object? reason = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as Date,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as Date,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as LeaveType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MultipleDayStateImplCopyWith<$Res>
    implements $MultipleDayStateCopyWith<$Res> {
  factory _$$MultipleDayStateImplCopyWith(_$MultipleDayStateImpl value,
          $Res Function(_$MultipleDayStateImpl) then) =
      __$$MultipleDayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Date fromDate,
      Date toDate,
      LeaveType leaveType,
      Reason reason,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class __$$MultipleDayStateImplCopyWithImpl<$Res>
    extends _$MultipleDayStateCopyWithImpl<$Res, _$MultipleDayStateImpl>
    implements _$$MultipleDayStateImplCopyWith<$Res> {
  __$$MultipleDayStateImplCopyWithImpl(_$MultipleDayStateImpl _value,
      $Res Function(_$MultipleDayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromDate = null,
    Object? toDate = null,
    Object? leaveType = null,
    Object? reason = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MultipleDayStateImpl(
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as Date,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as Date,
      leaveType: null == leaveType
          ? _value.leaveType
          : leaveType // ignore: cast_nullable_to_non_nullable
              as LeaveType,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MultipleDayStateImpl implements _MultipleDayState {
  const _$MultipleDayStateImpl(
      {this.fromDate = const Date.pure(),
      this.toDate = const Date.pure(),
      this.leaveType = const LeaveType.pure(),
      this.reason = const Reason.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage});

  @override
  @JsonKey()
  final Date fromDate;
  @override
  @JsonKey()
  final Date toDate;
  @override
  @JsonKey()
  final LeaveType leaveType;
  @override
  @JsonKey()
  final Reason reason;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MultipleDayState(fromDate: $fromDate, toDate: $toDate, leaveType: $leaveType, reason: $reason, status: $status, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleDayStateImpl &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.leaveType, leaveType) ||
                other.leaveType == leaveType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromDate, toDate, leaveType,
      reason, status, isValid, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleDayStateImplCopyWith<_$MultipleDayStateImpl> get copyWith =>
      __$$MultipleDayStateImplCopyWithImpl<_$MultipleDayStateImpl>(
          this, _$identity);
}

abstract class _MultipleDayState implements MultipleDayState {
  const factory _MultipleDayState(
      {final Date fromDate,
      final Date toDate,
      final LeaveType leaveType,
      final Reason reason,
      final FormzSubmissionStatus status,
      final bool isValid,
      final String? errorMessage}) = _$MultipleDayStateImpl;

  @override
  Date get fromDate;
  @override
  Date get toDate;
  @override
  LeaveType get leaveType;
  @override
  Reason get reason;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MultipleDayStateImplCopyWith<_$MultipleDayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApplyLeaveState {
  OneDayState get oneDayState => throw _privateConstructorUsedError;
  MultipleDayState get multipleDayState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplyLeaveStateCopyWith<ApplyLeaveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyLeaveStateCopyWith<$Res> {
  factory $ApplyLeaveStateCopyWith(
          ApplyLeaveState value, $Res Function(ApplyLeaveState) then) =
      _$ApplyLeaveStateCopyWithImpl<$Res, ApplyLeaveState>;
  @useResult
  $Res call({OneDayState oneDayState, MultipleDayState multipleDayState});

  $OneDayStateCopyWith<$Res> get oneDayState;
  $MultipleDayStateCopyWith<$Res> get multipleDayState;
}

/// @nodoc
class _$ApplyLeaveStateCopyWithImpl<$Res, $Val extends ApplyLeaveState>
    implements $ApplyLeaveStateCopyWith<$Res> {
  _$ApplyLeaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneDayState = null,
    Object? multipleDayState = null,
  }) {
    return _then(_value.copyWith(
      oneDayState: null == oneDayState
          ? _value.oneDayState
          : oneDayState // ignore: cast_nullable_to_non_nullable
              as OneDayState,
      multipleDayState: null == multipleDayState
          ? _value.multipleDayState
          : multipleDayState // ignore: cast_nullable_to_non_nullable
              as MultipleDayState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OneDayStateCopyWith<$Res> get oneDayState {
    return $OneDayStateCopyWith<$Res>(_value.oneDayState, (value) {
      return _then(_value.copyWith(oneDayState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MultipleDayStateCopyWith<$Res> get multipleDayState {
    return $MultipleDayStateCopyWith<$Res>(_value.multipleDayState, (value) {
      return _then(_value.copyWith(multipleDayState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplyLeaveStateImplCopyWith<$Res>
    implements $ApplyLeaveStateCopyWith<$Res> {
  factory _$$ApplyLeaveStateImplCopyWith(_$ApplyLeaveStateImpl value,
          $Res Function(_$ApplyLeaveStateImpl) then) =
      __$$ApplyLeaveStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OneDayState oneDayState, MultipleDayState multipleDayState});

  @override
  $OneDayStateCopyWith<$Res> get oneDayState;
  @override
  $MultipleDayStateCopyWith<$Res> get multipleDayState;
}

/// @nodoc
class __$$ApplyLeaveStateImplCopyWithImpl<$Res>
    extends _$ApplyLeaveStateCopyWithImpl<$Res, _$ApplyLeaveStateImpl>
    implements _$$ApplyLeaveStateImplCopyWith<$Res> {
  __$$ApplyLeaveStateImplCopyWithImpl(
      _$ApplyLeaveStateImpl _value, $Res Function(_$ApplyLeaveStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oneDayState = null,
    Object? multipleDayState = null,
  }) {
    return _then(_$ApplyLeaveStateImpl(
      oneDayState: null == oneDayState
          ? _value.oneDayState
          : oneDayState // ignore: cast_nullable_to_non_nullable
              as OneDayState,
      multipleDayState: null == multipleDayState
          ? _value.multipleDayState
          : multipleDayState // ignore: cast_nullable_to_non_nullable
              as MultipleDayState,
    ));
  }
}

/// @nodoc

class _$ApplyLeaveStateImpl implements _ApplyLeaveState {
  const _$ApplyLeaveStateImpl(
      {this.oneDayState = const OneDayState(),
      this.multipleDayState = const MultipleDayState()});

  @override
  @JsonKey()
  final OneDayState oneDayState;
  @override
  @JsonKey()
  final MultipleDayState multipleDayState;

  @override
  String toString() {
    return 'ApplyLeaveState(oneDayState: $oneDayState, multipleDayState: $multipleDayState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyLeaveStateImpl &&
            (identical(other.oneDayState, oneDayState) ||
                other.oneDayState == oneDayState) &&
            (identical(other.multipleDayState, multipleDayState) ||
                other.multipleDayState == multipleDayState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oneDayState, multipleDayState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyLeaveStateImplCopyWith<_$ApplyLeaveStateImpl> get copyWith =>
      __$$ApplyLeaveStateImplCopyWithImpl<_$ApplyLeaveStateImpl>(
          this, _$identity);
}

abstract class _ApplyLeaveState implements ApplyLeaveState {
  const factory _ApplyLeaveState(
      {final OneDayState oneDayState,
      final MultipleDayState multipleDayState}) = _$ApplyLeaveStateImpl;

  @override
  OneDayState get oneDayState;
  @override
  MultipleDayState get multipleDayState;
  @override
  @JsonKey(ignore: true)
  _$$ApplyLeaveStateImplCopyWith<_$ApplyLeaveStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
