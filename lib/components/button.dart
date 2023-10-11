import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/main.dart';

Widget customButton(void Function()? onPress, String text, context) {
  mq = MediaQuery.of(context).size;
  return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: mq.width > webScreenSize
              ? MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20))
              : MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          elevation: MaterialStatePropertyAll(3.0)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ));
}
