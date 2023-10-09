import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/attendance_screen.dart';
import 'package:rmpl_hrm/screens/drawer/drawer.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/screens/drawer/drawer_header.dart';
import 'package:rmpl_hrm/screens/drawer/drawer_list.dart';
import 'package:rmpl_hrm/screens/holidays_screen.dart';
import 'package:rmpl_hrm/screens/manage_leave_screen.dart';
import 'package:rmpl_hrm/screens/profile_screen.dart';
import 'package:swipe_to_complete/bloc/swiper_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
   
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaning\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!)
    ];
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 0,
      //   leading: Builder(builder: (context) {
      //     return IconButton(
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //       icon: const Icon(Icons.menu_outlined),
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   }),
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text(
      //         'Hello! Name',
      //         style: TextStyle(
      //             fontFamily: 'Inter',
      //             fontSize: 20,
      //             fontWeight: FontWeight.w600),
      //       ),
      //       4.heightBox,
      //       const Text(
      //         'Designation',
      //         style: TextStyle(
      //             fontFamily: 'Inter',
      //             fontWeight: FontWeight.w400,
      //             fontSize: 14),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {},
      //       child: Container(
      //           padding: const EdgeInsets.all(12),
      //           decoration: const BoxDecoration(
      //               shape: BoxShape.circle, color: whiteColor),
      //           child: Stack(
      //             children: [
      //               Center(
      //                 child: SvgPicture.asset(
      //                   'assets/icons/Notification.svg',
      //                   width: 16,
      //                 ),
      //               ),
      //               Positioned(
      //                   right: 0,
      //                   top: 4,
      //                   child: Container(
      //                     width: 8,
      //                     height: 8,
      //                     decoration: const BoxDecoration(
      //                         shape: BoxShape.circle, color: Colors.red),
      //                   ))
      //             ],
      //           )),
      //     ),
      //     8.widthBox,
      //     GestureDetector(
      //       onTap: () {},
      //       child: Container(
      //           padding: const EdgeInsets.all(10),
      //           decoration: const BoxDecoration(
      //               shape: BoxShape.circle, color: whiteColor),
      //           child: SvgPicture.asset(
      //             'assets/icons/Logout.svg',
      //             width: 20,
      //           )),
      //     ),
      //     16.widthBox
      //   ],
      // ),
      
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: mq.height * 0.1),
            margin: EdgeInsets.only(top: mq.height * 0.1),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.red[800],
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Center(
                      child: Text(
                        'You are under probation which will last till 2.04.2024',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            color: whiteColor),
                      ),
                    ),
                  ),
                  20.heightBox,
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Punch In',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Punch Out',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Working Hours',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            28.widthBox,
                            const Expanded(
                              flex: 5,
                              child: Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Expanded(
                              flex: 6,
                              child: Text(
                                '05:00 PM',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              '08:00 Hrs',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            28.widthBox
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'My Dashboard',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    // color: primaryColor,
                    child: SfCircularChart(
                        legend: const Legend(
                            isResponsive: true,
                            // toggleSeriesVisibility: false,
                            isVisible: true,
                            title: LegendTitle(
                                text: 'Attendance Report',
                                textStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))),
                        selectionGesture: ActivationMode.singleTap,
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                              angle: 300,
                              radius: '40%',
                              widget: const Text('25%')),
                          CircularChartAnnotation(
                              angle: 200,
                              radius: '40%',
                              widget: const Text('38%')),
                          CircularChartAnnotation(
                              angle: 100,
                              radius: '40%',
                              widget: const Text('34%')),
                          CircularChartAnnotation(
                              angle: 0,
                              radius: '40%',
                              widget: const Text('52%')),
                        ],
                        series: <CircularSeries>[
                          // Render pie chart
                          PieSeries<ChartData, String>(
                              dataSource: chartData,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
                  SfCircularChart(
                      legend: const Legend(
                          isResponsive: true,
                          // toggleSeriesVisibility: false,
                          isVisible: true,
                          title: LegendTitle(
                              // alignment: ChartAlignment.near,
                              text: 'Salary Insight',
                              textStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ))),
                      selectionGesture: ActivationMode.singleTap,
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            angle: 300,
                            radius: '40%',
                            widget: const Text('25%')),
                        CircularChartAnnotation(
                            angle: 200,
                            radius: '40%',
                            widget: const Text('38%')),
                        CircularChartAnnotation(
                            angle: 100,
                            radius: '40%',
                            widget: const Text('34%')),
                        CircularChartAnnotation(
                            angle: 0, radius: '40%', widget: const Text('52%')),
                      ],
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y)
                      ])
                ],
              ),
            ),
          ),
          Container(
            height: 110,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor)),
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
                    const Text(
                      '01 Sep - 30 Sep',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
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
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        8.heightBox,
                        const Text(
                          'Present',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          '20',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        8.heightBox,
                        const Text(
                          'Absent',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          '20',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        8.heightBox,
                        const Text(
                          'Holidays',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          '20',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        8.heightBox,
                        const Text(
                          'Leave',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
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