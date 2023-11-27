import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/splash/splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
