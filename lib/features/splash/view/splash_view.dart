import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Center(
              child: Image.asset(
            'assets/images/LOGO.png',
            width: 170,
          )),
          28.heightBox,
          const Text(
            'RMPL',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              fontSize: 40,
              // height: 2
            ),
          ),
          4.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.45,
            ),
            child: Container(
              width: double.infinity,
              height: 4,
              decoration: BoxDecoration(
                color: AppColor.lightGreyColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          16.heightBox,
          const Text(
            'Recorded Music Private Limited',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w500,
              // letterSpacing: 4,
              fontSize: 20,
              // height: 2
            ),
          ),
          20.heightBox,
          const Text(
            'Feel the beat',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColor.whiteColor,
              fontSize: 18,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const SizedBox(
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              colors: [AppColor.whiteColor],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Powered by Quickgick',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              // height: 2
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
