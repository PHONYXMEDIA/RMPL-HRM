import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm/components/manageleave_card.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/extensions/object/formatted_date.dart';
import 'package:rmpl_hrm/extensions/widget/box.dart';
import 'package:rmpl_hrm/features/apply_leave/apply_leave.dart';
import 'package:rmpl_hrm/state/leave/models/leave.dart';
import 'package:rmpl_hrm/state/leave/providers/leave.dart' hide Leave;
import 'package:rmpl_hrm/state/leave/providers/selected_leave_date.dart';

class ManageLeaveView extends ConsumerStatefulWidget {
  const ManageLeaveView({super.key});

  @override
  ConsumerState<ManageLeaveView> createState() => _ManageLeaveViewState();
}

class _ManageLeaveViewState extends ConsumerState<ManageLeaveView> {
  // final countApproved = db
  //     .collection('leave')
  //     .where(
  //       'status',
  //       isEqualTo: 'approved',
  //     )
  //     .snapshots();
  // final countRejected = db
  //     .collection('leave')
  //     .where(
  //       'status',
  //       isEqualTo: 'rejected',
  //     )
  //     .snapshots();
  // final countPending = db
  //     .collection('leave')
  //     .where(
  //       'status',
  //       isEqualTo: 'pending',
  //     )
  //     .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(ApplyLeavePage.route());
        },
        isExtended: true,
        backgroundColor: primaryColor,
        label: const Text(
          'Apply Leave',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: double.infinity,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Calendar.svg',
                      colorFilter: const ColorFilter.mode(
                        primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.widthBox,
                    Text(
                      ref.watch(selectedLeaveTimeProvider).onlyMonthAndYear,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.widthBox,
                    TextButton(
                      onPressed: () async {
                        final date = await showMonthPicker(
                          context: context,
                          initialDate: ref.watch(
                            selectedLeaveTimeProvider,
                          ),
                        );
                        if (date != null) {
                          ref
                              .read(selectedLeaveTimeProvider.notifier)
                              .onChange(date);
                        }
                      },
                      child: const Text('Change Duration'),
                    ),
                  ],
                ),
                12.heightBox,
                const Text(
                  'Leave Application',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                ref.watch(leaveProvider).when(
                      data: (leaves) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Wrap(
                            spacing: 12.0,
                            children: [
                              Text(
                                '${leaves.where((e) => e.status?.toLowerCase() == 'approved').length} Approved leave',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: greenColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${leaves.where((e) => e.status?.toLowerCase() == 'rejected').length} Rejected leave',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: redColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${leaves.where((e) => e.status?.toLowerCase() == 'pending').length} Pending leave',
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: textGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: textGreyColor,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: leaves.length,
                            itemBuilder: (context, index) {
                              final leave = leaves.elementAt(index);
                              return manageLeaveCard(
                                color: leave.color,
                                leave: leave,
                              );
                            },
                          ),
                        ],
                      ),
                      error: (err, __) => Center(
                        child: Text('Error: ${err.toString()}'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension LeaveStatusColor on Leave {
  Color get color {
    if (status?.toLowerCase() == 'approved') {
      return greenColor;
    } else if (status?.toLowerCase() == 'rejected') {
      return redColor;
    } else {
      return borderColor;
    }
  }
}
