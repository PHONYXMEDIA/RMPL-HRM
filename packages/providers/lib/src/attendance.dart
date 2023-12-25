import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart' as a;
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  a.AttendanceState build() {
    final date = ref.watch(currentDateProvider);
    final stream = ref
        .watch(firestoreProvider)
        .collection('common')
        .doc('attendance')
        .collection(ref.watch(authProvider).user.id)
        .doc('${date.year}')
        .collection('${date.month}')
        .doc('${date.day}')
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
      final date = ref.watch(currentDateProvider);

      final doc = await ref
          .watch(firestoreProvider)
          .collection('common')
          .doc('attendance')
          .collection(ref.watch(authProvider).user.id)
          .doc('${date.year}')
          .collection('${date.month}')
          .doc('${date.day}')
          .get();

      if (doc.exists) {
        final attendance = a.Attendance.fromJson(doc.data()!);
        if (attendance.punchedIn != null && attendance.punchedOut == null) {
          await ref
              .read(firestoreProvider)
              .collection('common')
              .doc('attendance')
              .collection(ref.watch(authProvider).user.id)
              .doc('${date.year}')
              .collection('${date.month}')
              .doc('${date.day}')
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
            .collection(ref.watch(authProvider).user.id)
            .doc('${date.year}')
            .collection('${date.month}')
            .doc('${date.day}')
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

@riverpod
class AttendanceCount extends _$AttendanceCount {
  @override
  int build() {
    final date = ref.watch(currentDateProvider);

    final stream = ref
        .watch(firestoreProvider)
        .collection('common')
        .doc('attendance')
        .collection(ref.watch(authProvider).user.id)
        .doc('${date.year}')
        .collection('${date.month}')
        .snapshots();

    final sub = stream.listen((event) {
      state = event.docs.length;
    });

    ref.onDispose(sub.cancel);

    return 0;
  }
}

@riverpod
int workingDayCount(WorkingDayCountRef ref) {
  final totalDays = ref.watch(totalDaysInMonthProvider);
  final holidays = ref.watch(countHolidaysProvider);
  final leave = ref.watch(countLeaveProvider);
  final remaining = totalDays - holidays - leave;
  return remaining < 0 ? 0 : remaining;
}

@riverpod
int absenceCount(AbsenceCountRef ref) {
  final totalWorkingDays = ref.watch(workingDayCountProvider);
  final presentDays = ref.watch(attendanceCountProvider);
  final holidays = ref.watch(countHolidaysProvider);
  final leaves = ref.watch(countLeaveProvider);

  final absent = totalWorkingDays - presentDays - holidays - leaves;

  return absent;
}
