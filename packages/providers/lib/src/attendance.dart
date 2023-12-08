import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart' as a;
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  a.AttendanceState build() {
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
          state = const a.AttendanceState();
        } else {
          final attendance = a.Attendance.fromJson(
            snapshots.data()!,
          );

          state = state.copyWith(
            status:
                (attendance.punchedIn != null && attendance.punchedOut == null)
                    ? a.AttendanceStatus.punchedIn
                    : (attendance.punchedIn != null &&
                            attendance.punchedOut != null)
                        ? a.AttendanceStatus.punchedOut
                        : a.AttendanceStatus.nothing,
            attendance: attendance,
            punchStatus: a.PunchStatus.success,
          );
        }
      },
    );

    ref.onDispose(sub.cancel);

    return const a.AttendanceState(punchStatus: a.PunchStatus.loading);
  }

  Future<void> createAttendance() async {
    state = state.copyWith(punchStatus: a.PunchStatus.loading);

    try {
      final doc = await ref
          .watch(firestoreProvider)
          .collection('common')
          .doc('attendance')
          .collection(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .doc(ref.read(authProvider).user.id)
          .get();

      if (doc.exists) {
        final attendance = a.Attendance.fromJson(doc.data()!);
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
            'under': ref.read(profileProvider)?.creator,
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      }
      state = state.copyWith(punchStatus: a.PunchStatus.success);
    } catch (_) {
      state = state.copyWith(punchStatus: a.PunchStatus.failure);
    }
  }
}
