import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/dialogs/alert_dialog_model.dart';
import 'package:rmpl_hrm/components/dialogs/logout_dialog.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/drawer/drawer_header.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/attendance/attendance.dart';
import 'package:rmpl_hrm/features/contact/contact.dart';
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
  ContactPage(),
];

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
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
            navigation.screen == Screen.dashboard ||
                    navigation.screen == Screen.notifications
                ? 4.heightBox
                : Container(),
            navigation.screen == Screen.dashboard ||
                    navigation.screen == Screen.notifications
                ? ref.watch(profileProvider).when(
                      data: (employee) => Text(
                        '${employee?.designation}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      error: (_, __) => const SizedBox.shrink(),
                      loading: () => const SizedBox.shrink(),
                    )
                : const SizedBox.shrink(),
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
                color: whiteColor,
              ),
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/Notification.svg',
                      width: 16,
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
                color: whiteColor,
              ),
              child: SvgPicture.asset(
                'assets/icons/Logout.svg',
                width: 20,
              ),
            ),
          ),
          16.widthBox
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
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens.elementAt(
        navigation.screen.index,
      ),
    );
  }
}
