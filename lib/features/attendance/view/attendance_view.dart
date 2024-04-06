import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/summary_box.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class AttendanceView extends ConsumerWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceCount = ref.watch(attendanceCountProvider);
    final absenceCount = ref.watch(absenceCountProvider);
    final holidaysCount = ref.watch(countHolidaysProvider);
    final leaveCount = ref.watch(countLeaveProvider);

    final remainingDay = ref.watch(totalDaysInMonthProvider) -
        absenceCount -
        attendanceCount -
        leaveCount -
        holidaysCount;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
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
                        AppColor.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.widthBox,
                    Text(
                      ref.watch(firstDayOfMonthProvider).onlyMonthAndYear,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.widthBox,
                    TextButton(
                      onPressed: () async {
                        final date = await showMonthPicker(
                          context: context,
                        );
                        if (date != null) {
                          ref
                              .read(currentDateProvider.notifier)
                              .updateDate(date);
                        }
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
                          '$attendanceCount',
                          'Present',
                          context,
                          Colors.green,
                        ),
                        summaryContainer(
                          '$absenceCount',
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
                          '$holidaysCount',
                          'Holidays',
                          context,
                          AppColor.primaryColor,
                        ),
                        summaryContainer(
                          '$leaveCount',
                          'Leave',
                          context,
                          Colors.grey,
                        ),
                      ],
                    ),
                    12.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summaryContainer(
                          '$remainingDay',
                          'Remaining',
                          context,
                          AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                // 24.heightBox,
                // const Text(
                //   'Month Insights',
                //   style: TextStyle(
                //     fontFamily: 'Inter',
                //     fontSize: 20,
                //     // color: AppColor.primaryColor,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const Calendar(),
                // 12.heightBox,
                // const Text(
                //   '8 working days yet to come this month',
                //   style: TextStyle(
                //     fontFamily: 'Inter',
                //     fontSize: 14,
                //     color: AppColor.textGreyColor,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // const Divider(
                //   color: AppColor.textGreyColor,
                // ),
                // const Text(
                //   'Emblems:',
                //   style: TextStyle(
                //     fontFamily: 'Inter',
                //     fontSize: 16,
                //     // color: AppColor.textGreyColor,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // 12.heightBox,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           height: 10,
                //           width: 10,
                //           decoration: const BoxDecoration(
                //             color: AppColor.greenColor,
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //         8.widthBox,
                //         const Text(
                //           'Present',
                //           style: TextStyle(
                //             fontFamily: 'Inter',
                //             fontSize: 12,
                //             // color: AppColor.textGreyColor,
                //             fontWeight: FontWeight.w400,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           height: 10,
                //           width: 10,
                //           decoration: const BoxDecoration(
                //             color: AppColor.redColor,
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //         8.widthBox,
                //         const Text(
                //           'Absent',
                //           style: TextStyle(
                //             fontFamily: 'Inter',
                //             fontSize: 12,
                //             fontWeight: FontWeight.w400,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           height: 10,
                //           width: 10,
                //           decoration: const BoxDecoration(
                //             color: AppColor.primaryColor,
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //         8.widthBox,
                //         const Text(
                //           'Holidays',
                //           style: TextStyle(
                //             fontFamily: 'Inter',
                //             fontSize: 12,
                //             fontWeight: FontWeight.w400,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           height: 10,
                //           width: 10,
                //           decoration: const BoxDecoration(
                //             color: AppColor.borderColor,
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //         8.widthBox,
                //         const Text(
                //           'Leave',
                //           style: TextStyle(
                //             fontFamily: 'Inter',
                //             fontSize: 12,
                //             fontWeight: FontWeight.w400,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
