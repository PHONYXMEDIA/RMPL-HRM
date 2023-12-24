import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/salary_details/salary_details.dart';

class SalaryDetailsPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const SalaryDetailsPage(),
      );

  const SalaryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SalaryDetailsView();
  }
}
// // 