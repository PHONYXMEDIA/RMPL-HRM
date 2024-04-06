import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/dialogs/alert_dialog_model.dart';
import 'package:rmpl_hrm/components/dialogs/logout_dialog.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/drawer/drawer_header.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/attendance/attendance.dart';
import 'package:rmpl_hrm/features/dashboard/dashboard.dart';
import 'package:rmpl_hrm/features/holidays/holidays.dart';
import 'package:rmpl_hrm/features/home/home.dart';
import 'package:rmpl_hrm/features/manage_leave/manage_leave.dart';
import 'package:rmpl_hrm/features/notifications/notifications.dart';
import 'package:rmpl_hrm/features/profile/profile.dart';
import 'package:rmpl_hrm/features/salary_details/salary_details.dart';

const Iterable<Widget> screens = [
  DashboardPage(),
  NotificationsPage(),
  AttendancePage(),
  HolidaysPage(),
  ManageLeavePage(),
  SalaryDetailsPage(),
  ProfilePage(),
];

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
              ),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              navigation.screen.title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            if (navigation.screen == Screen.dashboard ||
                navigation.screen == Screen.notifications) ...[
              4.heightBox,
              Text(
                '${ref.watch(profileProvider)?.designation}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => ref
                .read(navigationProvider.notifier)
                .onChange(Screen.notifications),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor,
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.notifications,
                      size: 16,
                      color: AppColor.darkColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.widthBox,
          GestureDetector(
            onTap: () async {
              final shouldLogOut = await const LogoutDialog()
                  .present(context)
                  .then((value) => value ?? false);
              if (shouldLogOut) {
                await ref.read(authProvider.notifier).logout();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.whiteColor,
              ),
              child: const Icon(
                Icons.logout,
                size: 20,
                color: AppColor.darkColor,
              ),
            ),
          ),
          16.widthBox,
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomDrawerHeader(),
              ...Screen.values.map(
                (screen) => MenuItem(
                  screen: screen,
                  selected: navigation.screen == screen,
                  iconData: getIconDataForScreen(screen),
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens.elementAt(navigation.screen.index),
    );
  }

  IconData getIconDataForScreen(Screen screen) {
    switch (screen) {
      case Screen.dashboard:
        return Icons.dashboard;
      case Screen.notifications:
        return Icons.notifications;
      case Screen.myAttendance:
        return Icons.access_time;
      case Screen.holidays:
        return Icons.calendar_today;
      case Screen.manageLeave:
        return Icons.event_note;
      case Screen.salaryDetails:
        return Icons.attach_money;
      case Screen.myProfile:
        return Icons.person;
      default:
        return Icons.error;
    }
  }
}
