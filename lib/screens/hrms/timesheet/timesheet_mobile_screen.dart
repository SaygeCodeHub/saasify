import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';

import '../../../data/models/timesheet/timesheet_attendance_history_model.dart';

class TimesheetMobileScreen extends StatelessWidget {
  final List<TimesheetData> timesheetData;

  const TimesheetMobileScreen({super.key, required this.timesheetData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: spacingSmall);
            },
            itemCount: timesheetData.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSmall),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: spacingLarge),
                            LeaveDetails(
                                leaveData: formatDate(
                                    timesheetData[index].checkIn.toString()),
                                title: StringConstants.kStartDate),
                            const SizedBox(width: spacingLarge),
                            LeaveDetails(
                                leaveData: formatDate(
                                    timesheetData[index].checkOut.toString()),
                                title: StringConstants.kEndDate),
                            const SizedBox(width: spacingSmall),
                            LeaveDetails(
                                leaveData: timesheetData[index].date.toString(),
                                title: StringConstants.kApprovers)
                          ])));
            }));
  }
}
