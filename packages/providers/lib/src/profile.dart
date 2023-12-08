import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  Employee? build() {
    final stream = ref
        .watch(
          firestoreProvider,
        )
        .collection('employees')
        .doc(ref.watch(authProvider).user.id)
        .snapshots();

    final sub = stream.listen((event) {
      if (!event.exists) {
        state = null;
      } else {
        state = Employee.fromJson(event.data()!);
      }
    });

    ref.onDispose(sub.cancel);

    return null;
  }
}

@riverpod
double totalSalary(TotalSalaryRef ref) {
  final hra = ref.watch(profileProvider)?.hra ?? 0;
  final salary = ref.watch(profileProvider)?.basicSalary ?? 0;
  return salary + hra;
}
