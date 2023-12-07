import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_leave_date.g.dart';

@riverpod
class SelectedLeaveTime extends _$SelectedLeaveTime {
  @override
  DateTime build() => DateTime.now();

  void onChange(DateTime value) => state = value;
}
