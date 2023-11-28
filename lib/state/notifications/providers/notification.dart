import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/app/providers/app_providers.dart';
import 'package:rmpl_hrm/state/notifications/models/notification.dart' as model;

part 'notification.g.dart';

@riverpod
class Notification extends _$Notification {
  @override
  Stream<Iterable<model.Notification>> build() => ref
      .watch(
        firestoreProvider,
      )
      .collection('notifications')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => model.Notification.fromJson(
            doc.data(),
          ),
        ),
      );
}
