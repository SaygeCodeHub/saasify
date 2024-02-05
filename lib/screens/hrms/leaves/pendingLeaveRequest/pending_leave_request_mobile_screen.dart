import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/update_status_popup.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class PendingLeaveRequestsMobileScreen extends StatelessWidget {
  final List<MyLeaves> pendingLeaves;

  const PendingLeaveRequestsMobileScreen(
      {super.key, required this.pendingLeaves});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: spacingSmall);
            },
            itemCount: pendingLeaves.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSmall),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LeaveDetails(
                                leaveData: pendingLeaves[index].name.toString(),
                                title: StringConstants.kApplicantName),
                            LeaveDetails(
                                leaveData: pendingLeaves[index].leaveType,
                                title: StringConstants.kLeaveType),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LeaveDetails(
                                      leaveData: formatDate(pendingLeaves[index]
                                          .startDate
                                          .toString()),
                                      title: StringConstants.kStartDate),
                                  const SizedBox(width: spacingSmall),
                                  LeaveDetails(
                                      leaveData: formatDate(pendingLeaves[index]
                                          .endDate
                                          .toString()),
                                      title: StringConstants.kEndDate)
                                ]),
                            LeaveDetails(
                                leaveData: pendingLeaves[index].leaveReason,
                                title: StringConstants.kLeaveReason),
                            PrimaryButton(
                                buttonWidth: 10,
                                buttonHeight: 7,
                                buttonTitle: StringConstants.kTakeAction,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => UpdateStatusPopup(
                                          isMobile: true,
                                          pendingLeaves: pendingLeaves[index]));
                                })
                          ])));
            }));
  }
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
