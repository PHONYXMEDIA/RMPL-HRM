import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/state/auth/notifiers/auth_state_notifier.dart';
import 'package:rmpl_hrm/views/apply_leave/apply_leave_view.dart';
import 'package:rmpl_hrm/views/attendance/attendance_view.dart';
import 'package:rmpl_hrm/views/dashboard/dashboard_view.dart';
import 'package:rmpl_hrm/views/holidays/holidays_view.dart';
import 'package:rmpl_hrm/views/manage_leave/manage_leave_view.dart';
import 'package:rmpl_hrm/views/notifications/notifications_view.dart';
import 'package:rmpl_hrm/views/profile/profile_view.dart';

import '../drawer/drawer_header.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const HomeView(),
      );

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  var currentPage = DrawerSections.dashboard;
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    late final StatefulWidget container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardView();
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationView();
    } else if (currentPage == DrawerSections.myAttendance) {
      container = const AttendanceView();
    } else if (currentPage == DrawerSections.holidays) {
      container = const HolidayView();
    } else if (currentPage == DrawerSections.manageLeave) {
      container = const ManageLeaveView();
    } else if (currentPage == DrawerSections.salaryDetails) {
      container = const ApplyLeaveView();
    } else if (currentPage == DrawerSections.myProfile) {
      container = const ProfileView();
    } else if (currentPage == DrawerSections.contactAdmin) {
      container = const DashboardView();
    }
    mq = MediaQuery.of(context).size;
    // final List<ChartData> chartData = [
    //   ChartData('25% Attendance', 25, Colors.purple[300]!),
    //   ChartData('8% Leave', 38, Colors.red[300]!),
    //   ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
    //   ChartData('Others', 52, Colors.green[500]!),
    // ];

    List<String> appBarTitle = [
      'Name',
      'Name',
      'Notifications',
      'My Attendance',
      'Holidays',
      'Manage Leave',
      'Salary Details',
      'My Profile',
      'Contact Admin',
    ];
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
              appBarTitle[pageNumber],
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: pageNumber == 0 || pageNumber == 1 ? 20 : 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            pageNumber == 0 || pageNumber == 1 ? 4.heightBox : Container(),
            pageNumber == 0 || pageNumber == 1
                ? const Text(
                    'Designation',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                : Container(),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(NotificationView.route());
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: whiteColor),
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
            onTap: ref.read(authStateNotifierProvider.notifier).logOut,
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
              const MyDrawerHeader(),
              myDrawerList(),
            ],
          ),
        ),
      ),
      body: container,
    );
  }

  Widget myDrawerList() {
    return Column(
      children: [
        menuItem(
          1,
          'Dashboard',
          currentPage == DrawerSections.dashboard ? true : false,
        ),
        menuItem(
          2,
          'Notifications',
          currentPage == DrawerSections.notifications ? true : false,
        ),
        menuItem(
          3,
          'My Attendance',
          currentPage == DrawerSections.myAttendance ? true : false,
        ),
        menuItem(
          4,
          'Holidays',
          currentPage == DrawerSections.holidays ? true : false,
        ),
        menuItem(
          5,
          'Manage Leave',
          currentPage == DrawerSections.manageLeave ? true : false,
        ),
        menuItem(
          6,
          'Salary Details',
          currentPage == DrawerSections.salaryDetails ? true : false,
        ),
        menuItem(
          7,
          'My Profile',
          currentPage == DrawerSections.myProfile ? true : false,
        ),
        menuItem(
          8,
          'Contact Admin',
          currentPage == DrawerSections.contactAdmin ? true : false,
        ),
      ],
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? primaryColor.withOpacity(0.3) : Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                pageNumber = id;
                currentPage = DrawerSections.dashboard;
              } else if (id == 2) {
                pageNumber = id;
                currentPage = DrawerSections.notifications;
              } else if (id == 3) {
                pageNumber = id;
                currentPage = DrawerSections.myAttendance;
              } else if (id == 4) {
                pageNumber = id;
                currentPage = DrawerSections.holidays;
              } else if (id == 5) {
                pageNumber = id;
                currentPage = DrawerSections.manageLeave;
              } else if (id == 6) {
                pageNumber = id;
                currentPage = DrawerSections.salaryDetails;
              } else if (id == 7) {
                pageNumber = id;
                currentPage = DrawerSections.myProfile;
              } else if (id == 8) {
                pageNumber = id;
                currentPage = DrawerSections.contactAdmin;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Home.svg',
                  colorFilter: const ColorFilter.mode(
                    darkColor,
                    BlendMode.srcIn,
                  ),
                ),
                12.widthBox,
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  notifications,
  myAttendance,
  holidays,
  manageLeave,
  salaryDetails,
  myProfile,
  contactAdmin,
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
  );

  final String x;
  final double y;
  Color color;
}
