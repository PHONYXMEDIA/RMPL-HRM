import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as f show User;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    final stream = ref.watch(firebaseAuthProvider).authStateChanges();

    StreamSubscription<f.User?>? sub;

    Timer(const Duration(seconds: 2), () {
      sub = stream.listen(
        (currentUser) {
          if (currentUser == null) {
            state = AuthState.unauthenticated();
          } else {
            state = AuthState.authenticated(user: currentUser.toUser!);
          }
        },
      );
    });

    ref.onDispose(() {
      sub?.cancel();
    });

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
