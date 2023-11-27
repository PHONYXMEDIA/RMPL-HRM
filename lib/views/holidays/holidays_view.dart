import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class HolidayView extends StatefulWidget {
  const HolidayView({super.key});

  @override
  State<HolidayView> createState() => _HolidayViewState();
}

class _HolidayViewState extends State<HolidayView> {
  DateTime selectedDate = DateTime.now();
  final formatterDate = DateFormat('MMM yyyy');
  final monthFormatter = DateFormat('MM/yyyy');

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
              // FIXME
              // Expanded(
              //   child: KrPaginateFirestore(
              //     query: db.collection('holidays').where('formattedDate',
              //         isEqualTo: monthFormatter.format(selectedDate)),
              //     itemBuilderType: PaginateBuilderType.listView,
              //     itemBuilder: (context, documentSnapshot, index) {
              //       final holiday = Holiday.fromJson(
              //         documentSnapshot[index].data() as Map<String, dynamic>,
              //       );
              //       return Column(
              //         children: [
              //           holidayContainer(
              //             '${holiday.formattedDate}',
              //             '${holiday.title}',
              //           ),
              //           12.heightBox,
              //         ],
              //       );
              //     },
              //     isLive: true,
              //   ),
              // ),
            ],
          ),
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
