// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalaryDetail _$SalaryDetailFromJson(Map<String, dynamic> json) {
  return _SalaryDetail.fromJson(json);
}

/// @nodoc
mixin _$SalaryDetail {
  double? get amount => throw _privateConstructorUsedError;
  DateTime? get bonus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryDetailCopyWith<SalaryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryDetailCopyWith<$Res> {
  factory $SalaryDetailCopyWith(
          SalaryDetail value, $Res Function(SalaryDetail) then) =
      _$SalaryDetailCopyWithImpl<$Res, SalaryDetail>;
  @useResult
  $Res call({double? amount, DateTime? bonus, DateTime? createdAt});
}

/// @nodoc
class _$SalaryDetailCopyWithImpl<$Res, $Val extends SalaryDetail>
    implements $SalaryDetailCopyWith<$Res> {
  _$SalaryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? bonus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryDetailImplCopyWith<$Res>
    implements $SalaryDetailCopyWith<$Res> {
  factory _$$SalaryDetailImplCopyWith(
          _$SalaryDetailImpl value, $Res Function(_$SalaryDetailImpl) then) =
      __$$SalaryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? amount, DateTime? bonus, DateTime? createdAt});
}

/// @nodoc
class __$$SalaryDetailImplCopyWithImpl<$Res>
    extends _$SalaryDetailCopyWithImpl<$Res, _$SalaryDetailImpl>
    implements _$$SalaryDetailImplCopyWith<$Res> {
  __$$SalaryDetailImplCopyWithImpl(
      _$SalaryDetailImpl _value, $Res Function(_$SalaryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? bonus = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$SalaryDetailImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      bonus: freezed == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@TimestampConverter()
@DocumentReferenceConverter()
class _$SalaryDetailImpl implements _SalaryDetail {
  const _$SalaryDetailImpl({this.amount, this.bonus, this.createdAt});

  factory _$SalaryDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryDetailImplFromJson(json);

  @override
  final double? amount;
  @override
  final DateTime? bonus;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SalaryDetail(amount: $amount, bonus: $bonus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryDetailImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, bonus, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryDetailImplCopyWith<_$SalaryDetailImpl> get copyWith =>
      __$$SalaryDetailImplCopyWithImpl<_$SalaryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryDetailImplToJson(
      this,
    );
  }
}

abstract class _SalaryDetail implements SalaryDetail {
  const factory _SalaryDetail(
      {final double? amount,
      final DateTime? bonus,
      final DateTime? createdAt}) = _$SalaryDetailImpl;

  factory _SalaryDetail.fromJson(Map<String, dynamic> json) =
      _$SalaryDetailImpl.fromJson;

  @override
  double? get amount;
  @override
  DateTime? get bonus;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SalaryDetailImplCopyWith<_$SalaryDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
