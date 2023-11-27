import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

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
        // FixMe
        // child: KrPaginateFirestore(
        //   query: db
        //       .collection('notifications')
        //       .where('branch', isEqualTo: 'Delhi'),
        //   itemBuilder: (context, snapshot, index) {
        //     final notifications = n.Notification.fromJson(
        //       snapshot[index].data() as Map<String, dynamic>,
        //     );
        //     return notificationContainer(notifications.message ?? "");
        //   },
        //   itemBuilderType: PaginateBuilderType.listView,
        //   isLive: true,
        // ),
      ),
    );
  }
}
