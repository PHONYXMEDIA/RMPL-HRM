import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/features/app/providers/app_providers.dart';
import 'package:rmpl_hrm/features/attendance/attendance.dart';
import 'package:rmpl_hrm/features/attendance/models/attendance.dart' as model;
import 'package:rmpl_hrm/features/auth/providers/auth.dart';
import 'package:rmpl_hrm/features/profile/providers/profile.dart';

part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  AttendanceState build() {
    final stream = ref
        .watch(firestoreProvider)
        .collection('common')
        .doc('attendance')
        .collection(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .doc(ref.watch(authProvider).user.id)
        .snapshots();

    final sub = stream.listen(
      (snapshots) {
        if (!snapshots.exists || snapshots.data() == null) {
          state = const AttendanceState();
        } else {
          final attendance = model.Attendance.fromJson(
            snapshots.data()!,
          );

          state = state.copyWith(
            status:
                (attendance.punchedIn != null && attendance.punchedOut == null)
                    ? AttendanceStatus.punchedIn
                    : (attendance.punchedIn != null &&
                            attendance.punchedOut != null)
                        ? AttendanceStatus.punchedOut
                        : AttendanceStatus.nothing,
            attendance: attendance,
            punchStatus: PunchStatus.success,
          );
        }
      },
    );

    ref.onDispose(sub.cancel);

    return const AttendanceState(punchStatus: PunchStatus.loading);
  }

  Future<void> createAttendance() async {
    state = state.copyWith(punchStatus: PunchStatus.loading);

    try {
      final doc = await ref
          .watch(firestoreProvider)
          .collection('common')
          .doc('attendance')
          .collection(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .doc(ref.read(authProvider).user.id)
          .get();

      if (doc.exists) {
        final attendance = model.Attendance.fromJson(doc.data()!);
        if (attendance.punchedIn != null && attendance.punchedOut == null) {
          await ref
              .read(firestoreProvider)
              .collection('common')
              .doc('attendance')
              .collection(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.now(),
                ),
              )
              .doc(ref.read(authProvider).user.id)
              .update(
            {
              'punchedOut': FieldValue.serverTimestamp(),
            },
          );
        }
      } else {
        await ref
            .read(firestoreProvider)
            .collection('common')
            .doc('attendance')
            .collection(
              DateFormat('yyyy-MM-dd').format(
                DateTime.now(),
              ),
            )
            .doc(ref.read(authProvider).user.id)
            .set(
          {
            'punchedIn': FieldValue.serverTimestamp(),
            'punchedBy': ref
                .read(firestoreProvider)
                .collection('employees')
                .doc(ref.read(authProvider).user.id),
            'under': ref.read(profileProvider).value?.creator,
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      }
      state = state.copyWith(punchStatus: PunchStatus.success);
    } catch (_) {
      state = state.copyWith(punchStatus: PunchStatus.failure);
    }
  }
}
