import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/core/providers/current_date.dart';
import 'package:rmpl_hrm/features/app/app.dart';
import 'package:rmpl_hrm/features/holidays/holidays.dart';
import 'package:rmpl_hrm/features/profile/profile.dart';

part 'holiday.g.dart';

@riverpod
Stream<Iterable<Holiday>> holidays(HolidaysRef ref) {
  final profile = ref.watch(profileProvider);
  if (!profile.hasValue &&
      profile.value == null &&
      profile.value?.creator == null) {
    return const Stream.empty();
  }

  final date = ref.watch(selectedHolidayProvider);

  return ref
      .watch(firestoreProvider)
      .collection('holidays')
      .where(
        'creator',
        isEqualTo: profile.requireValue!.creator!,
      )
      .where(
        'date',
        isGreaterThanOrEqualTo: DateTime(
          date.year,
          date.month,
        ),
        isLessThanOrEqualTo: DateTime(
          date.year,
          date.month + 1,
          0,
        ),
      )
      .snapshots()
      .map((snapshots) => snapshots.docs)
      .map(
        (docs) => docs.map(
          (doc) => Holiday.fromJson(
            doc.data(),
          ),
        ),
      );
}

@riverpod
int countHolidays(CountHolidaysRef ref) {
  final now = ref.watch(currentDateProvider);

  final year = now.year;
  final month = now.month;

  final firstDayOfMonth = DateTime(year, month, 1);
  final lastDayOfMonth = DateTime(year, month + 1, 0);

  int holidays = 0;

  for (DateTime date = firstDayOfMonth;
      date.isBefore(lastDayOfMonth.add(const Duration(days: 1)));
      date = date.add(const Duration(days: 1))) {
    if ((date.weekday == DateTime.sunday) ||
        (date.weekday == DateTime.saturday)) {
      holidays++;
    }
  }

  return holidays;
}
