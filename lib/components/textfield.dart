import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

Widget customTextFormField(
  String text, {
  TextEditingController? controller,
  String? Function(String?)? validator,
  TextInputAction? textInputAction,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: borderColor),
      ),
      hintText: text,
      filled: true,
      fillColor: lightGreyColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    validator: validator,
    textInputAction: textInputAction,
  );
}
