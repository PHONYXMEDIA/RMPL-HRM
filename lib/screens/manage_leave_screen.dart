import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm/components/manageleave_card.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ManageLeave extends StatefulWidget {
  const ManageLeave({super.key});

  @override
  State<ManageLeave> createState() => _ManageLeaveState();
}

class _ManageLeaveState extends State<ManageLeave> {
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
        label: const Text("Apply Leave"),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Calendar.svg',
                      color: primaryColor,
                    ),
                    8.widthBox,
                    const Text(
                      '01 Sep - 30 Sep',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w500),
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
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                const Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '2 Approved leave',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: greenColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: '2 Rejected leave',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: redColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ])),
                4.heightBox,
                const Text(
                  '1 Pending leave',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: textGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(
                  color: textGreyColor,
                ),
                // 16.heightBox,
                manageLeaveCard(borderColor),
                manageLeaveCard(redColor),
                manageLeaveCard(greenColor),
                manageLeaveCard(greenColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
