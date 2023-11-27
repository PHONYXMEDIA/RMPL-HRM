import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/main.dart';

Widget summaryContainer(String number, String text, context, Color color) {
  mq = MediaQuery.of(context).size;
  return Container(
    width: mq.width * 0.35,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor)),
    child: Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
