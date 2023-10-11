import 'package:flutter/material.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/textfield.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  final _departmentController = TextEditingController();
  final _dateController = TextEditingController();
  final _fulldayController = TextEditingController();
  final _leaveController = TextEditingController();
  final _reasonController = TextEditingController();
  final _selecttodateController = TextEditingController();
  final _selectfromdateController = TextEditingController();

  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 0,
      //   title: const Text(
      //     'Manage Leave',
      //     style: TextStyle(
      //         fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w600),
      //   ),
      // ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(20)
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected
                                ? buttonColor.withOpacity(0.3)
                                : whiteColor),
                        child: const Text(
                          'One Day',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: Colors.amber
                            color: isSelected
                                ? whiteColor
                                : buttonColor.withOpacity(0.3)),
                        child: const Text(
                          'Multiple Day',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              20.heightBox,
              const Text(
                'Department',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              customTextFormField('Select Department', _departmentController),
              12.heightBox,
              Text(
                isSelected ? 'Date' : 'Select from date',
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              isSelected
                  ? customTextFormField('Select Date', _departmentController)
                  : customTextFormField(
                      'Select from Date', _departmentController),
              12.heightBox,
              Text(
                isSelected ? 'Full Day / Half Day' : 'Select to date',
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              isSelected
                  ? customTextFormField('Select', _departmentController)
                  : customTextFormField(
                      'Select To Date', _departmentController),
              12.heightBox,
              const Text(
                'Leave Type',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              customTextFormField('Select Leave Type', _departmentController),
              12.heightBox,
              const Text(
                'Reason',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              8.heightBox,
              TextFormField(
                maxLines: 5,
                controller: _departmentController,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: borderColor)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: borderColor)),
                    hintText: 'Write your reason in 100 characters',
                    filled: true,
                    fillColor: lightGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Expanded(child: Container()),
              customButton(() {}, 'Apply Leave', context)
            ],
          ),
        ),
      ),
    );
  }
}
