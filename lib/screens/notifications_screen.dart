import 'package:flutter/material.dart';
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
  Stream<Iterable<n.Notification>> getNotifications() =>
      db.collection('notifications').snapshots().map(
            (event) => event.docs.map(
              (e) => n.Notification.fromJson(
                e.data(),
              ),
            ),
          );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        child: StreamBuilder<Iterable<n.Notification>>(
          stream: getNotifications().asBroadcastStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildLoader();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data available.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  if (index < snapshot.data!.length) {
                    final notification = snapshot.data!.elementAt(index);
                    return notificationContianer(notification.message ?? "");
                  } else {
                    return buildLoader();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildLoader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
