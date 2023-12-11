import 'dart:async';

import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'holiday.g.dart';

@riverpod
Stream<Iterable<Holiday>> holidays(HolidaysRef ref) {
  final profile = ref.watch(profileProvider);
  if (profile == null && profile?.creator == null) {
    return const Stream.empty();
  }

  final date = ref.watch(selectedHolidayProvider);

  return ref
      .watch(firestoreProvider)
      .collection('holidays')
      .where(
        'creator',
        isEqualTo: profile?.creator,
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
class CountHolidays extends _$CountHolidays {
  @override
  int build() {
    final now = ref.watch(currentDateProvider);

    final year = now.year;
    final month = now.month;

    final firstDayOfMonth = DateTime(year, month);
    final lastDayOfMonth = DateTime(year, month + 1, 0);

    var holidays = 0;

    for (var date = firstDayOfMonth;
        date.isBefore(lastDayOfMonth.add(const Duration(days: 1)));
        date = date.add(const Duration(days: 1))) {
      if ((date.weekday == DateTime.sunday) ||
          (date.weekday == DateTime.saturday)) {
        holidays++;
      }
    }

    return holidays;
  }
}
