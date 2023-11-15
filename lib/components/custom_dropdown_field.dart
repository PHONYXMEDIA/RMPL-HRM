import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String? hintText;
  final Map<String, String>? items;
  final void Function(String?)? onChanged;

  const CustomDropdownField({
    super.key,
    this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: borderColor),
        ),
        filled: true,
        hintText: hintText,
        fillColor: lightGreyColor,
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
