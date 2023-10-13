import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/responsive/mobile_screen_layout.dart';
import 'package:rmpl_hrm/responsive/responsive_screen_layout.dart';
import 'package:rmpl_hrm/responsive/web_screen_layout.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/attendance_screen.dart';
import 'package:rmpl_hrm/screens/authentication/login_screen.dart';
import 'package:rmpl_hrm/screens/holidays_screen.dart';
import 'package:rmpl_hrm/screens/manage_leave_screen.dart';
import 'package:rmpl_hrm/screens/notifications_screen.dart';
import 'package:rmpl_hrm/screens/profile_screen.dart';
import 'package:rmpl_hrm/screens/splash_screen.dart';

import 'screens/home_screen.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMPL HRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}
