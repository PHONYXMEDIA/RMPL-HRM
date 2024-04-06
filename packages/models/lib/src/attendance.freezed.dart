// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get punchedIn => throw _privateConstructorUsedError;
  DateTime? get punchedOut => throw _privateConstructorUsedError;
  DocumentReference<Object?>? get punchedBy =>
      throw _privateConstructorUsedError;
  DocumentReference<Object?>? get under => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? punchedIn,
      DateTime? punchedOut,
      DocumentReference<Object?>? punchedBy,
      DocumentReference<Object?>? under});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? punchedIn = freezed,
    Object? punchedOut = freezed,
    Object? punchedBy = freezed,
    Object? under = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedIn: freezed == punchedIn
          ? _value.punchedIn
          : punchedIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedOut: freezed == punchedOut
          ? _value.punchedOut
          : punchedOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedBy: freezed == punchedBy
          ? _value.punchedBy
          : punchedBy // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      under: freezed == under
          ? _value.under
          : under // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? punchedIn,
      DateTime? punchedOut,
      DocumentReference<Object?>? punchedBy,
      DocumentReference<Object?>? under});
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? punchedIn = freezed,
    Object? punchedOut = freezed,
    Object? punchedBy = freezed,
    Object? under = freezed,
  }) {
    return _then(_$AttendanceImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedIn: freezed == punchedIn
          ? _value.punchedIn
          : punchedIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedOut: freezed == punchedOut
          ? _value.punchedOut
          : punchedOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      punchedBy: freezed == punchedBy
          ? _value.punchedBy
          : punchedBy // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      under: freezed == under
          ? _value.under
          : under // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@TimestampConverter()
@DocumentReferenceConverter()
class _$AttendanceImpl implements _Attendance {
  const _$AttendanceImpl(
      {this.createdAt,
      this.punchedIn,
      this.punchedOut,
      this.punchedBy,
      this.under});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? punchedIn;
  @override
  final DateTime? punchedOut;
  @override
  final DocumentReference<Object?>? punchedBy;
  @override
  final DocumentReference<Object?>? under;

  @override
  String toString() {
    return 'Attendance(createdAt: $createdAt, punchedIn: $punchedIn, punchedOut: $punchedOut, punchedBy: $punchedBy, under: $under)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.punchedIn, punchedIn) ||
                other.punchedIn == punchedIn) &&
            (identical(other.punchedOut, punchedOut) ||
                other.punchedOut == punchedOut) &&
            (identical(other.punchedBy, punchedBy) ||
                other.punchedBy == punchedBy) &&
            (identical(other.under, under) || other.under == under));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, punchedIn, punchedOut, punchedBy, under);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {final DateTime? createdAt,
      final DateTime? punchedIn,
      final DateTime? punchedOut,
      final DocumentReference<Object?>? punchedBy,
      final DocumentReference<Object?>? under}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get punchedIn;
  @override
  DateTime? get punchedOut;
  @override
  DocumentReference<Object?>? get punchedBy;
  @override
  DocumentReference<Object?>? get under;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
