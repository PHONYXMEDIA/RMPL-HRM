import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/state/auth/models/auth_status.dart';
import 'package:rmpl_hrm/state/auth/notifiers/auth_state_notifier.dart';
import 'package:rmpl_hrm/views/home/home_view.dart';
import 'package:rmpl_hrm/views/login/login_screen.dart';
import 'package:rmpl_hrm/views/splash/splash_view.dart';

class RootView extends ConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(authStateNotifierProvider).valueOrNull?.status;

    switch (status) {
      case AuthStatus.authenticated:
        return const HomeView();
      case AuthStatus.unauthenticated:
        return const LoginScreen();
      case AuthStatus.initial:
      case null:
        return const SplashView();
    }
  }
}
