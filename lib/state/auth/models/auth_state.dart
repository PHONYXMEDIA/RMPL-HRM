import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/state/auth/models/auth_status.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(false) bool isLoading,
    String? userId,
  }) = _AuthState;

  factory AuthState.authenticated({
    required String userId,
  }) =>
      AuthState(
        status: AuthStatus.authenticated,
        isLoading: false,
        userId: userId,
      );

  factory AuthState.unauthenticated() => const AuthState(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        userId: null,
      );
}
