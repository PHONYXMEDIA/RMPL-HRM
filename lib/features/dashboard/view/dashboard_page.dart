import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/dashboard/dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
