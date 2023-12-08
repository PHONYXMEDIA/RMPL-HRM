import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/features/notifications/notifications.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ref.watch(notificationProvider).when(
              data: (notifications) {
                return RefreshIndicator(
                  onRefresh: () => ref.refresh(notificationProvider.future),
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications.elementAt(index);
                      return NotificationContainer(
                        text: notification.message ?? '',
                      );
                    },
                  ),
                );
              },
              error: (error, __) => Center(
                child: Text('Error $error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
