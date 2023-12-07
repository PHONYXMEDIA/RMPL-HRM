import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

class SalaryItem extends StatelessWidget {
  const SalaryItem({
    super.key,
    required this.serialNumber,
    required this.date,
    required this.amount,
  });

  final String serialNumber;
  final String date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          serialNumber,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          'INR $amount',
          style: const TextStyle(
            color: primaryColor,
            fontSize: 14.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    );
  }
}
