import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum EmailValidationError {
  required,
  invalid,
}

class Email extends FormzInput<String?, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.required;
    }
    if (!isEmail(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

extension EmailValidationErrorX on EmailValidationError? {
  String? get text => switch (this) {
        EmailValidationError.required => 'Email address is required',
        EmailValidationError.invalid => 'Email address is invalid',
        null => null,
      };
}
