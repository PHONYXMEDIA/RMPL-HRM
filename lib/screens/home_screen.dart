import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';
import 'authentication/controllers/auth_controller.dart';
import '../main.dart';
import 'apply_leave_screen.dart';
import 'attendance_screen.dart';
import 'dashboard_screen.dart';
import 'drawer/drawer_header.dart';
import 'holidays_screen.dart';
import 'manage_leave_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    late final StatefulWidget container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardScreen();
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationScreen();
    } else if (currentPage == DrawerSections.myAttendance) {
      container = const AttendanceScreen();
    } else if (currentPage == DrawerSections.holidays) {
      container = const HolidayScreen();
    } else if (currentPage == DrawerSections.manageLeave) {
      container = const ManageLeave();
    } else if (currentPage == DrawerSections.salaryDetails) {
      container = const ApplyLeaveScreen();
    } else if (currentPage == DrawerSections.myProfile) {
      container = const ProfileScreen();
    } else if (currentPage == DrawerSections.contactAdmin) {
      container = const DashboardScreen();
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
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu_outlined),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appBarTitle[pageNumber],
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: pageNumber == 0 || pageNumber == 1 ? 20 : 20,
                  fontWeight: FontWeight.w600),
            ),
            pageNumber == 0 || pageNumber == 1 ? 4.heightBox : Container(),
            pageNumber == 0 || pageNumber == 1
                ? const Text(
                    'Designation',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                : Container(),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const NotificationScreen());
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
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
          8.widthBox,
          GestureDetector(
            onTap: () => authController.logOut(),
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: whiteColor),
                child: SvgPicture.asset(
                  'assets/icons/Logout.svg',
                  width: 20,
                )),
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
        menuItem(1, "Dashboard",
            currentPage == DrawerSections.dashboard ? true : false),
        menuItem(2, "Notifications",
            currentPage == DrawerSections.notifications ? true : false),
        menuItem(3, "My Attendance",
            currentPage == DrawerSections.myAttendance ? true : false),
        menuItem(4, "Holidays",
            currentPage == DrawerSections.holidays ? true : false),
        menuItem(5, "Manage Leave",
            currentPage == DrawerSections.manageLeave ? true : false),
        menuItem(6, "Salary Details",
            currentPage == DrawerSections.salaryDetails ? true : false),
        menuItem(7, "My Profile",
            currentPage == DrawerSections.myProfile ? true : false),
        menuItem(8, "Contact Admin",
            currentPage == DrawerSections.contactAdmin ? true : false),
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                      fontWeight: FontWeight.w500),
                )),
                const Icon(Icons.arrow_forward_ios)
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
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
