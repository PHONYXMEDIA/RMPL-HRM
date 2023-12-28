import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/features/home/home.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/features/splash/splash.dart';

class RootView extends ConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (ref.watch(authProvider).status) {
      case AuthStatus.authenticated:
        return const HomePage();
      case AuthStatus.unauthenticated:
        return const LoginPage();
      case AuthStatus.initial:
      default:
        return const SplashPage();
    }
  }
}
