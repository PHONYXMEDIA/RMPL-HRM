import 'package:models/models.dart' as model;
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification.g.dart';

@riverpod
class Notification extends _$Notification {
  @override
  Stream<Iterable<model.Notification>> build() => ref
      .watch(
        firestoreProvider,
      )
      .collection('notifications')
      .orderBy('createdAt', descending: true)
      .where(
        'isVisible',
        isEqualTo: true,
      )
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) => model.Notification.fromJson(
            doc.data(),
          ),
        ),
      );
}
