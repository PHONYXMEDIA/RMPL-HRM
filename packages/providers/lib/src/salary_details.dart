import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'salary_details.g.dart';

@riverpod
class SalaryDetails extends _$SalaryDetails {
  @override
  Stream<Iterable<SalaryDetail>> build() => ref
      .watch(firestoreProvider)
      .collection('salary')
      .doc(ref.watch(profileProvider)?.uid)
      .collection('details')
      .snapshots()
      .map(
        (event) => event.docs.map(
          (e) => SalaryDetail.fromJson(
            e.data(),
          ),
        ),
      );
}
