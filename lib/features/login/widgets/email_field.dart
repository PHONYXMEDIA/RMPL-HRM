import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/state/login/models/email.dart';
import 'package:rmpl_hrm/state/login/providers/login.dart';

class EmailTextField extends ConsumerWidget {
  const EmailTextField({
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
          'Enter your Employee ID',
          style: TextStyle(
            fontFamily: 'Inter',
            color: darkColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          hintText: 'DEL122233',
          controller: controller,
          textInputAction: TextInputAction.next,
          onChanged: ref.read(loginProvider.notifier).updateEmail,
          errorText: ref.watch(loginProvider).email.displayError?.text,
        ),
      ],
    );
  }
}
