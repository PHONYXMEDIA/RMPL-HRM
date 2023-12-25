import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/salary_details/salary_details.dart';
import 'package:providers/providers.dart';

class SalaryDetailsView extends ConsumerWidget {
  const SalaryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
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
              const SizedBox(height: 12),
              const Text(
                'Total Salary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'INR ${ref.watch(totalSalaryProvider)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 28.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              _buildTableHeader(),
              const SizedBox(height: 8),
              _buildSalaryDetails(profile?.salaryDetails ?? {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildHeaderItem('S.NO.', alignment: TextAlign.center),
          ),
          Expanded(
            flex: 3,
            child: _buildHeaderItem('Date', alignment: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: _buildHeaderItem('Amount', alignment: TextAlign.left),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String text, {TextAlign? alignment}) {
    return Text(
      text,
      textAlign: alignment,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSalaryDetails(
    Map<Object?, Map<Object?, SalaryDetail>> salaryDetails,
  ) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8.0),
        itemCount: salaryDetails.length,
        itemBuilder: (context, yearIndex) {
          final year = salaryDetails.keys.elementAt(yearIndex);
          final monthDetails = Map<String, SalaryDetail>.fromEntries(
            (salaryDetails[year] ?? {}).entries.map(
                  (entry) => MapEntry(entry.key as String, entry.value),
                ),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$year',
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: monthDetails.length,
                itemBuilder: (context, monthIndex) {
                  final month = monthDetails.keys.elementAt(monthIndex);
                  final amount = salaryDetails[year]?[month]?.amount ?? 0;
                  final create =
                      salaryDetails[year]?[month]?.createdAt as DateTime? ??
                          DateTime.now();
                  final formattedDate = DateFormat.yMMMMd().format(create);

                  return SalaryItemWidget(
                    serialNumber: '${salaryDetails.length - monthIndex + 1}',
                    date: formattedDate,
                    amount: '₹ $amount',
                  );
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

class SalaryItemWidget extends StatelessWidget {
  final String serialNumber;
  final String date;
  final String amount;

  const SalaryItemWidget({
    Key? key,
    required this.serialNumber,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              serialNumber,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              date,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              amount,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
