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

  const HrmsAttendanceSection({super.key, this.isMobile = false});

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
          height: MediaQuery.sizeOf(context).height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lighterBlack),
              borderRadius: BorderRadius.circular(kCardRadius)),
          child: Row(
            children: [
              Image.asset('assets/human.gif'),
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
                                        .checkOutTime,
                                    child: const Text("--:--"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AttendanceButton()
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
