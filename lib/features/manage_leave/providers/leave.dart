import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/core/providers/current_date.dart';
import 'package:rmpl_hrm/features/app/providers/app_providers.dart';
import 'package:rmpl_hrm/features/apply_leave/providers/apply_leave.dart';
import 'package:rmpl_hrm/features/auth/providers/auth.dart';
import 'package:rmpl_hrm/features/manage_leave/models/leave.dart' as model;
import 'package:rmpl_hrm/features/manage_leave/providers/selected_day_type.dart';
import 'package:rmpl_hrm/features/manage_leave/providers/selected_leave_date.dart';

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
        'uid',
        isEqualTo: ref
            .watch(
              firestoreProvider,
            )
            .collection('employees')
            .doc(
              ref
                  .watch(
                    authProvider,
                  )
                  .user
                  .id,
            ),
      )
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

  Future<void> applyLeave() async {
    if (ref.read(selectedDayTypeProvider).isOneDay) {
      await ref
          .read(
            firestoreProvider,
          )
          .collection('leave')
          .add(
        {
          'date': Timestamp.fromDate(
            DateTime.parse(
              ref.read(applyLeaveProvider).oneDayState.date.value!,
            ),
          ),
          'dayType': ref.read(applyLeaveProvider).oneDayState.dayType.value!,
          'leaveType':
              ref.read(applyLeaveProvider).oneDayState.leaveType.value!,
          'reason': ref.read(applyLeaveProvider).oneDayState.reason.value!,
          'createdAt': FieldValue.serverTimestamp(),
          'status': 'pending',
          'uid': ref
              .read(firestoreProvider)
              .collection(
                'employees',
              )
              .doc(
                ref.read(authProvider).user.id,
              ),
        },
      );
    }
    if (ref.read(selectedDayTypeProvider).isMultipleDay) {
      await ref.read(firestoreProvider).collection('leave').add(
        {
          'date': Timestamp.fromDate(
            DateTime.parse(
              ref.read(applyLeaveProvider).multipleDayState.fromDate.value!,
            ),
          ),
          'toDate': Timestamp.fromDate(
            DateTime.parse(
              ref.read(applyLeaveProvider).multipleDayState.toDate.value!,
            ),
          ),
          'leaveType':
              ref.read(applyLeaveProvider).multipleDayState.leaveType.value!,
          'reason': ref.read(applyLeaveProvider).multipleDayState.reason.value!,
          'status': 'pending',
          'createdAt': FieldValue.serverTimestamp(),
          'uid': ref
              .read(firestoreProvider)
              .collection(
                'employees',
              )
              .doc(
                ref.read(authProvider).user.id,
              ),
        },
      );
    }
  }
}

@riverpod
Future<int> countLeave(CountLeaveRef ref) async {
  int leaveCount = 0;
  try {
    final result = await ref
        .watch(
          firestoreProvider,
        )
        .collection('leave')
        .where(
          'uid',
          isEqualTo: ref
              .watch(
                firestoreProvider,
              )
              .collection('employees')
              .doc(
                ref
                    .watch(
                      authProvider,
                    )
                    .user
                    .id,
              ),
        )
        .where(
          'date',
          isGreaterThanOrEqualTo: DateTime(
            ref.watch(currentDateProvider).year,
            ref.watch(currentDateProvider).month,
          ),
          isLessThanOrEqualTo: DateTime(
            ref.watch(currentDateProvider).year,
            ref.watch(currentDateProvider).month + 1,
            0,
          ),
        )
        .get();

    leaveCount = result.docs
        .map((e) => model.Leave.fromJson(e.data()))
        .where((e) => e.status?.toLowerCase() == 'approved')
        .length;
  } catch (_) {
    leaveCount = 0;
  }

  return leaveCount;
}
