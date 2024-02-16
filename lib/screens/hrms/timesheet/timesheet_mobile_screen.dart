import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/leave_details.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

import '../../../data/models/timesheet/timesheet_attendance_history_model.dart';

class TimesheetMobileScreen extends StatelessWidget {
  final List<TimesheetData> timesheetData;

  const TimesheetMobileScreen({super.key, required this.timesheetData});

  @override
  Widget build(BuildContext context) {
    if (timesheetData.isEmpty) {
      return const Center(
        child: Text("No Attendance Marked Yet!"),
      );
    }
    return ListView.separated(
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LeaveDetails(
                                  leaveData: timesheetData[index].date == null
                                      ? "--"
                                      : formatDate(
                                          timesheetData[index].date.toString()),
                                  title: StringConstants.kDate),
                              LeaveDetails(
                                  leaveData:
                                      timesheetData[index].checkIn == null
                                          ? "--"
                                          : DateFormat('HH:mm').format(
                                              timesheetData[index]
                                                  .checkIn
                                                  .toLocal()),
                                  title: StringConstants.kCheckIn)
                            ]),
                        const SizedBox(height: spacingMedium),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryButton(
                                  buttonWidth: 20,
                                  buttonHeight: 35,
                                  onPressed: () {},
                                  buttonTitle: StringConstants.kRegularise),
                              const SizedBox(width: spacingSmall),
                              LeaveDetails(
                                  leaveData:
                                      timesheetData[index].checkOut == null
                                          ? "--"
                                          : DateFormat('HH:mm').format(
                                              timesheetData[index]
                                                  .checkOut
                                                  .toLocal()),
                                  title: StringConstants.kCheckOut)
                            ])
                      ])));
        });
  }
}
