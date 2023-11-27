import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/notifications/notifications.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const NotificationsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const NotificationView();
  }
}
