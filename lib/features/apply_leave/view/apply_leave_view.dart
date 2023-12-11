import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/components/button.dart';
import 'package:rmpl_hrm/components/custom_dropdown_field.dart';
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';

class ApplyLeaveView extends ConsumerWidget {
  const ApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      applyLeaveProvider,
      (previous, next) {
        if (next != previous) {
          if (next.oneDayState.status.isSuccess ||
              next.multipleDayState.status.isSuccess) {
            Navigator.of(context).maybePop();
          }
          if (next.oneDayState.status.isFailure ||
              next.multipleDayState.status.isFailure) {
            ScaffoldMessenger.maybeOf(context)
              ?..removeCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong'),
                ),
              );
          }
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
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
          color: AppColor.whiteColor,
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.borderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => ref
                              .read(selectedDayTypeProvider.notifier)
                              .onChange(DayTypeStatus.oneDay),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.watch(selectedDayTypeProvider).isOneDay
                                  ? AppColor.buttonColor.withOpacity(0.3)
                                  : AppColor.whiteColor,
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
                          onTap: () => ref
                              .read(selectedDayTypeProvider.notifier)
                              .onChange(DayTypeStatus.multipleDay),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.watch(selectedDayTypeProvider).isOneDay
                                  ? AppColor.whiteColor
                                  : AppColor.buttonColor.withOpacity(0.3),
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
                ref.watch(selectedDayTypeProvider).isOneDay
                    ? const _OneDayLeaveForm()
                    : const _MultipleDayLeaveForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OneDayLeaveForm extends HookConsumerWidget {
  const _OneDayLeaveForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();

    useEffect(() {
      final date = ref.watch(applyLeaveProvider).oneDayState.date.value;
      dateController.text =
          date != null ? DateTime.tryParse(date).formattedDate : '';
      return null;
    }, [ref.watch(applyLeaveProvider).oneDayState.date.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          hintText: 'Select Date',
          suffixIcon: const Icon(Icons.calendar_month),
          controller: dateController,
          readOnly: true,
          onTap: () async {
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
              ref
                  .read(applyLeaveProvider.notifier)
                  .dateChanged(selectedDate.toString());
            }
          },
        ),
        12.heightBox,
        const Text(
          'Full Day / Half Day',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomDropdownField(
          hintText: 'Select',
          value: DayType.types.contains(ref
                  .watch(applyLeaveProvider)
                  .oneDayState
                  .dayType
                  .value
                  ?.toLowerCase())
              ? ref
                  .watch(applyLeaveProvider)
                  .oneDayState
                  .dayType
                  .value
                  ?.toLowerCase()
              : null,
          items: const {
            'full': 'Full Day',
            'half': 'Half Day',
          },
          onChanged: ref.read(applyLeaveProvider.notifier).dayTypeChanged,
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
          value: LeaveType.types.contains(ref
                      .watch(applyLeaveProvider)
                      .oneDayState
                      .leaveType
                      .value
                      ?.toLowerCase() ??
                  '')
              ? ref
                  .watch(applyLeaveProvider)
                  .oneDayState
                  .leaveType
                  .value
                  ?.toLowerCase()
              : null,
          onChanged: ref.read(applyLeaveProvider.notifier).leaveTypeChanged,
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
          initialValue: ref.read(applyLeaveProvider).oneDayState.reason.value,
          maxLines: 5,
          decoration: InputDecoration(
            errorText: ref
                .watch(applyLeaveProvider)
                .oneDayState
                .reason
                .displayError
                ?.text,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColor.borderColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColor.borderColor),
            ),
            hintText: 'Write your reason in 100 characters',
            filled: true,
            fillColor: AppColor.lightGreyColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: ref.read(applyLeaveProvider.notifier).reasonChanged,
        ),
        24.heightBox,
        ref.watch(applyLeaveProvider).oneDayState.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomButton(
                onPress: !ref.watch(applyLeaveProvider).oneDayState.isValid
                    ? null
                    : ref.read(applyLeaveProvider.notifier).submit,
                text: 'Apply Leave',
              ),
        12.heightBox,
      ],
    );
  }
}

class _MultipleDayLeaveForm extends HookConsumerWidget {
  const _MultipleDayLeaveForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromDateController = useTextEditingController();
    final toDateController = useTextEditingController();

    useEffect(() {
      final date = ref
          .watch(
            applyLeaveProvider,
          )
          .multipleDayState
          .fromDate
          .value;
      fromDateController.text =
          date != null ? DateTime.tryParse(date).formattedDate : '';
      return null;
    }, [ref.watch(applyLeaveProvider).multipleDayState.fromDate]);

    useEffect(() {
      final date = ref.watch(applyLeaveProvider).multipleDayState.toDate.value;
      toDateController.text =
          date != null ? DateTime.tryParse(date).formattedDate : '';
      return null;
    }, [ref.watch(applyLeaveProvider).multipleDayState.toDate]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select from date',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          hintText: 'Select from Date',
          readOnly: true,
          suffixIcon: const Icon(Icons.calendar_month),
          controller: fromDateController,
          onTap: () async {
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
              ref
                  .read(applyLeaveProvider.notifier)
                  .fromDateChanged(selectedDate.toString());
            }
          },
        ),
        12.heightBox,
        const Text(
          'Select to date',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          hintText: 'Select To Date',
          controller: toDateController,
          suffixIcon: const Icon(Icons.calendar_month),
          onTap: () async {
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
              ref
                  .read(applyLeaveProvider.notifier)
                  .toDateChanged(selectedDate.toString());
            }
          },
          readOnly: true,
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
          value: LeaveType.types.contains(ref
                      .watch(applyLeaveProvider)
                      .oneDayState
                      .leaveType
                      .value
                      ?.toLowerCase() ??
                  '')
              ? ref
                  .watch(applyLeaveProvider)
                  .oneDayState
                  .leaveType
                  .value
                  ?.toLowerCase()
              : null,
          items: const {
            'sick': 'Sick Leave',
            'casual': 'Casual Leave',
          },
          onChanged: ref.read(applyLeaveProvider.notifier).leaveTypeChanged,
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
          initialValue: ref
              .read(
                applyLeaveProvider,
              )
              .multipleDayState
              .reason
              .value,
          decoration: InputDecoration(
            errorText: ref
                .watch(applyLeaveProvider)
                .multipleDayState
                .reason
                .displayError
                ?.text,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColor.borderColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: AppColor.borderColor),
            ),
            hintText: 'Write your reason in 100 characters',
            filled: true,
            fillColor: AppColor.lightGreyColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: ref.read(applyLeaveProvider.notifier).reasonChanged,
        ),
        24.heightBox,
        ref.watch(applyLeaveProvider).multipleDayState.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomButton(
                onPress: !ref.watch(applyLeaveProvider).multipleDayState.isValid
                    ? null
                    : ref.read(applyLeaveProvider.notifier).submit,
                text: 'Apply Leave',
              ),
        12.heightBox,
      ],
    );
  }
}
