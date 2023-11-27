import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

Widget drawerList(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Home.svg',
          colorFilter: const ColorFilter.mode(
            whiteColor,
            BlendMode.srcIn,
          ),
        ),
        12.widthBox,
        Expanded(
            child: Text(
          text,
          style: const TextStyle(
              color: whiteColor,
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        )),
        const Icon(
          Icons.arrow_forward_ios,
          color: whiteColor,
        )
      ],
    ),
  );
}
