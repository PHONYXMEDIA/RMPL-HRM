import 'package:formz/formz.dart';

enum ReasonValidationError {
  required,
  invalid,
}

class Reason extends FormzInput<String?, ReasonValidationError> {
  const Reason.pure() : super.pure('');

  const Reason.dirty([super.value = '']) : super.dirty();

  @override
  ReasonValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ReasonValidationError.required;
    if (value.length < 3) return ReasonValidationError.invalid;
    return null;
  }
}

extension ReasonValidationErrorX on ReasonValidationError {
  String get text => switch (this) {
        ReasonValidationError.required => 'Please enter a reason',
        ReasonValidationError.invalid =>
          'Reason must be at least 3 characters long',
      };
}
