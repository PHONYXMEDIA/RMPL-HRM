import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:rmpl_hrm/screens/drawer/drawer_list.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customDrawer(context){
  mq = MediaQuery.of(context).size;
  return SafeArea(
    bottom: false,
    child: Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 28),
              child: Row(
                children: [
                  Image.asset('assets/images/LOGO.png',width: mq.width*0.3,),
                  12.widthBox,
                  const Text(
                    'Recorded\nMusic\nPrivate\nLimited',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: whiteColor
                    ),
                  )
                ],
              ),
            ),
            // 12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(()=> ApplyLeaveScreen());
                    },
                    child: drawerList('Dashboard')),
                  drawerList('Notifications'),
                  drawerList('My Attendance'),
                  drawerList('Holidays'),
                  drawerList('Manage Leave'),
                  drawerList('Salary Details'),
                  drawerList('My Profile'),
                  drawerList('Contact Admin')
                ],
              ),
            )
          ],
        ),
      )
    ),
  );
}