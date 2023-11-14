import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String?, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length >= 6 == false) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}

extension PasswordValidationMessage on PasswordValidationError {
  String get text {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'Password must be at least 6 characters';
      case PasswordValidationError.empty:
        return 'Please enter a password';
    }
  }
}
