import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.errorText,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        hintText: hintText,
        filled: true,
        fillColor: AppColor.lightGreyColor,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorText: errorText,
      ),
      textInputAction: textInputAction,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
