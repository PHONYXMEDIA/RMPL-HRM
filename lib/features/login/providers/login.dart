import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/features/auth/providers/auth.dart';
import 'package:rmpl_hrm/features/login/exceptions/log_in_with_email_and_password_failure.dart';
import 'package:rmpl_hrm/features/login/models/email.dart';

import '../models/login_state.dart';
import '../models/password.dart';

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
