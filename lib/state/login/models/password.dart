import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  invalid,
}

class Password extends FormzInput<String?, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 6) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}

extension PasswordValidationErrorX on PasswordValidationError? {
  String? get text => switch (this) {
        PasswordValidationError.empty => 'Please enter your password',
        PasswordValidationError.invalid =>
          'Password must be at least 6 characters long',
        null => null,
      };
}
