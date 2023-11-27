import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum EmailValidationError {
  empty,
  invalid,
}

class Email extends FormzInput<String?, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!isEmail(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

extension EmailValidationErrorX on EmailValidationError? {
  String? get text => switch (this) {
        EmailValidationError.empty => 'Please enter your email',
        EmailValidationError.invalid => 'Please enter a valid email',
        null => null,
      };
}
