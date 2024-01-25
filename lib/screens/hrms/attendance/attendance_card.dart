import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/bloc/attendance/attendance_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/attendance/attendance_button.dart';

class AttendanceCard extends StatelessWidget {

  const AttendanceCard({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    context.read<AttendanceBloc>().add(FetchAttendance());
    return BlocBuilder<AttendanceBloc, AttendanceStates>(
      builder: (context, state) {
        return Card(
          child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: spacingStandard, horizontal: spacingMedium),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.orange,
                      child:
                      Icon(Icons.person, color: AppColors.white, size: 18)),
                  const SizedBox(width: spacingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: spacingXSmall),
                        Text("Hello! Aditya",
                            style: Theme
                                .of(context)
                                .textTheme
                                .cardMobileHeadingLarge
                                .copyWith(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: spacingXSmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Check In",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .cardMobileHeadingTextStyle),
                                Text(context.read<AttendanceBloc>().checkInTime ?? "--:--")
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Check Out",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .cardMobileHeadingTextStyle),
                                Text(context.read<AttendanceBloc>().checkOutTime ?? "--:--"),
                              ],
                            ),
                            Spacer()
                          ],
                        ),
                      ],
                    ),
                  ),
                  AttendanceButton(checkInTime: context.read<AttendanceBloc>().checkInTime,checkOutTime: context.read<AttendanceBloc>().checkOutTime)
                ],
              )),
        );
      },
    );
  }
}
