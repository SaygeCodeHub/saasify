import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_details_navigation_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';

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
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, LeaveDetailsNavigationScreen.routeName,
                      arguments: [true, pendingLeaves[index]]);
                },
                child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(spacingSmall),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(pendingLeaves[index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: spacingLarge),
                              Text(pendingLeaves[index].leaveType,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,color: Colors.black87 )),
                              const SizedBox(width: spacingLarge),
                              LeaveDetails(
                                  leaveData: formatDate(pendingLeaves[index]
                                      .startDate
                                      .toString()),
                                  title: StringConstants.kStartDate),
                              const SizedBox(width: spacingLarge),
                              LeaveDetails(
                                  leaveData: formatDate(
                                      pendingLeaves[index].endDate.toString()),
                                  title: StringConstants.kEndDate)
                            ]))),
              );
            }));
  }
}
