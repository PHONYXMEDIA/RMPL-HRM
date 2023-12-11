import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/drawer/drawer_list.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!)
    ];
    mq = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: mq.height,
      width: mq.width,
      // color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColor.primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 32,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/LOGO.png',
                            width: mq.width * 0.12,
                          ),
                          12.widthBox,
                          const Expanded(
                            child: Text(
                              'Recorded\nMusic\nPrivate\nLimited',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.whiteColor,
                    ),
                    const DrawerList(text: 'Dashboard'),
                    const DrawerList(text: 'Notifications'),
                    const DrawerList(text: 'Attendance'),
                    const DrawerList(text: 'Holidays'),
                    const DrawerList(text: 'Manage Leave'),
                    const DrawerList(text: 'Salary Details'),
                    const DrawerList(text: 'My Profile'),
                    const DrawerList(text: 'Contact Admin'),
                    SizedBox(height: mq.width * 0.12),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: Colors.red[900],
                    child: const Center(
                      child: Text(
                        'You are under probation which will last till 2.04.2024',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.borderColor,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.borderColor,
                          blurRadius: 4,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello! NAME',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: AppColor.darkColor,
                              ),
                            ),
                            8.widthBox,
                            const Text(
                              'Designation',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: AppColor.darkColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: mq.width * 0.1,
                          child: CustomButton(
                            onPress: () {},
                            text: 'Logout',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 32,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColor.borderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/Calendar.svg'),
                                      8.widthBox,
                                      const Text(
                                        '01 Sep - 30 Sep',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: AppColor.darkColor),
                                      ),
                                    ],
                                  ),
                                  20.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.greenColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppColor.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          const Text(
                                            'Present',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColor.darkColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.redColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppColor.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          const Text(
                                            'Absent',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColor.darkColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  20.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.buttonColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppColor.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          const Text(
                                            'Holidays',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColor.darkColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.textGreyColor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppColor.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          12.widthBox,
                                          const Text(
                                            'Leave  ',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: AppColor.darkColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColor.borderColor,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Attendance Report',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: AppColor.darkColor,
                                    ),
                                  ),
                                  SfCircularChart(
                                      legend: const Legend(
                                        isResponsive: true,
                                        isVisible: true,
                                      ),
                                      selectionGesture:
                                          ActivationMode.singleTap,
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
                                            pointColorMapper:
                                                (ChartData data, _) =>
                                                    data.color,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y)
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // margin: EdgeInsets.symmetric(
                              //     horizontal: 20, vertical: 16),
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 16, top: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColor.borderColor,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 28),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: AppColor.primaryColor,
                                        border: Border.all(
                                            color: AppColor.borderColor)),
                                    // width: 100,
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/ticksqaure.svg',
                                          width: 50,
                                        ),
                                        SizedBox(
                                          height: mq.width * 0.01,
                                        ),
                                        const Text(
                                          ' Click to\nPunch In',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: AppColor.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  28.widthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Punch In',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColor.darkColor),
                                      ),
                                      8.heightBox,
                                      const Text(
                                        '09:28 AM',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: AppColor.darkColor),
                                      ),
                                      8.heightBox,
                                      const Text(
                                        'Punch Out',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColor.darkColor),
                                      ),
                                      8.heightBox,
                                      const Text(
                                        '05:35 PM',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: AppColor.darkColor),
                                      ),
                                      8.heightBox,
                                      const Text(
                                        'Working Hours',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColor.darkColor),
                                      ),
                                      8.heightBox,
                                      const Text(
                                        '8 hrs 7 mins',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                            color: AppColor.darkColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // 20.heightBox,
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: AppColor.borderColor)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Salary Insights',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: AppColor.darkColor),
                                  ),
                                  SfCircularChart(
                                      legend: const Legend(
                                        isResponsive: true,
                                        isVisible: true,
                                      ),
                                      selectionGesture:
                                          ActivationMode.singleTap,
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
                                            pointColorMapper:
                                                (ChartData data, _) =>
                                                    data.color,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y)
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
