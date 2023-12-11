import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/models.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(User.empty) User user,
  }) = _AuthState;

  factory AuthState.authenticated({
    required User user,
  }) =>
      AuthState(
        status: AuthStatus.authenticated,
        user: user,
      );

  factory AuthState.unauthenticated() => const AuthState(
        status: AuthStatus.unauthenticated,
      );
}
