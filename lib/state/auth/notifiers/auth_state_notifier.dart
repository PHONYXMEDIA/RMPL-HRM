import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/auth/backend/authenticator.dart';
import 'package:rmpl_hrm/state/auth/models/auth_state.dart';

part 'auth_state_notifier.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  final _authenticator = const Authenticator();

  @override
  Stream<AuthState> build() async* {
    yield const AuthState();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    if (_authenticator.isSignedIn == false) {
      yield AuthState.unauthenticated();
    } else {
      yield AuthState.authenticated(
        userId: _authenticator.userId ?? '',
      );
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = AsyncData(
      state.requireValue.copyWith(
        isLoading: true,
      ),
    );

    try {
      await _authenticator.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = AsyncData(
        AuthState.authenticated(
          userId: _authenticator.userId ?? '',
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> logOut() async {
    await _authenticator.logOut();
    state = AsyncValue.data(
      AuthState.unauthenticated(),
    );
  }
}
