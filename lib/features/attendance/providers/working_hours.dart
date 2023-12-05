import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/features/attendance/providers/attendance.dart';

part 'working_hours.g.dart';

@riverpod
String workingHours(WorkingHoursRef ref) {
  final attendance = ref.watch(attendanceProvider).attendance;
  final punchedIn = attendance?.punchedIn;
  final punchedOut = attendance?.punchedOut;
  final start = punchedIn?.format.parsedFormat;
  DateTime? end = punchedOut?.format.parsedFormat;

  String workingHours = 'N/A';
  if ((start != null && end != null) && end.isAfter(start)) {
    end = end.add(const Duration(days: 0));
    final diff = end.difference(start).abs();
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    workingHours = '${hours.timeFormat}:${minutes.timeFormat} Hrs';
  }
  return workingHours;
}

extension on DateTime {
  String get format => DateFormat('HH:mm').format(this);
}

extension on String {
  DateTime get parsedFormat => DateFormat('HH:mm').parse(this);
}

extension on int {
  String get timeFormat => NumberFormat('00').format(this);
}
