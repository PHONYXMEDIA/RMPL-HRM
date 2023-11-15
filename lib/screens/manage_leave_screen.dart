import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm/components/manageleave_card.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/models/leave.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/authentication/controllers/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/constants.dart';

class ManageLeave extends StatefulWidget {
  const ManageLeave({super.key});

  @override
  State<ManageLeave> createState() => _ManageLeaveState();
}

class _ManageLeaveState extends State<ManageLeave> {
  final countApproved = db
      .collection('leave')
      .where("status", isEqualTo: 'approved')
      .count()
      .query
      .snapshots();
  final countRejected = db
      .collection('leave')
      .where("status", isEqualTo: 'rejected')
      .count()
      .query
      .snapshots();
  final countPending = db
      .collection('leave')
      .where("status", isEqualTo: 'pending')
      .count()
      .query
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 0,
      //   title: const Text(
      //     'Manage Leave',
      //     style: TextStyle(
      //         fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w600),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const ApplyLeaveScreen());
        },
        isExtended: true,
        backgroundColor: primaryColor,
        label: const Text(
          "Apply Leave",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Calendar.svg',
                      colorFilter: const ColorFilter.mode(
                        primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.widthBox,
                    const Text(
                      '01 Sep - 30 Sep',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.widthBox,
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Duration"),
                    ),
                  ],
                ),
                12.heightBox,
                const Text(
                  'Leave Application',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    // color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: countApproved,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Calculating approved leave');
                        } else if (snapshot.hasError) {
                          return const SizedBox.shrink();
                        }
                        return Text(
                          '${snapshot.data?.docs.length} Approved leave',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: greenColor,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                    12.widthBox,
                    StreamBuilder(
                      stream: countRejected,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Calculating rejected leave');
                        } else if (snapshot.hasError) {
                          return const SizedBox.shrink();
                        }
                        return Text(
                          '${snapshot.data?.docs.length} Rejected leave',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: redColor,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ],
                ),

                StreamBuilder(
                  stream: countPending,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Calculating pending leave');
                    } else if (snapshot.hasError) {
                      return const SizedBox.shrink();
                    }
                    return Text(
                      '${snapshot.data?.docs.length} Pending leave',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: textGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),

                const Divider(
                  color: textGreyColor,
                ),
                // 16.heightBox,
                FirestorePagination(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  isLive: true,
                  query: db.collection('leave').where(
                        "uid",
                        isEqualTo: db
                            .collection('employees')
                            .doc(authController.firebaseUser.value?.uid),
                      ),
                  itemBuilder: (context, snapshot, index) {
                    final leave = Leave.fromJson(
                      snapshot.data() as Map<String, dynamic>,
                    );

                    return manageLeaveCard(
                      color: leave.color,
                      status: leave.status ?? "",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension LeaveStatusColor on Leave {
  Color get color {
    if (status?.toLowerCase() == 'approved') {
      return greenColor;
    } else if (status?.toLowerCase() == 'rejected') {
      return redColor;
    } else {
      return borderColor;
    }
  }
}
