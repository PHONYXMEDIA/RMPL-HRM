import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/app/providers/app_providers.dart';
import 'package:rmpl_hrm/state/holiday/models/holiday.dart' as model;
import 'package:rmpl_hrm/state/profile/providers/profile.dart';

part 'holiday.g.dart';

@riverpod
Stream<Iterable<model.Holiday>> holidays(HolidaysRef ref) {
  final profile = ref.watch(profileProvider);
  if (!profile.hasValue &&
      profile.value == null &&
      profile.value?.creator == null) {
    return const Stream.empty();
  }

  return ref
      .watch(firestoreProvider)
      .collection('holidays')
      .where(
        'creator',
        isEqualTo: profile.requireValue!.creator!,
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
