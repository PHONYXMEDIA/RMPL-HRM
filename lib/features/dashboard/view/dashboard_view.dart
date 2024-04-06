import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/responsive/web_screen_layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  List<DateTime> guestedHolidayDates = [];
  Future<void> fetchHolidays() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('holidays').get();
      setState(() {
        for (var doc in data.docs) {
          final Timestamp timestamp = doc['date'] as Timestamp;
          final DateTime day = timestamp.toDate();
          final DateTime dateOnly = DateTime(day.year, day.month, day.day);
          guestedHolidayDates.add(dateOnly);
        }
      });
    } catch (error) {
      print('Error fetching holidays data: $error');
    }
    print('gustedholidays  $guestedHolidayDates');
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Perform your asynchronous work here...
    // For example, you might await on some async operation:
    await fetchHolidays();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    final attendanceCount = ref.watch(attendanceCountProvider);
    final absenceCount = ref.watch(absenceCountProvider);
    final holidaysCount = ref.watch(countHolidaysProvider);
    final leaveCount = ref.watch(countLeaveProvider);

    final firstDayOfMonthProvider = Provider<DateTime>((ref) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, 1);
    });

    final lastDayOfMonthProvider = Provider<DateTime>((ref) {
      final now = DateTime.now();
      final lastDay = DateTime(now.year, now.month + 1, 0);
      return lastDay.isAfter(now) ? now : lastDay;
    });

    final totalDaysOfMonthProvider = Provider<int>((ref) {
      final firstDayOfMonth = ref.watch(firstDayOfMonthProvider);
      final lastDayOfMonth = ref.watch(lastDayOfMonthProvider);

      final difference = lastDayOfMonth.difference(firstDayOfMonth);

      final totalDays = difference.inDays + 1;

      return totalDays;
    });

    final employeeState = ref.watch(profileProvider);
    final String formattedDate = employeeState?.probationTill != null
        ? DateFormat('dd-MM-yyyy').format(employeeState!.probationTill!)
        : 'N/A';

    final List<ChartData> chartData = _generateChartData(
      attendanceCount: attendanceCount,
      absenceCount: absenceCount,
      holidaysCount: holidaysCount,
      leaveCount: leaveCount,
      totalDaysCount: ref.watch(totalDaysInMonthProvider),
    );

    final remainingDay = ref.watch(totalDaysInMonthProvider) -
        absenceCount -
        attendanceCount -
        leaveCount -
        holidaysCount;

    final attendanceStatus = ref.watch(attendanceProvider).status;
    final punchStatus = ref.watch(attendanceProvider).punchStatus;

    final currentTime = DateTime.now();
    final isWithinTimeRange = currentTime.hour >= 10 && currentTime.hour < 18;
    final isWeekend = currentTime.weekday == DateTime.saturday ||
        currentTime.weekday == DateTime.sunday;
    final isGuestedHoliday = guestedHolidayDates.contains(
        DateTime(currentTime.year, currentTime.month, currentTime.day));
    print('holiday $isGuestedHoliday');
    print(guestedHolidayDates);
    print(DateTime(currentTime.year, currentTime.month, currentTime.day));

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: mq.width > Dimensions.webScreenSize
          ? const WebScreenLayout()
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 86),
                  margin: const EdgeInsets.only(top: 48),
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (employeeState?.probation == true)
                          Container(
                            width: double.infinity,
                            color: Colors.red[800],
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    'You are under probation last date till $formattedDate',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        16.heightBox,
                        attendanceStatus.isPunchedOut
                            ? const SizedBox.shrink()
                            : punchStatus.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : (isWithinTimeRange &&
                                        !isWeekend &&
                                        !isGuestedHoliday
                                    ? GestureDetector(
                                        onLongPress: ref
                                            .read(attendanceProvider.notifier)
                                            .createAttendance,
                                        child: Container(
                                          width: double.infinity,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColor.buttonColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 4,
                                                spreadRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              attendanceStatus.isPunchedIn
                                                  ? 'Hold to punch out'
                                                  : 'Hold to punch in',
                                              style: const TextStyle(
                                                color: AppColor.backgroundColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink()),
                        24.heightBox,
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Punch In',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Punch Out',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Working Hours',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              color: AppColor.borderColor,
                              endIndent: 16,
                              indent: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  ref.watch(punchedInProvider),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  ref.watch(punchedOutProvider),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  ref.watch(workingHoursProvider),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        30.heightBox,
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Attendance Report',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: PieChart(
                            PieChartData(
                              sections: _getSections(chartData),
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.borderColor),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          24.widthBox,
                          SvgPicture.asset(
                            'assets/icons/Calendar.svg',
                            width: 28,
                          ),
                          12.widthBox,
                          Text(
                            '${ref.watch(firstDayOfMonthProvider).withoutYear} - ${ref.watch(lastDayOfMonthProvider).withoutYear}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      12.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '$attendanceCount',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              Text(
                                'Present',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[500],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$absenceCount',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              const Text(
                                'Absent',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$leaveCount',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              const Text(
                                'Leave',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$holidaysCount',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              const Text(
                                'Holidays',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$remainingDay',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              const Text(
                                'Remaining',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }

  List<ChartData> _generateChartData({
    required int attendanceCount,
    required int absenceCount,
    required int holidaysCount,
    required int leaveCount,
    required int totalDaysCount,
  }) {
    final int remainingDaysCount = totalDaysCount -
        (attendanceCount + leaveCount + holidaysCount + absenceCount);
    final double attendancePercentage =
        (attendanceCount / totalDaysCount) * 100;
    final double leavePercentage = (leaveCount / totalDaysCount) * 100;
    final double remainingPercentage =
        (remainingDaysCount / totalDaysCount) * 100;
    final double absentPercentage = (absenceCount / totalDaysCount) * 100;
    final double otherPercentage = (holidaysCount / totalDaysCount) * 100;

    print('Total Days: $totalDaysCount');
    print('Attendance Percentage: $attendancePercentage%');
    print('Leave Percentage: $leavePercentage%');
    print('Remaining Percentage: $remainingPercentage%');
    print('Other Percentage: $otherPercentage%');
    print('Absent Percentage: $absentPercentage%');

    return [
      ChartData('Attendance', attendancePercentage, Colors.green[500]!,
          attendancePercentage),
      ChartData('Absent', absentPercentage, Colors.red, absentPercentage),
      ChartData('Leave', leavePercentage, Colors.orange, leavePercentage),
      ChartData(
          'Holidays', otherPercentage, Colors.purple[500]!, otherPercentage),
      ChartData('Remaining\nWorking Days', remainingPercentage,
          Colors.pink[300]!, remainingPercentage),
    ];
  }
}

List<PieChartSectionData> _getSections(List<ChartData> chartData) {
  return chartData.map(
    (data) {
      return PieChartSectionData(
        color: data.color,
        value: data.y,
        title: '${data.y.toStringAsFixed(1)}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    },
  ).toList();
}

class ChartData {
  ChartData(this.x, this.y, this.color, this.percentage);

  final String x;
  final double y;
  final Color color;
  final double percentage;
}
