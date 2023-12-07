import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'attendance_state.freezed.dart';

enum PunchStatus {
  initial,
  loading,
  success,
  failure,
}

enum AttendanceStatus {
  nothing,
  punchedIn,
  punchedOut,
}

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    @Default(AttendanceStatus.nothing) AttendanceStatus status,
    @Default(PunchStatus.initial) PunchStatus? punchStatus,
    Attendance? attendance,
  }) = _AttendanceState;
}

extension AttendanceStatusX on AttendanceStatus? {
  bool get isNothing => this == AttendanceStatus.nothing;

  bool get isPunchedIn => this == AttendanceStatus.punchedIn;

  bool get isPunchedOut => this == AttendanceStatus.punchedOut;
}

extension PunchStatusX on PunchStatus? {
  bool get isInitial => this == PunchStatus.initial;

  bool get isLoading => this == PunchStatus.loading;

  bool get isSuccess => this == PunchStatus.success;

  bool get isFailure => this == PunchStatus.failure;
}
