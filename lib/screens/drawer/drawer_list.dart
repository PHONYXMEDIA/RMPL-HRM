import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget drawerList(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 28),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Home.svg',
          color: darkColor,
        ),
        12.widthBox,
        Expanded(
            child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500),
        )),
        const Icon(Icons.arrow_forward_ios)
      ],
    ),
  );
}
