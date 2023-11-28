import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/manage_leave/manage_leave.dart';

class ManageLeavePage extends StatelessWidget {
  const ManageLeavePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const ManageLeavePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const ManageLeaveView();
  }
}
