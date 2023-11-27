import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/state/login/notifiers/login_notifier.dart';

class LoginButton extends HookConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);

    return state.status.isInProgress
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : customButton(
            state.isValid
                ? () async {
                    if (!state.isValid) return;
                    await ref
                        .read(
                          loginNotifierProvider.notifier,
                        )
                        .onSubmit();
                  }
                : null,
            'Login',
            context,
          );
  }
}
