import 'package:flutter/material.dart';
import 'package:providers/providers.dart'; // Import your providers package
import 'package:rmpl_hrm/components/textfield.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(profileProvider);
    final mq = MediaQuery.of(context).size;

    String formatDate(String date) {
      final parsedDate = DateTime.parse(date);
      final formattedDate = DateFormat.yMd().format(parsedDate);
      return formattedDate;
    }

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: mq.width * 0.3,
                      width: mq.width * 0.25,
                      decoration: BoxDecoration(
                        color: AppColor.lightGreyColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        '${profileData?.profilePic}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profileData?.firstName}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          12.heightBox,
                          Text(
                            '${profileData?.designation}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          12.heightBox,
                          Text(
                            'Employee since ${profileData?.dateJoined}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          12.heightBox,
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                _buildProfileField('Employee ID', '${profileData?.eid}'),
                _buildProfileField('Password', '${profileData?.password}'),
                _buildProfileField('First Name', '${profileData?.firstName}'),
                _buildProfileField('Last Name', '${profileData?.lastName}'),
                _buildProfileField('Date of Birth', '${profileData?.dob}'),
                _buildProfileField(
                    'Designation', '${profileData?.designation}'),
                _buildProfileField('Date Joined', '${profileData?.dateJoined}'),
                _buildProfileField(
                    'Father Name', '${profileData?.fathersName}'),
                _buildProfileField('Address', '${profileData?.address}'),
                _buildProfileField('Email', '${profileData?.email}'),
                _buildProfileField(
                    'Aadhar Number', '${profileData?.aadharNumber}'),
                _buildProfileField('Pan Number', '${profileData?.panNumber}'),
                _buildProfileField(
                    'Basic Salary', '${profileData?.basicSalary}'),
                _buildProfileField('HRA', '${profileData?.hra}'),
                _buildProfileField('Field Work Allowance',
                    '${profileData?.fieldWorkAllowance}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        12.heightBox,
        CustomTextFormField(
          hintText: label,
          controller: TextEditingController(text: value),
          readOnly: true,
        ),
      ],
    );
  }
}
