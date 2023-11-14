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
  late final TextEditingController _departmentController;
  late final TextEditingController _dateController;
  late final TextEditingController _fulldayController;
  late final TextEditingController _leaveController;
  late final TextEditingController _reasonController;
  late final TextEditingController _selecttodateController;
  late final TextEditingController _selectfromdateController;

  bool isSelected = true;

  @override
  void initState() {
    _departmentController = TextEditingController();
    _dateController = TextEditingController();
    _fulldayController = TextEditingController();
    _leaveController = TextEditingController();
    _reasonController = TextEditingController();
    _selecttodateController = TextEditingController();
    _selectfromdateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _departmentController.dispose();
    _dateController.dispose();
    _fulldayController.dispose();
    _leaveController.dispose();
    _reasonController.dispose();
    _selecttodateController.dispose();
    _selectfromdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Apply Leave',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: whiteColor,
          // borderRadius: BorderRadius.circular(20)
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.heightBox,
                // one-day & multiple-day tab
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: borderColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isSelected
                                    ? buttonColor.withOpacity(0.3)
                                    : whiteColor),
                            child: const Center(
                              child: Text(
                                'One Day',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                // color: Colors.amber
                                color: isSelected
                                    ? whiteColor
                                    : buttonColor.withOpacity(0.3)),
                            child: const Center(
                              child: Text(
                                'Multiple Day',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
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
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                customTextFormField('Select Department', _departmentController),
                12.heightBox,
                Text(
                  isSelected ? 'Date' : 'Select from date',
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
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
                      fontSize: 14,
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
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                customTextFormField('Select Leave Type', _departmentController),
                12.heightBox,
                const Text(
                  'Reason',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
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
                24.heightBox,
                customButton(() {}, 'Apply Leave', context),
                12.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
