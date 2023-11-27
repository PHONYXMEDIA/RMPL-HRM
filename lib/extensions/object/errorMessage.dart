import 'package:rmpl_hrm/state/auth/exceptions/login_with_email_and_password_failure.dart';

extension ExtractErrorMessage on Object? {
  String get text {
    final error = this;
    late String message;
    if (error is LogInWithEmailAndPasswordFailure) {
      message = error.message;
    } else if (error is Exception) {
      message = error.toString();
    } else {
      message = 'Unknown error';
    }
    return message;
  }
}
