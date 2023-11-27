import 'package:flutter/foundation.dart' show immutable;

@immutable
class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'Login failed',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'invalid_login_credentials':
        return const LogInWithEmailAndPasswordFailure(
          'You have entered an invalid email or password.',
        );
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      case 'channel-error':
        return const LogInWithEmailAndPasswordFailure(
          'Something went wrong, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}
