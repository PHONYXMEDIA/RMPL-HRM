import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
