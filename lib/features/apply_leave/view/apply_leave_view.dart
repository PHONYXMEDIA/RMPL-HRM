import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/components/custom_dropdown_field.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class ApplyLeaveView extends HookWidget {
  const ApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
    final dateController = useTextEditingController();
    final selectFromDateController = useTextEditingController();
    final selectToDateController = useTextEditingController();
    final dayTypeController = useTextEditingController();
    final leaveController = useTextEditingController();
    final reasonController = useTextEditingController();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Apply Leave',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: double.infinity,
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
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => isSelected.value = true,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isSelected.value
                                  ? buttonColor.withOpacity(0.3)
                                  : whiteColor,
                            ),
                            child: const Center(
                              child: Text(
                                'One Day',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => isSelected.value = false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isSelected.value
                                  ? whiteColor
                                  : buttonColor.withOpacity(0.3),
                            ),
                            child: const Center(
                              child: Text(
                                'Multiple Day',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                20.heightBox,

                Text(
                  isSelected.value ? 'Date' : 'Select from date',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                isSelected.value
                    ? customTextFormField(
                        'Select Date',
                        controller: dateController,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                              ),
                              lastDate: DateTime(3000),
                            );
                            if (selectedDate != null) {
                              dateController.text = selectedDate.toString();
                            }
                          },
                        ),
                      )
                    : customTextFormField(
                        'Select from Date',
                        controller: selectFromDateController,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                              ),
                              lastDate: DateTime(3000),
                            );
                            if (selectedDate != null) {
                              selectFromDateController.text =
                                  selectedDate.toString();
                            }
                          },
                        ),
                      ),
                12.heightBox,
                Text(
                  isSelected.value ? 'Full Day / Half Day' : 'Select to date',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                isSelected.value
                    ? CustomDropdownField(
                        hintText: 'Select',
                        items: const {
                          'full': 'Full Day',
                          'half': 'Half Day',
                        },
                        onChanged: (value) {
                          dayTypeController.text = value ?? '';
                        },
                      )
                    : customTextFormField(
                        'Select To Date',
                        controller: selectToDateController,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                              ),
                              lastDate: DateTime(3000),
                            );
                            if (selectedDate != null) {
                              selectToDateController.text =
                                  selectedDate.toString();
                            }
                          },
                        ),
                      ),
                12.heightBox,
                const Text(
                  'Leave Type',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomDropdownField(
                  hintText: 'Select Leave Type',
                  items: const {
                    'sick': 'Sick Leave',
                    'casual': 'Casual Leave',
                  },
                  onChanged: (value) {
                    leaveController.text = value ?? '';
                  },
                ),

                12.heightBox,
                const Text(
                  'Reason',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                TextFormField(
                  maxLines: 5,
                  controller: reasonController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    hintText: 'Write your reason in 100 characters',
                    filled: true,
                    fillColor: lightGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                24.heightBox,
                customButton(
                  () async {
                    // if (isSelected) {
                    //   try {
                    //     await db.collection("leave").add({
                    //       "date": Timestamp.fromDate(
                    //         DateTime.parse(
                    //           _dateController.text,
                    //         ),
                    //       ),
                    //       "dayType": _dayTypeController.text,
                    //       "leaveType": _leaveController.text,
                    //       "reason": _reasonController.text,
                    //       "createdAt": FieldValue.serverTimestamp(),
                    //       "status": "pending",
                    //       "uid": db
                    //           .collection(
                    //             'employees',
                    //           )
                    //           .doc(
                    //             authController.firebaseUser.value?.uid,
                    //           ),
                    //     });
                    //     if (mounted) {
                    //       Navigator.of(context).pop();
                    //       Get.snackbar(
                    //         "Success",
                    //         "Leave Applied",
                    //         backgroundColor: Colors.green,
                    //         colorText: Colors.white,
                    //         snackPosition: SnackPosition.BOTTOM,
                    //         margin: const EdgeInsets.all(16),
                    //       );
                    //     }
                    //   } catch (e) {
                    //     Get.snackbar(
                    //       "Error",
                    //       e.toString(),
                    //       backgroundColor: Colors.red,
                    //       colorText: Colors.white,
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       margin: const EdgeInsets.all(16),
                    //     );
                    //   }
                    // } else {
                    //   try {
                    //     await db.collection("leave").add({
                    //       "fromDate": Timestamp.fromDate(
                    //         DateTime.parse(
                    //           _selectFromDateController.text,
                    //         ),
                    //       ),
                    //       "toDate": Timestamp.fromDate(
                    //         DateTime.parse(
                    //           _selectToDateController.text,
                    //         ),
                    //       ),
                    //       "leaveType": _leaveController.text,
                    //       "reason": _reasonController.text,
                    //       "status": "pending",
                    //       "createdAt": FieldValue.serverTimestamp(),
                    //       "uid": db
                    //           .collection(
                    //             'employees',
                    //           )
                    //           .doc(
                    //             authController.firebaseUser.value?.uid,
                    //           ),
                    //     });
                    //
                    //     if (mounted) {
                    //       Navigator.of(context).pop();
                    //       Get.snackbar(
                    //         "Success",
                    //         "Leave Applied",
                    //         backgroundColor: Colors.green,
                    //         colorText: Colors.white,
                    //         snackPosition: SnackPosition.BOTTOM,
                    //         margin: const EdgeInsets.all(16),
                    //       );
                    //     }
                    //   } catch (e) {
                    //     Get.snackbar(
                    //       "Error",
                    //       e.toString(),
                    //       backgroundColor: Colors.red,
                    //       colorText: Colors.white,
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       margin: const EdgeInsets.all(16),
                    //     );
                    //   }
                    // }
                  },
                  'Apply Leave',
                  context,
                ),
                12.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
