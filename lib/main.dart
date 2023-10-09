import 'package:flutter/material.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/attendance_screen.dart';
import 'package:rmpl_hrm/screens/authentication/login_screen.dart';
import 'package:rmpl_hrm/screens/holidays_screen.dart';
import 'package:rmpl_hrm/screens/manage_leave_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMPL HRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
