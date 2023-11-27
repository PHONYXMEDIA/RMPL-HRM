import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/state/login/providers/login.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loginProvider).status.isInProgress
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : customButton(
            ref.watch(loginProvider).isValid
                ? ref.read(loginProvider.notifier).onSubmit
                : null,
            'Login',
            context,
          );
  }
}
