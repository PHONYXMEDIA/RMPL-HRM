import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/button.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loginProvider).status.isInProgress
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CustomButton(
            onPress: ref.watch(loginProvider).isValid
                ? ref.read(loginProvider.notifier).onSubmit
                : null,
            text: 'Login',
          );
  }
}
