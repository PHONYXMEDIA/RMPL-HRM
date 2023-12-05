import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

class HolidayContainer extends StatelessWidget {
  const HolidayContainer({
    super.key,
    required this.date,
    required this.reason,
  });

  final String date;
  final String reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      child: Row(
        children: [
          Text(
            date,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            reason,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: textGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
