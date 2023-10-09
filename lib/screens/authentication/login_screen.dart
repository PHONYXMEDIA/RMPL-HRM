import 'package:flutter/material.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: mq.width * 0.3,
          ),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/LOGO.png',
                      width: 170,
                    )),
                    28.heightBox,
                    const Text(
                      'RMPL',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // height: mq.height * 0.6,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28),topRight: Radius.circular(28)),
                // borderRadius: BorderRadius.all(Radius.circular(28)
                // )
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                28.heightBox,
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
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
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: borderColor)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: borderColor)),
                      hintText: 'DEL122233',
                      filled: true,
                      fillColor: lightGreyColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                20.heightBox,
                const Text(
                  'Enter your password',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: borderColor)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: borderColor)),
                    hintText: '**********',
                    filled: true,
                    fillColor: lightGreyColor,
                  ),
                ),
                20.heightBox,
                customButton(() {}, 'Login'),
                8.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need some help?',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Contact admin',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
