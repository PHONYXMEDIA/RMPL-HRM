import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'date.dart';
import 'day_type.dart';
import 'leave_type.dart';
import 'reason.dart';

part 'apply_leave_state.freezed.dart';

@freezed
class OneDayState with _$OneDayState {
  const factory OneDayState({
    @Default(Date.pure()) Date date,
    @Default(DayType.pure()) DayType dayType,
    @Default(LeaveType.pure()) LeaveType leaveType,
    @Default(Reason.pure()) Reason reason,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _OneDayState;
}

@freezed
class MultipleDayState with _$MultipleDayState {
  const factory MultipleDayState({
    @Default(Date.pure()) Date fromDate,
    @Default(Date.pure()) Date toDate,
    @Default(LeaveType.pure()) LeaveType leaveType,
    @Default(Reason.pure()) Reason reason,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _MultipleDayState;
}

@freezed
class ApplyLeaveState with _$ApplyLeaveState {
  const factory ApplyLeaveState({
    @Default(OneDayState()) OneDayState oneDayState,
    @Default(MultipleDayState()) MultipleDayState multipleDayState,
  }) = _ApplyLeaveState;
}
