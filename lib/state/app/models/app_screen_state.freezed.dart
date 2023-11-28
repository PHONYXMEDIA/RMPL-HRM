// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppScreenState {
  AppScreen get screen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppScreenStateCopyWith<AppScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppScreenStateCopyWith<$Res> {
  factory $AppScreenStateCopyWith(
          AppScreenState value, $Res Function(AppScreenState) then) =
      _$AppScreenStateCopyWithImpl<$Res, AppScreenState>;
  @useResult
  $Res call({AppScreen screen});
}

/// @nodoc
class _$AppScreenStateCopyWithImpl<$Res, $Val extends AppScreenState>
    implements $AppScreenStateCopyWith<$Res> {
  _$AppScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = freezed,
  }) {
    return _then(_value.copyWith(
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as AppScreen,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppScreenStateImplCopyWith<$Res>
    implements $AppScreenStateCopyWith<$Res> {
  factory _$$AppScreenStateImplCopyWith(_$AppScreenStateImpl value,
          $Res Function(_$AppScreenStateImpl) then) =
      __$$AppScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppScreen screen});
}

/// @nodoc
class __$$AppScreenStateImplCopyWithImpl<$Res>
    extends _$AppScreenStateCopyWithImpl<$Res, _$AppScreenStateImpl>
    implements _$$AppScreenStateImplCopyWith<$Res> {
  __$$AppScreenStateImplCopyWithImpl(
      _$AppScreenStateImpl _value, $Res Function(_$AppScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = freezed,
  }) {
    return _then(_$AppScreenStateImpl(
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as AppScreen,
    ));
  }
}

/// @nodoc

class _$AppScreenStateImpl implements _AppScreenState {
  const _$AppScreenStateImpl({this.screen = AppScreen.dashboard});

  @override
  @JsonKey()
  final AppScreen screen;

  @override
  String toString() {
    return 'AppScreenState(screen: $screen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppScreenStateImpl &&
            const DeepCollectionEquality().equals(other.screen, screen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(screen));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppScreenStateImplCopyWith<_$AppScreenStateImpl> get copyWith =>
      __$$AppScreenStateImplCopyWithImpl<_$AppScreenStateImpl>(
          this, _$identity);
}

abstract class _AppScreenState implements AppScreenState {
  const factory _AppScreenState({final AppScreen screen}) =
      _$AppScreenStateImpl;

  @override
  AppScreen get screen;
  @override
  @JsonKey(ignore: true)
  _$$AppScreenStateImplCopyWith<_$AppScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
