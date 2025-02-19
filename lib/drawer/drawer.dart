import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/drawer/drawer_list.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';

Widget customDrawer(context) {
  mq = MediaQuery.of(context).size;
  return SafeArea(
    bottom: false,
    child: Drawer(
      child: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/LOGO.png',
                  width: mq.width * 0.3,
                ),
                12.widthBox,
                const Text(
                  'Recorded\nMusic\nPrivate\nLimited',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColor.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          // 12.heightBox,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                DrawerList(text: 'Dashboard'),
                DrawerList(text: 'Notifications'),
                DrawerList(text: 'My Attendance'),
                DrawerList(text: 'Holidays'),
                DrawerList(text: 'Manage Leave'),
                DrawerList(text: 'Salary Details'),
                DrawerList(text: 'My Profile'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
