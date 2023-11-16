import 'package:flutter/material.dart';
import 'package:kr_paginate_firestore/paginate_firestore.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/constants.dart';
import 'package:rmpl_hrm/models/notification.dart' as n;

import '../components/notification_container.dart';

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
        child: KrPaginateFirestore(
          query: db
              .collection('notifications')
              .where('branch', isEqualTo: 'Delhi'),
          itemBuilder: (context, snapshot, index) {
            final notifications = n.Notification.fromJson(
              snapshot[index].data() as Map<String, dynamic>,
            );
            return notificationContianer(notifications.message ?? "");
          },
          itemBuilderType: PaginateBuilderType.listView,
        ),
      ),
    );
  }
}
