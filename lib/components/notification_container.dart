import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget notificationContianer(String text) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    margin: EdgeInsets.only(top: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: darkColor,
              fontWeight: FontWeight.w500),
        ),
        4.heightBox,
        Text(
          'Date and Time: 24.10.2023 11:00AM IST',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: textGreyColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
