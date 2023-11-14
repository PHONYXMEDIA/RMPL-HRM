import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/auth_controller.dart';
import 'login_form_state.dart';
import 'models/models.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late LoginFormState formState;

  @override
  void initState() {
    super.initState();
    formState = LoginFormState();
    emailController = TextEditingController(text: formState.email.value)
      ..addListener(onEmailChaned);
    passwordController = TextEditingController(text: formState.password.value)
      ..addListener(onPasswordChaned);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: mq.width > webScreenSize ? mq.width * 0.05 : mq.width * 0.3,
            // ),
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
                      horizontal: mq.width * 0.3, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    const Text(
                      'Enter your Employee ID',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: darkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    8.heightBox,
                    customTextFormField(
                      'DEL122233',
                      controller: emailController,
                      validator: (value) {
                        return formState.email.validator(value ?? '')?.text;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    20.heightBox,
                    const Text(
                      'Enter your password',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: darkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.heightBox,
                    customTextFormField(
                      '************',
                      controller: passwordController,
                      validator: (value) {
                        return formState.password.validator(value ?? '')?.text;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    20.heightBox,
                    if (formState.status.isInProgress)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      customButton(
                        formState.isNotValid ? null : () => onSubmit(),
                        'Login',
                        context,
                      ),
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

  void onEmailChaned() {
    setState(() {
      formState = formState.copyWith(
        email: Email.dirty(
          emailController.text,
        ),
      );
    });
  }

  void onPasswordChaned() {
    setState(() {
      formState = formState.copyWith(
        password: Password.dirty(
          passwordController.text,
        ),
      );
    });
  }

  Future<void> onSubmit() async {
    if (key.currentState?.validate() == false) return;

    setState(() {
      formState = formState.copyWith(
        status: FormzSubmissionStatus.inProgress,
      );
    });

    try {
      await authController.loginWithCredentials(
        email: formState.email.value!,
        password: formState.password.value!,
      );
      setState(() {
        formState = formState.copyWith(
          status: FormzSubmissionStatus.success,
        );
      });
    } catch (_) {
      setState(() {
        formState = formState.copyWith(
          status: FormzSubmissionStatus.failure,
        );
      });
    }
  }

  void resetForm() {
    key.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    setState(() => formState = LoginFormState());
  }
}
