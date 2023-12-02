import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/apply_leave/models/apply_leave_state.dart';
import 'package:rmpl_hrm/state/apply_leave/models/date.dart';
import 'package:rmpl_hrm/state/apply_leave/models/day_type.dart';
import 'package:rmpl_hrm/state/apply_leave/models/leave_type.dart';
import 'package:rmpl_hrm/state/apply_leave/models/reason.dart';
import 'package:rmpl_hrm/state/leave/providers/leave.dart';

part 'apply_leave.g.dart';

@riverpod
class ApplyLeave extends _$ApplyLeave {
  @override
  ApplyLeaveState build() => const ApplyLeaveState();

  void dateChanged(String? value) {
    final date = Date.dirty(value);
    state = state.copyWith.oneDayState(
      date: date,
      isValid: Formz.validate(
        [
          date,
          state.oneDayState.dayType,
          state.oneDayState.leaveType,
          state.oneDayState.reason,
        ],
      ),
    );
  }

  void fromDateChanged(String? value) {
    final date = Date.dirty(value);
    state = state.copyWith.multipleDayState(
      fromDate: date,
      isValid: Formz.validate(
        [
          date,
          state.multipleDayState.toDate,
          state.multipleDayState.leaveType,
          state.multipleDayState.reason,
        ],
      ),
    );
  }

  void toDateChanged(String? value) {
    final date = Date.dirty(value);
    state = state.copyWith.multipleDayState(
      toDate: date,
      isValid: Formz.validate(
        [
          state.multipleDayState.fromDate,
          date,
          state.multipleDayState.leaveType,
          state.multipleDayState.reason,
        ],
      ),
    );
  }

  void dayTypeChanged(String? value) {
    final dayType = DayType.dirty(value);
    state = state.copyWith.oneDayState(
      dayType: dayType,
      isValid: Formz.validate(
        [
          state.oneDayState.date,
          dayType,
          state.oneDayState.leaveType,
          state.oneDayState.reason,
        ],
      ),
    );
  }

  void leaveTypeChanged(String? value) {
    final leaveType = LeaveType.dirty(value);
    state = state.copyWith.oneDayState(
      leaveType: leaveType,
      isValid: Formz.validate(
        [
          state.oneDayState.date,
          state.oneDayState.dayType,
          leaveType,
          state.oneDayState.reason,
        ],
      ),
    );
    state = state.copyWith.multipleDayState(
      leaveType: leaveType,
      isValid: Formz.validate(
        [
          state.multipleDayState.fromDate,
          state.multipleDayState.toDate,
          leaveType,
          state.multipleDayState.reason,
        ],
      ),
    );
  }

  void reasonChanged(String? value) {
    final reason = Reason.dirty(value);
    state = state.copyWith.oneDayState(
      reason: reason,
      isValid: Formz.validate(
        [
          state.oneDayState.date,
          state.oneDayState.dayType,
          state.oneDayState.leaveType,
          reason,
        ],
      ),
    );
    state = state.copyWith.multipleDayState(
      reason: reason,
      isValid: Formz.validate(
        [
          state.multipleDayState.fromDate,
          state.multipleDayState.toDate,
          state.multipleDayState.leaveType,
          reason,
        ],
      ),
    );
  }

  Future<void> submit() async {
    if (!state.oneDayState.isValid && !state.multipleDayState.isValid) return;
    state = state.copyWith.oneDayState(
      status: FormzSubmissionStatus.inProgress,
    );
    state = state.copyWith.multipleDayState(
      status: FormzSubmissionStatus.inProgress,
    );
    try {
      await ref.read(leaveProvider.notifier).applyLeave();
      state = state.copyWith.oneDayState(
        status: FormzSubmissionStatus.success,
      );
      state = state.copyWith.multipleDayState(
        status: FormzSubmissionStatus.success,
      );
    } catch (e) {
      state = state.copyWith.oneDayState(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      );
      state = state.copyWith.multipleDayState(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
