import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:providers/providers.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/salary_details/salary_details.dart';

class SalaryDetailsView extends ConsumerWidget {
  const SalaryDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              12.heightBox,
              const Text(
                'Total Salary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              8.heightBox,
              Text(
                'INR ${ref.watch(totalSalaryProvider)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 26.0,
                    height: 4.0,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ],
              ),
              8.heightBox,
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Basic Salary: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'INR ${ref.watch(profileProvider)?.basicSalary}',
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              8.heightBox,
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'HRA: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'INR ${ref.watch(profileProvider)?.hra}',
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              8.heightBox,
              const Divider(),
              4.heightBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      'S.NO.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Amount',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              4.heightBox,
              const Divider(),
              ref.watch(salaryDetailsProvider).when(
                    data: (details) => details.isEmpty
                        ? const Center(
                            child: Text(
                              'No Salary Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.only(top: 8.0),
                              separatorBuilder: (context, index) => 8.heightBox,
                              itemCount: details.length,
                              itemBuilder: (context, index) {
                                final detail = details.elementAt(index);
                                return SalaryItem(
                                  serialNumber: '${index + 1}',
                                  date: detail.createdAt.formattedDate,
                                  amount: '${detail.amount}',
                                );
                              },
                            ),
                          ),
                    error: (_, __) => const Text('Error'),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
