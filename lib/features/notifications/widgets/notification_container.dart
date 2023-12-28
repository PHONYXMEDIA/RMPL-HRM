import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.text,
    required this.date,
  });

  final String text;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                color: AppColor.darkColor,
                fontWeight: FontWeight.w500),
          ),
          6.heightBox,
          Text(
            'Date and Time: ${date != null ? DateFormat('dd.MM.yyyy').format(date!) : 'N/A'} ${date != null ? DateFormat.jm().format(date!) : ''}',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: AppColor.textGreyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
