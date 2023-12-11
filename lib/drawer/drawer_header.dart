import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      color: AppColor.primaryColor,
      padding: EdgeInsets.only(
        left: 16,
        top: mq.width * 0.15,
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/LOGO.png',
            width: mq.width * 0.3,
          ),
          12.widthBox,
          const Text(
            'Recorded\nMusic\nPrivate\nLimited',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
