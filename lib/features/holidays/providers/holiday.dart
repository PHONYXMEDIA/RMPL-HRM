import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/features/app/providers/app_providers.dart';
import 'package:rmpl_hrm/features/holidays/models/holiday.dart' as model;
import 'package:rmpl_hrm/features/holidays/providers/selected_holiday.dart';
import 'package:rmpl_hrm/features/profile/providers/profile.dart';

part 'holiday.g.dart';

@riverpod
Stream<Iterable<model.Holiday>> holidays(HolidaysRef ref) {
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
          (doc) => model.Holiday.fromJson(
            doc.data(),
          ),
        ),
      );
}
