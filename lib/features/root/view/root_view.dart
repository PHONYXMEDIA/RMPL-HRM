import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/features/home/home.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/features/splash/splash.dart';
import 'package:rmpl_hrm/state/auth/models/auth_status.dart';
import 'package:rmpl_hrm/state/auth/notifiers/auth_state_notifier.dart';

class RootView extends ConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(authStateNotifierProvider).valueOrNull?.status;

    switch (status) {
      case AuthStatus.authenticated:
        return const HomePage();
      case AuthStatus.unauthenticated:
        return const LoginPage();
      case AuthStatus.initial:
      case null:
        return const SplashPage();
    }
  }
}
