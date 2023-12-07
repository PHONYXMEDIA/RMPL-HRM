import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/core/providers/date.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/attendance/attendance.dart';
import 'package:rmpl_hrm/features/holidays/holidays.dart';
import 'package:rmpl_hrm/features/manage_leave/manage_leave.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/responsive/web_screen_layout.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!)
    ];
    final attendanceStatus = ref.watch(attendanceProvider).status;
    final punchStatus = ref.watch(attendanceProvider).punchStatus;
    return Scaffold(
      backgroundColor: primaryColor,
      body: mq.width > webScreenSize
          ? const WebScreenLayout()
          : Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 86),
                  margin: const EdgeInsets.only(top: 48),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.red[800],
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: const Center(
                            child: Text(
                              'You are under probation which will last till 2.04.2024',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
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
                                : GestureDetector(
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
                                        borderRadius: BorderRadius.circular(12),
                                        color: buttonColor,
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
                                            color: backgroundColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                              color: borderColor,
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
                        24.heightBox,
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
                          child: SfCircularChart(
                            legend: const Legend(
                              isResponsive: true,
                              isVisible: true,
                            ),
                            selectionGesture: ActivationMode.singleTap,
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                angle: 300,
                                radius: '40%',
                                widget: const Text('25%'),
                              ),
                              CircularChartAnnotation(
                                angle: 200,
                                radius: '40%',
                                widget: const Text('38%'),
                              ),
                              CircularChartAnnotation(
                                angle: 100,
                                radius: '40%',
                                widget: const Text('34%'),
                              ),
                              CircularChartAnnotation(
                                angle: 0,
                                radius: '40%',
                                widget: const Text('52%'),
                              ),
                            ],
                            series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Salary Insight',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: SfCircularChart(
                            legend: const Legend(
                              isResponsive: true,
                              isVisible: true,
                            ),
                            selectionGesture: ActivationMode.singleTap,
                            annotations: <CircularChartAnnotation>[
                              CircularChartAnnotation(
                                angle: 300,
                                radius: '40%',
                                widget: const Text('25%'),
                              ),
                              CircularChartAnnotation(
                                angle: 200,
                                radius: '40%',
                                widget: const Text('38%'),
                              ),
                              CircularChartAnnotation(
                                angle: 100,
                                radius: '40%',
                                widget: const Text('34%'),
                              ),
                              CircularChartAnnotation(
                                angle: 0,
                                radius: '40%',
                                widget: const Text('52%'),
                              ),
                            ],
                            series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 115,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderColor),
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
                              const Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.heightBox,
                              const Text(
                                'Present',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                '20',
                                style: TextStyle(
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
                                '${ref.watch(countHolidaysProvider)}',
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
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${ref.watch(countLeaveProvider)}',
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
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
