import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/app/providers/app_providers.dart';
import 'package:rmpl_hrm/state/leave/models/leave.dart' as model;
import 'package:rmpl_hrm/state/leave/providers/selected_leave_date.dart';

part 'leave.g.dart';

@riverpod
class Leave extends _$Leave {
  @override
  Stream<Iterable<model.Leave>> build() => ref
      .watch(
        firestoreProvider,
      )
      .collection('leave')
      .where(
        'date',
        isGreaterThanOrEqualTo: DateTime(
          ref.watch(selectedLeaveTimeProvider).year,
          ref.watch(selectedLeaveTimeProvider).month,
        ),
        isLessThanOrEqualTo: DateTime(
          ref.watch(selectedLeaveTimeProvider).year,
          ref.watch(selectedLeaveTimeProvider).month + 1,
          0,
        ),
      )
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => model.Leave.fromJson(
            doc.data(),
          ),
        ),
      );

  Future<void> applyLeave() async {}
}
