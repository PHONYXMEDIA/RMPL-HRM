import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum DateValidationError {
  required,
  invalid,
}

class Date extends FormzInput<String?, DateValidationError> {
  const Date.pure() : super.pure('');

  const Date.dirty([super.value = '']) : super.dirty();

  @override
  DateValidationError? validator(String? value) {
    if (value == null) return DateValidationError.required;
    if (!isDate(value)) return DateValidationError.invalid;
    return null;
  }
}

extension DateValidationErrorX on DateValidationError {
  String get text => switch (this) {
        DateValidationError.required => 'This date is required',
        DateValidationError.invalid => 'This date is invalid',
      };
}
