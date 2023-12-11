import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String? hintText;
  final String? value;
  final Map<String, String>? items;
  final void Function(String?)? onChanged;

  const CustomDropdownField({
    super.key,
    this.hintText,
    this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
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
        filled: true,
        hintText: hintText,
        fillColor: AppColor.lightGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: items?.keys
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                items![e]!,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
