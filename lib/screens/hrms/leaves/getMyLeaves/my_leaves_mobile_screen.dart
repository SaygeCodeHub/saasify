import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../../utils/formatters.dart';
class MyLeavesMobileScreen extends StatelessWidget {
  final List<MyLeaves> myLeaves;

  const MyLeavesMobileScreen({super.key, required this.myLeaves});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: spacingSmall);
          },
          itemCount: myLeaves.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(spacingSmall),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LeaveDetails(
                            leaveData: myLeaves[index].leaveType,
                            title: StringConstants.kLeaveType),
                        const SizedBox(width: spacingLarger),
                        LeaveDetails(
                            leaveData: myLeaves[index].leaveStatus.toString(),
                            title: StringConstants.kLeaveStatus),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LeaveDetails(
                              leaveData: formatDate(
                                  myLeaves[index].startDate.toString()),
                              title: StringConstants.kStartDate),
                          const SizedBox(width: spacingSmall),
                          LeaveDetails(
                              leaveData: formatDate(
                                  myLeaves[index].endDate.toString()),
                              title: StringConstants.kEndDate)
                        ]),
                    LeaveDetails(
                        leaveData: myLeaves[index].approvers.join(", "),
                        title: StringConstants.kApprovers),
                    const LeaveDetails(
                        leaveData: "Comments by approver!",
                        title: StringConstants.kComments)
                  ]),
            ));
          }),
    );
  }
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
