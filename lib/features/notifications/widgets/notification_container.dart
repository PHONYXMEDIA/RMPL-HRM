import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.text,
    required this.notificationTime,
  }) : super(key: key);

  final String text;
  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDateTime = _parseDateTime(notificationTime);

    if (parsedDateTime == null) {
      // Handle the case where parsing failed
      return Container();
    }

    String formattedDateTime =
        DateFormat('dd.MM.yyyy hh:mm a').format(parsedDateTime);

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
            'Date and Time: $formattedDateTime IST',
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

  DateTime _parseDateTime(String dateTimeString) {
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      print('Error parsing dateTimeString: $e');
      return DateTime.now();
    }
  }
}
