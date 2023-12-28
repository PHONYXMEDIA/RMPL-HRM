import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:formz/formz.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() => const LoginState();

  void updateEmail(String? value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate(
        [
          email,
          state.password,
        ],
      ),
    );
  }

  void updatePassword(String? value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: Formz.validate(
        [
          state.email,
          password,
        ],
      ),
    );
  }

  Future<void> onSubmit() async {
    if (!state.isValid) return;
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);
    try {
      await ref.read(authProvider.notifier).loginWithEmailAndPassword(
            email: state.email.value!,
            password: state.password.value!,
          );
      state = state.copyWith(status: FormzSubmissionStatus.success);
      final user = ref.watch(firebaseAuthProvider).currentUser;
      if (user != null) {
        final token = await FirebaseMessaging.instance.getToken();
        await ref
            .read(firestoreProvider)
            .collection('employees')
            .doc(user.uid)
            .update({
          'tokens': FieldValue.arrayUnion([token]),
        });
      }
    } on LogInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(status: FormzSubmissionStatus.failure);
    }
  }
}
