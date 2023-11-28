import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/app/providers/app_providers.dart';
import 'package:rmpl_hrm/state/leave/models/leave.dart' as model;

part 'leave.g.dart';

@riverpod
class Leave extends _$Leave {
  @override
  Stream<Iterable<model.Leave>> build() => ref
      .watch(
        firestoreProvider,
      )
      .collection('leave')
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
