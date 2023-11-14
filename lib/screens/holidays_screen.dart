import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rmpl_hrm/components/holiday_container.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   elevation: 0,
        //   title: const Text(
        //     'Holidays',
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      'Holidays other then Sat/Sun',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          // color: primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    8.heightBox,
                    const Text(
                      '2 holidays this month',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: textGreyColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const Divider(
                      color: textGreyColor,
                    ),
                    16.heightBox,
                    holidayContainer('6 Sept', 'G20 Delhi Summit'),
                    12.heightBox,
                    holidayContainer('6 Sept', 'G20 Delhi Summit')
                  ],
                ),
              ),
            ])));
  }
}
