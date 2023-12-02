import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/state/leave/models/leave.dart';

Widget manageLeaveCard({
  required Color color,
  required Leave leave,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 12,
    ),
    margin: const EdgeInsets.symmetric(
      vertical: 8,
    ),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: borderColor,
          blurRadius: 4,
          blurStyle: BlurStyle.outer,
        )
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: borderColor,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Calendar.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            8.widthBox,
            Expanded(
              child: Text(
                leave.date != null
                    ? leave.date.withoutYear
                    : '${leave.fromDate.withoutYear} - ${leave.toDate.withoutYear}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Status: ${leave.status}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        12.heightBox,
        Text(
          'Leave type: ${leave.leaveType} leave',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            // color: textGreyColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        8.heightBox,
        Text(
          'Applied on: ${leave.createdAt.formattedDateSecondary}',
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            // color: textGreyColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
