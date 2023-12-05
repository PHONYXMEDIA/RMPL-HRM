import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_holiday.g.dart';

@riverpod
class SelectedHoliday extends _$SelectedHoliday {
  @override
  DateTime build() => DateTime.now();

  void onChange(DateTime value) => state = value;
}
