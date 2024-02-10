import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_details_navigation_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class MyLeavesMobileScreen extends StatelessWidget {
  final List<MyLeaves> myLeaves;

  const MyLeavesMobileScreen({super.key, required this.myLeaves});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: spacingSmall);
        },
        itemCount: myLeaves.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, LeaveDetailsNavigationScreen.routeName,
                    arguments: [false, myLeaves[index]]);
              },
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSmall),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(myLeaves[index].leaveType,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  StatusChip(
                                      text: myLeaves[index]
                                          .leaveStatus
                                          .toString(),
                                      color: getColorFromStatus(
                                          myLeaves[index]
                                              .leaveStatus
                                              .toString()))
                                ]),
                            const SizedBox(width: spacingLarge),
                            LeaveDetails(
                                leaveData: formatDate(
                                    myLeaves[index].startDate.toString()),
                                title: StringConstants.kStartDate),
                            const SizedBox(width: spacingLarge),
                            LeaveDetails(
                                leaveData: formatDate(
                                    myLeaves[index].endDate.toString()),
                                title: StringConstants.kEndDate),
                            const SizedBox(width: spacingSmall),
                            LeaveDetails(
                                leaveData:
                                    myLeaves[index].approvers.join(", "),
                                title: StringConstants.kApprovers)
                          ]))));
        });
  }
}
