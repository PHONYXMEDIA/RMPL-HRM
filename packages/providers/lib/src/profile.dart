import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile.g.dart';

@riverpod
Stream<Employee?> profile(ProfileRef ref) {
  return ref
      .watch(
        firestoreProvider,
      )
      .collection('employees')
      .doc(ref.watch(authProvider).user.id)
      .snapshots()
      .map(
        (doc) => Employee.fromJson(
          doc.data()!,
        ),
      );
}
