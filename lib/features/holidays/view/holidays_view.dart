import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/components/holiday_container.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/state/holiday/providers/holiday.dart';

class HolidaysView extends ConsumerWidget {
  const HolidaysView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryColor,
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
        child: Padding(
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.widthBox,
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change Duration'),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.heightBox,
              const Text(
                '2 holidays this month',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: textGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                color: textGreyColor,
              ),
              ref.watch(holidaysProvider).when(
                    data: (holidays) => Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, __) => 12.heightBox,
                        itemCount: holidays.length,
                        itemBuilder: (context, index) {
                          final holiday = holidays.elementAt(index);
                          return holidayContainer(
                            holiday.date.formattedDate,
                            '${holiday.title}',
                          );
                        },
                      ),
                    ),
                    error: (err, __) => Center(
                      child: Text(
                        'Error: ${err.toString()}',
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
