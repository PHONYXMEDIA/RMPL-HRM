import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm/components/calendar.dart';
import 'package:rmpl_hrm/components/summary_box.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 0,
      //   title: const Text(
      //     'My Attendance',
      //     style: TextStyle(
      //         fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w600),
      //   ),
      // ),
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
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontWeight: FontWeight.w500),
                    ),
                    12.widthBox,
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Duration"),
                    ),
                  ],
                ),
                16.heightBox,
                const Text(
                  'Summary',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      // color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                16.heightBox,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summaryContainer(
                            '20', 'Present', context, Colors.green),
                        summaryContainer('2', 'Absent', context, Colors.red),
                      ],
                    ),
                    12.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summaryContainer(
                            '8', 'Holidays', context, primaryColor),
                        summaryContainer('2', 'Leave', context, Colors.grey),
                      ],
                    ),
                  ],
                ),
                24.heightBox,
                const Text(
                  'Month Insights',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      // color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                const Calendar(),
                12.heightBox,
                const Text(
                  '8 working days yet to come this month',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: textGreyColor,
                      fontWeight: FontWeight.w400),
                ),
                const Divider(
                  color: textGreyColor,
                ),
                const Text(
                  'Emblems:',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      // color: textGreyColor,
                      fontWeight: FontWeight.w500),
                ),
                12.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: greenColor, shape: BoxShape.circle),
                        ),
                        8.widthBox,
                        const Text(
                          'Present',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              // color: textGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: redColor, shape: BoxShape.circle),
                        ),
                        8.widthBox,
                        const Text(
                          'Absent',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              // color: textGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                        ),
                        8.widthBox,
                        const Text(
                          'Holidays',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              // color: textGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: borderColor, shape: BoxShape.circle),
                        ),
                        8.widthBox,
                        const Text(
                          'Leave',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              // color: textGreyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                // 100.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
