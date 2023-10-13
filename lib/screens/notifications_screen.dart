import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rmpl_hrm/components/notification_container.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/screens/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   title: Text(
      //     'Notifications',
      //     style: TextStyle(
      //         fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w500),
      //   ),
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.to(() => HomeScreen());
      //       },
      //       icon: Icon(Icons.arrow_back_ios_new_outlined)),
      // ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
              notificationContianer('Everyone are requested to do this....'),
            ],
          ),
        ),
      ),
    );
  }
}
