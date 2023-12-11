import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter your password',
          style: TextStyle(
            fontFamily: 'Inter',
            color: AppColor.darkColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          hintText: '************',
          controller: controller,
          textInputAction: TextInputAction.done,
          onChanged: ref.read(loginProvider.notifier).updatePassword,
          errorText: ref.watch(loginProvider).password.displayError?.text,
        ),
      ],
    );
  }
}
