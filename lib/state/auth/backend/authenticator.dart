import 'package:firebase_auth/firebase_auth.dart';
import 'package:rmpl_hrm/state/auth/exceptions/login_with_email_and_password_failure.dart';
import 'package:rmpl_hrm/state/auth/models/auth_status.dart';

class Authenticator {
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  String? get email => FirebaseAuth.instance.currentUser?.email;

  bool? get isSignedIn => userId != null;

  Future<AuthStatus> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthStatus.authenticated;
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() => FirebaseAuth.instance.signOut();

  const Authenticator();
}
