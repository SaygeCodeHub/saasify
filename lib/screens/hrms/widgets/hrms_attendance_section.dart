import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/attendance_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsAttendanceSection extends StatelessWidget {
  final bool? isMobile;
  final String? gender;

  const HrmsAttendanceSection({super.key, this.isMobile = false, this.gender});

  @override
  Widget build(BuildContext context) {
    context.read<AttendanceBloc>().add(FetchAttendance());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ModuleHeading(label: 'Mark Attendance'),
        const SizedBox(height: spacingLarger),
        Container(
          width: (isMobile!)
              ? MediaQuery.sizeOf(context).width * 0.25
              : MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lighterBlack),
              borderRadius: BorderRadius.circular(kCardRadius)),
          child: Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: context.read<AttendanceBloc>().checkedIn,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Image.asset(
                      setImage(gender, context),
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      width: MediaQuery.sizeOf(context).height * 0.20,
                    );
                  }),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(spacingLarger),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(StringConstants.kCheckIn,
                                    style: Theme.of(context)
                                        .textTheme
                                        .cardMobileValueTextStyle),
                                ValueListenableBuilder<String?>(
                                    builder: (context, value, child) {
                                      return Text(value ?? "--:--");
                                    },
                                    valueListenable: context
                                        .read<AttendanceBloc>()
                                        .checkInTime,
                                    child: const Text("--:--"))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(StringConstants.kCheckOut,
                                    style: Theme.of(context)
                                        .textTheme
                                        .cardMobileValueTextStyle),
                                ValueListenableBuilder<String?>(
                                    builder: (context, value, child) {
                                      return Text(value ?? "--:--");
                                    },
                                    valueListenable: context
                                        .read<AttendanceBloc>()
                                        .checkOutTime,
                                    child: const Text("--:--"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AttendanceButton(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

String setImage(String? gender, BuildContext context) {
  if (context.read<AttendanceBloc>().isCheckedIn()) {
    if (gender == "Male") {
      return 'assets/male_working.gif';
    } else if (gender == "Female") {
      return 'assets/female_working.gif';
    } else {
      return [
        'assets/male_working.gif',
        'assets/female_working.gif'
      ][Random().nextInt(1)];
    }
  } else {
    if (gender == "Male") {
      return 'assets/human.gif';
    } else if (gender == "Female") {
      return 'assets/female_rest.gif';
    } else {
      return [
        'assets/male_rest.jpg',
        'assets/female_rest.jpg'
      ][Random().nextInt(1)];
    }
  }
}
