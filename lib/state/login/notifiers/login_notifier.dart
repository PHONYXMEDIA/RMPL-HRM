import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/state/auth/notifiers/auth_state_notifier.dart';
import 'package:rmpl_hrm/state/login/models/email.dart';
import 'package:rmpl_hrm/state/login/models/login_state.dart';
import 'package:rmpl_hrm/state/login/models/password.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
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
    state = state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    );
    try {
      await ref
          .read(authStateNotifierProvider.notifier)
          .signInWithEmailAndPassword(
            email: state.email.value!,
            password: state.password.value!,
          );
      state = state.copyWith(
        status: FormzSubmissionStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: FormzSubmissionStatus.failure,
      );
    }
  }
}
