import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/features/login/providers/login.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      loginProvider,
      (previous, current) {
        if (previous?.status == current.status) return;
        if (current.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  current.errorMessage ?? 'Something went very wrong!',
                ),
              ),
            );
        }
      },
    );
    return const LoginView();
  }
}
