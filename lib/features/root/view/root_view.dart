import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/features/home/home.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/features/splash/splash.dart';

class RootView extends HookConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(firebaseAuthProvider).currentUser;

    useEffect(() {
      if (user == null) return;

      ref
          .read(firestoreProvider)
          .collection('employees')
          .doc(user.uid)
          .get()
          .then((value) {
        if (!value.exists) {
          ref.read(authProvider.notifier).logout();
        }
      }).catchError((_) {
        ref.read(authProvider.notifier).logout();
      });

      return null;
    }, [user]);

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
