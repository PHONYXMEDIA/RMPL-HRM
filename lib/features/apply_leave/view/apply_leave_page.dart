import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/apply_leave/apply_leave.dart';

class ApplyLeavePage extends StatelessWidget {
  const ApplyLeavePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (context) => const ApplyLeavePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const ApplyLeaveView();
  }
}
