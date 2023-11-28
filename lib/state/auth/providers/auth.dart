import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/app/providers/app_providers.dart';
import 'package:rmpl_hrm/state/auth/models/auth_state.dart';
import 'package:rmpl_hrm/state/auth/models/user.dart';
import 'package:rmpl_hrm/state/login/exceptions/log_in_with_email_and_password_failure.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    final stream = ref.watch(firebaseAuthProvider).authStateChanges();
    final sub = stream.listen(
      (currentUser) {
        if (currentUser == null) {
          state = AuthState.unauthenticated();
        } else {
          state = AuthState.authenticated(user: currentUser.toUser!);
        }
      },
    );
    ref.onDispose(sub.cancel);
    return const AuthState();
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await ref
          .read(
            firebaseAuthProvider,
          )
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logout() async {
    await ref.read(firebaseAuthProvider).signOut();
  }
}
