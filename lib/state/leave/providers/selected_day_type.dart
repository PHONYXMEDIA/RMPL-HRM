import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_day_type.g.dart';

enum DayType {
  oneDay,
  multipleDay,
}

extension DayTypeX on DayType {
  bool get isOneDay => this == DayType.oneDay;

  bool get isMultipleDay => this == DayType.multipleDay;
}

@riverpod
class SelectedDayType extends _$SelectedDayType {
  @override
  DayType build() => DayType.oneDay;

  void onChange(DayType type) => state = type;
}
