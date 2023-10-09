import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

Widget customButton(void Function()? onPress, String text) {
  return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
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
