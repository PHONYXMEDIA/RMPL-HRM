import 'package:formz/formz.dart';

enum DayTypeValidationError {
  required,
  invalid,
}

class DayType extends FormzInput<String?, DayTypeValidationError> {
  const DayType.pure() : super.pure('');

  const DayType.dirty([super.value = '']) : super.dirty();

  static const types = ['full', 'half'];

  @override
  DayTypeValidationError? validator(String? value) {
    if (value == null) return DayTypeValidationError.required;
    if (!types.contains(value.toLowerCase())) {
      return DayTypeValidationError.invalid;
    }
    return null;
  }
}

extension DayTypeValidationErrorX on DayTypeValidationError {
  String get message => switch (this) {
        DayTypeValidationError.required => 'Day type is required',
        DayTypeValidationError.invalid => 'Day type should be full or half',
      };
}
