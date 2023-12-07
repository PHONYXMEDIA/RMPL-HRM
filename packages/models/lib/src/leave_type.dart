import 'package:formz/formz.dart';

enum LeaveTypeValidationError {
  required,
  invalid,
}

class LeaveType extends FormzInput<String?, LeaveTypeValidationError> {
  const LeaveType.pure() : super.pure('');

  const LeaveType.dirty([super.value = '']) : super.dirty();

  static const types = [
    'sick',
    'vacation',
    'personal',
    'casual',
  ];

  @override
  LeaveTypeValidationError? validator(String? value) {
    if (value == null) return LeaveTypeValidationError.required;
    if (!types.contains(value.toLowerCase())) {
      return LeaveTypeValidationError.invalid;
    }
    return null;
  }
}

extension LeaveTypeValidationErrorX on LeaveTypeValidationError {
  String get text => switch (this) {
        LeaveTypeValidationError.required => 'Leave type is required',
        LeaveTypeValidationError.invalid =>
          'Leave type should be one of: sick, vacation, personal, casual',
      };
}
