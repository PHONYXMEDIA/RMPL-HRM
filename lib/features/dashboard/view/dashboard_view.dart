import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/responsive/web_screen_layout.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  bool isPunchedIn = false;
  bool disablePunchIn = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _init();
  // }

  // Future<void> _init() async {
  //   try {
  //     final doc = await FirebaseFirestore.instance
  //         .collection('common')
  //         .doc('attendance')
  //         .collection(DateFormat('yyyy-MM-dd').format(DateTime.now()))
  //         .doc(authController.firebaseUser.value!.uid)
  //         .get();
  //     if (!doc.exists) return;
  //     final attendance = Attendance.fromJson(doc.data()!);
  //     if (attendance.punchedIn != null && attendance.punchedOut != null) {
  //       setState(() {
  //         isPunchedIn = true;
  //         disablePunchIn = true;
  //       });
  //     } else if (attendance.punchedIn != null &&
  //         attendance.punchedOut == null) {
  //       setState(() => isPunchedIn = true);
  //     } else {
  //       setState(() => isPunchedIn = false);
  //     }
  //   } catch (_) {
  //     setState(() {
  //       isPunchedIn = false;
  //       disablePunchIn = true;
  //     });
  //   }
  // }

  // Stream<Attendance> get _getAttendance async* {
  //   try {
  //     final doc = await FirebaseFirestore.instance
  //         .collection('common')
  //         .doc('attendance')
  //         .collection(DateFormat('yyyy-MM-dd').format(DateTime.now()))
  //         .doc(authController.firebaseUser.value!.uid)
  //         .get();
  //     if (!doc.exists) return;
  //     final attendance = Attendance.fromJson(doc.data()!);
  //     yield attendance;
  //   } catch (_) {
  //     yield const Attendance();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
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
                        // Probation Bar
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
                        // Hold to punch-in button
                        disablePunchIn
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onLongPress: disablePunchIn
                                    ? null
                                    : () async {
                                        // Get.defaultDialog(
                                        //   title: "Please Wait",
                                        //   content: const Text(
                                        //     "Checking if you are punched in",
                                        //   ),
                                        //   barrierDismissible: false,
                                        // );

                                        // final doc = await FirebaseFirestore
                                        //     .instance
                                        //     .collection('common')
                                        //     .doc('attendance')
                                        //     .collection(DateFormat('yyyy-MM-dd')
                                        //         .format(DateTime.now()))
                                        //     .doc(authController
                                        //         .firebaseUser.value!.uid)
                                        //     .get();
                                        //
                                        // if (Get.isDialogOpen == true) {
                                        //   Get.back(closeOverlays: true);
                                        // }
                                        //
                                        // if (!doc.exists) {
                                        //   Get.defaultDialog(
                                        //     title: 'Please Wait',
                                        //     content: const Text('Punching in'),
                                        //     barrierDismissible: false,
                                        //   );
                                        //   await FirebaseFirestore.instance
                                        //       .collection('common')
                                        //       .doc('attendance')
                                        //       .collection(
                                        //           DateFormat('yyyy-MM-dd')
                                        //               .format(DateTime.now()))
                                        //       .doc(authController
                                        //           .firebaseUser.value!.uid)
                                        //       .set({
                                        //     'punchedIn':
                                        //         FieldValue.serverTimestamp(),
                                        //     'punchedBy': FirebaseFirestore
                                        //         .instance
                                        //         .collection('employees')
                                        //         .doc(authController
                                        //             .firebaseUser.value!.uid),
                                        //     'under': FirebaseFirestore.instance
                                        //         .collection('admin')
                                        //         .doc(
                                        //           authController.employee.value!
                                        //               .creator!.id,
                                        //         ),
                                        //     'createdAt':
                                        //         FieldValue.serverTimestamp(),
                                        //   });

                                        // if (Get.isDialogOpen == true) {
                                        //   Get.back(closeOverlays: true);
                                        // }

                                        // Get.snackbar(
                                        //   "Punch In",
                                        //   "You are now punched in",
                                        //   backgroundColor: Colors.green,
                                        //   duration:
                                        //       const Duration(seconds: 2),
                                        //   snackPosition: SnackPosition.BOTTOM,
                                        //   margin: const EdgeInsets.all(16),
                                        //   colorText: Colors.white,
                                        // );

                                        // setState(() => isPunchedIn = true);
                                        // } else {
                                        //   Get.defaultDialog(
                                        //     title: 'Please Wait',
                                        //     content: const Text('Punching out'),
                                        //     barrierDismissible: false,
                                        //   );
                                        //   final attendance =
                                        //       Attendance.fromJson(doc.data()!);
                                        //
                                        //   if (attendance.punchedIn != null &&
                                        //       attendance.punchedOut != null) {
                                        //     Get.snackbar(
                                        //       "Punch In",
                                        //       "You are already punched in",
                                        //       backgroundColor: Colors.red,
                                        //       duration:
                                        //           const Duration(seconds: 2),
                                        //       snackPosition:
                                        //           SnackPosition.BOTTOM,
                                        //       margin: const EdgeInsets.all(16),
                                        //       colorText: Colors.white,
                                        //     );
                                        //   } else if (attendance.punchedIn !=
                                        //           null &&
                                        //       attendance.punchedOut == null) {
                                        //     await FirebaseFirestore.instance
                                        //         .collection('common')
                                        //         .doc('attendance')
                                        //         .collection(
                                        //             DateFormat('yyyy-MM-dd')
                                        //                 .format(DateTime.now()))
                                        //         .doc(authController
                                        //             .firebaseUser.value!.uid)
                                        //         .update({
                                        //       'punchedOut':
                                        //           FieldValue.serverTimestamp(),
                                        //     });
                                        //
                                        //     if (Get.isDialogOpen == true) {
                                        //       Get.back(closeOverlays: true);
                                        //     }
                                        //
                                        //     Get.snackbar(
                                        //       "Punch Out",
                                        //       "You are now punched out",
                                        //       backgroundColor: Colors.red,
                                        //       duration: const Duration(
                                        //         seconds: 2,
                                        //       ),
                                        //       snackPosition:
                                        //           SnackPosition.BOTTOM,
                                        //       margin: const EdgeInsets.all(16),
                                        //       colorText: Colors.white,
                                        //     );
                                        //     setState(
                                        //       () => disablePunchIn = true,
                                        //     );
                                        //   } else {
                                        //     Get.snackbar(
                                        //       "Punch In",
                                        //       "You are already punched out",
                                        //       backgroundColor: Colors.red,
                                        //       duration:
                                        //           const Duration(seconds: 2),
                                        //       snackPosition:
                                        //           SnackPosition.BOTTOM,
                                        //       margin: const EdgeInsets.all(16),
                                        //       colorText: Colors.white,
                                        //     );
                                        //   }
                                        // }
                                      },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: buttonColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                        ),
                                      ]),
                                  child: Center(
                                    child: Text(
                                      isPunchedIn
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
                        // Info table
                        const Column(
                          children: [
                            Row(
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
                            Divider(
                              thickness: 1,
                              color: borderColor,
                              endIndent: 16,
                              indent: 16,
                            ),
                            // TODO: Add attendance table here.
                            // StreamBuilder<Attendance>(
                            //   stream: _getAttendance,
                            //   builder: (context, snapshots) {
                            //     if (snapshots.hasData) {
                            //       final data = snapshots.requireData;
                            //       final punchedIn = data.punchedIn != null
                            //           ? DateFormat.jm().format(data.punchedIn!)
                            //           : 'N/A';
                            //       final punchedOut = data.punchedOut != null
                            //           ? DateFormat.jm().format(data.punchedOut!)
                            //           : 'N/A';
                            //
                            //       final f = DateFormat('HH:mm');
                            //       DateTime? start = data.punchedIn != null
                            //           ? f.parse(DateFormat('HH:mm')
                            //               .format(data.punchedIn!))
                            //           : null;
                            //       DateTime? end = data.punchedOut != null
                            //           ? f.parse(DateFormat('HH:mm')
                            //               .format(data.punchedOut!))
                            //           : null;
                            //
                            //       String workingHours = 'N/A';
                            //       if ((start != null && end != null) &&
                            //           end.isAfter(start)) {
                            //         end = end.add(const Duration(days: 0));
                            //         final diff = end.difference(start).abs();
                            //         final hours = diff.inHours;
                            //         final minutes = diff.inMinutes % 60;
                            //         workingHours = '$hours:$minutes Hrs';
                            //       }
                            //
                            //       return Row(
                            //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //         children: [
                            //           28.widthBox,
                            //           Expanded(
                            //             flex: 5,
                            //             child: Text(
                            //               punchedIn,
                            //               style: const TextStyle(
                            //                 fontFamily: 'Inter',
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w500,
                            //               ),
                            //             ),
                            //           ),
                            //           Expanded(
                            //             flex: 6,
                            //             child: Text(
                            //               punchedOut,
                            //               style: const TextStyle(
                            //                 fontFamily: 'Inter',
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w500,
                            //               ),
                            //             ),
                            //           ),
                            //           Text(
                            //             workingHours,
                            //             style: const TextStyle(
                            //               fontFamily: 'Inter',
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w500,
                            //             ),
                            //           ),
                            //           28.widthBox
                            //         ],
                            //       );
                            //     }
                            //     return const SizedBox.shrink();
                            //   },
                            // ),
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
                              // toggleSeriesVisibility: false,
                              isVisible: true,
                              // title: LegendTitle(
                              //   text: 'Attendance Report',
                              //   textStyle: TextStyle(
                              //     fontFamily: 'Inter',
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ),
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
                              // toggleSeriesVisibility: false,
                              isVisible: true,
                              // title: LegendTitle(
                              //   // alignment: ChartAlignment.near,
                              //   text: 'Salary Insight',
                              //   textStyle: TextStyle(
                              //     fontFamily: 'Inter',
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //   ),
                              // ),
                            ),
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
                                yValueMapper: (ChartData data, _) => data.y,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 115,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                          const Text(
                            '01 Sep - 30 Sep',
                            style: TextStyle(
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
                              const Text(
                                '20',
                                style: TextStyle(
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
                              const Text(
                                '20',
                                style: TextStyle(
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
