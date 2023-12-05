import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_day_type.g.dart';

enum DayTypeStatus {
  oneDay,
  multipleDay,
}

extension DayTypeStatusX on DayTypeStatus {
  bool get isOneDay => this == DayTypeStatus.oneDay;

  bool get isMultipleDay => this == DayTypeStatus.multipleDay;
}

@riverpod
class SelectedDayType extends _$SelectedDayType {
  @override
  DayTypeStatus build() => DayTypeStatus.oneDay;

  void onChange(DayTypeStatus type) => state = type;
}
