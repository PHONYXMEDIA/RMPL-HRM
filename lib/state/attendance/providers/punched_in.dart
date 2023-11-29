import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/attendance/providers/attendance.dart';

part 'punched_in.g.dart';

@riverpod
String punchedIn(PunchedInRef ref) {
  final attendance = ref.watch(attendanceProvider).attendance;
  if (attendance == null || attendance.punchedIn == null) return 'N/A';
  return DateFormat.jm().format(attendance.punchedIn!);
}
