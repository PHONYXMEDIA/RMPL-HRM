import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   centerTitle: false,
      //   title: const Text(
      //     'My Profile',
      //     style: TextStyle(
      //       fontFamily: 'Inter',
      //       fontSize: 24,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   elevation: 0,
      // ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: mq.width * 0.3,
                    width: mq.width * 0.25,
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  16.widthBox,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rajesh Kundra',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        12.heightBox,
                        const Text(
                          'Designation',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        12.heightBox,
                        const Text(
                          'Employee since 12 August 2020',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        12.heightBox
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mq.width * 0.05,
              ),
              const Text(
                'Field 1',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              12.heightBox,
              customTextFormField('Field 1', fieldcontroller),
              16.heightBox,
              const Text(
                'Field 2',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              12.heightBox,
              customTextFormField(
                'Field 1',
                fieldcontroller,
              ),
              16.heightBox,
              const Text(
                'Field 3',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              12.heightBox,
              customTextFormField(
                'Field 1',
                fieldcontroller,
              ),
              const Spacer(),
              customButton(
                () {},
                'Save Changes',
                context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
