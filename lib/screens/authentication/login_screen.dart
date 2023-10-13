import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/constants/dimensions.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:rmpl_hrm/screens/apply_leave_screen.dart';
import 'package:rmpl_hrm/screens/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
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
              padding: mq.width > webScreenSize ? EdgeInsets.symmetric(horizontal: mq.width * 0.3, vertical: 20) : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                // borderRadius: BorderRadius.all(Radius.circular(28)
                // )
              ),
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
                    style: TextStyle(fontFamily: 'Inter', color: darkColor, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  8.heightBox,
                  customTextFormField('DEL122233', idController),
                  20.heightBox,
                  const Text(
                    'Enter your password',
                    style: TextStyle(fontFamily: 'Inter', color: darkColor, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  8.heightBox,
                  customTextFormField('************', passController),
                  20.heightBox,
                  customButton(() {
                    Get.off(() => const HomeScreen());
                  }, 'Login', context),
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
            )
          ],
        ),
      ),
    );
  }
}
