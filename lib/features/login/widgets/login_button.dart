import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/components/button.dart';

class LoginButton extends HookConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customButton(
      () {},
      'Login',
      context,
    );
  }
}
