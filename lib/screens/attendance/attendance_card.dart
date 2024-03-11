import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/attendance/mark_attendance_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import '../../widgets/todays_date.dart';

class AttendanceCard extends StatelessWidget {
  final bool? isMobile;
  final String? gender;

  const AttendanceCard({super.key, this.isMobile = false, this.gender});

  @override
  Widget build(BuildContext context) {
    context.read<AttendanceBloc>().add(FetchAttendance());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: spacingStandard),
        const ModuleHeading(label: 'Mark Attendance'),
        const SizedBox(height: spacingMedium), // Adjust as needed
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: SizedBox(
              height: 180,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("svg/male_user_option_one.svg"),
                      const SizedBox(width: spacingStandard),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TodaysDate(),
                          const SizedBox(height: spacingStandard),
                          _buildTextRow(context, StringConstants.kCheckIn,
                              context.read<AttendanceBloc>().checkInTime),
                          const SizedBox(height: spacingXXSmall),
                          _buildTextRow(context, StringConstants.kCheckOut,
                              context.read<AttendanceBloc>().checkOutTime),
                          const SizedBox(height: spacingXXSmall),
                          _buildTextRow(context, StringConstants.kAvgHrs,
                              context.read<AttendanceBloc>().checkOutTime),
                        ],
                      ),
                    ],
                  ),
                  const MarkAttendanceButton(),
                  const SizedBox(width: spacingXXLarge),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTextRow(BuildContext context, String label,
    ValueListenable<String?> valueListenable) {
  return Row(
    children: [
      Text(label,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .subDetailTextStyle
              .copyWith(fontWeight: FontWeight.w700)),
      ValueListenableBuilder<String?>(
        builder: (context, value, child) {
          return Text(value ?? "",
              style: Theme.of(context).textTheme.subDetailTextStyle);
        },
        valueListenable: valueListenable,
        child: const Text(""),
      ),
    ],
  );
}
