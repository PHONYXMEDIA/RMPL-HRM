import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm/components/calendar.dart';
import 'package:rmpl_hrm/components/summary_box.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/core/core.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/holidays/holidays.dart';
import 'package:rmpl_hrm/features/manage_leave/manage_leave.dart';

class AttendanceView extends ConsumerWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
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
                    Text(
                      '${ref.watch(firstDayOfMonthProvider).withoutYear} - ${ref.watch(lastDayOfMonthProvider).withoutYear}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.widthBox,
                    TextButton(
                      onPressed: () async {
                        final date = await showMonthPicker(context: context);
                      },
                      child: const Text(
                        'Change Duration',
                      ),
                    ),
                  ],
                ),
                16.heightBox,
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                16.heightBox,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summaryContainer(
                          '20',
                          'Present',
                          context,
                          Colors.green,
                        ),
                        summaryContainer(
                          '2',
                          'Absent',
                          context,
                          Colors.red,
                        ),
                      ],
                    ),
                    12.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summaryContainer(
                          '${ref.watch(countHolidaysProvider)}',
                          'Holidays',
                          context,
                          primaryColor,
                        ),
                        summaryContainer(
                          '${ref.watch(countLeaveProvider)}',
                          'Leave',
                          context,
                          Colors.grey,
                        ),
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Calendar(),
                12.heightBox,
                const Text(
                  '8 working days yet to come this month',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: textGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
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
                    fontWeight: FontWeight.w500,
                  ),
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
                            color: greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        8.widthBox,
                        const Text(
                          'Present',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            // color: textGreyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: redColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        8.widthBox,
                        const Text(
                          'Absent',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        8.widthBox,
                        const Text(
                          'Holidays',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: borderColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        8.widthBox,
                        const Text(
                          'Leave',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
