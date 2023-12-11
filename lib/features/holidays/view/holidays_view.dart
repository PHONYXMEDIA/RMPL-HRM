import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/holidays/holidays.dart';

class HolidaysView extends HookConsumerWidget {
  const HolidaysView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
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
                      AppColor.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.widthBox,
                  Text(
                    ref.watch(selectedHolidayProvider).onlyMonthAndYear,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.widthBox,
                  TextButton(
                    onPressed: () async {
                      final month = await showMonthPicker(
                        context: context,
                        initialDate: ref.watch(selectedHolidayProvider),
                      );
                      if (month != null) {
                        ref
                            .read(selectedHolidayProvider.notifier)
                            .onChange(month);
                      }
                    },
                    child: const Text('Change Duration'),
                  ),
                ],
              ),
              16.heightBox,
              Expanded(
                child: ref.watch(holidaysProvider).when(
                      data: (holidays) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                          Text(
                            '${holidays.length} holidays this month',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: AppColor.textGreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Divider(
                            color: AppColor.textGreyColor,
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, __) => 12.heightBox,
                              shrinkWrap: true,
                              itemCount: holidays.length,
                              itemBuilder: (context, index) {
                                final holiday = holidays.elementAt(index);
                                return HolidayContainer(
                                  date: holiday.date.formattedDate,
                                  reason: '${holiday.title}',
                                );
                              },
                            ),
                          ),
                        ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
