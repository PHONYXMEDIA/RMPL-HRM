import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/login/login.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  Future<void> saveFcmTokenToFirebase(String fcmToken) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('employee')
          .doc(user.uid)
          .set({'token': fcmToken}, SetOptions(merge: true));
    }
  }

  Future<void> saveFcmToken() async {
    final String? fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      await saveFcmTokenToFirebase(fcmToken);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mq = MediaQuery.of(context).size;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
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
              width: double.infinity,
              padding: mq.width > Dimensions.webScreenSize
                  ? EdgeInsets.symmetric(
                      horizontal: mq.width * 0.3,
                      vertical: 20,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
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
                          color: AppColor.darkColor,
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
