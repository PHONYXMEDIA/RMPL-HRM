import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/extensions/object/errorMessage.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/state/auth/notifiers/auth_state_notifier.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mq = MediaQuery.of(context).size;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(
      authStateNotifierProvider,
      (_, state) {
        if (!state.hasError) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(state.error.text),
              backgroundColor: Colors.red,
            ),
          );
      },
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/LOGO.png',
                  width: 170,
                ),
              ),
            ),
            Container(
              // height: mq.height * 0.6,
              width: double.infinity,
              padding: mq.width > webScreenSize
                  ? EdgeInsets.symmetric(
                      horizontal: mq.width * 0.3,
                      vertical: 20,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                // borderRadius: BorderRadius.all(Radius.circular(28)
                // )
              ),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.heightBox,
                    const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    20.heightBox,
                    EmailTextField(
                      controller: emailController,
                    ),
                    20.heightBox,
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    20.heightBox,
                    const LoginButton(),
                    8.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Need some help?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Contact admin',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
