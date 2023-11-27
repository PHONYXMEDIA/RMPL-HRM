import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const ProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}
