import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/main.dart';

Widget customButton(
  void Function()? onPress,
  String text,
  BuildContext context,
) {
  mq = MediaQuery.of(context).size;
  return ElevatedButton(
    onPressed: onPress,
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      padding: mq.width > webScreenSize
          ? const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 20),
            )
          : const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16),
            ),
      backgroundColor: MaterialStatePropertyAll(
        onPress == null
            ? buttonColor.withOpacity(
                0.6,
              )
            : buttonColor,
      ),
      elevation: const MaterialStatePropertyAll(
        3.0,
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
