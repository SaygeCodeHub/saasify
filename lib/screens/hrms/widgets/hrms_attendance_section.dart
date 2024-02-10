import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/attendance_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsAttendanceSection extends StatelessWidget {
  const HrmsAttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ModuleHeading(label: 'Mark Attendance'),
        const SizedBox(height: spacingSmall),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: spacingStandard, horizontal: spacingMedium),
          height: MediaQuery.sizeOf(context).height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lighterBlack),
              borderRadius: BorderRadius.circular(kCardRadius)),
          child: Row(children: [
            const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.darkBlue,
                child: Icon(Icons.person, color: AppColors.white, size: 25)),
            const SizedBox(width: spacingMedium),
            Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text(StringConstants.kCheckIn,
                    style:
                        Theme.of(context).textTheme.cardMobileHeadingTextStyle),
                ValueListenableBuilder<String?>(
                    builder: (context, value, child) {
                      return Text(value ?? "--:--");
                    },
                    valueListenable: context.read<AttendanceBloc>().checkInTime,
                    child: const Text("--:--"))
              ]),
              const Spacer(),
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text(StringConstants.kCheckOut,
                    style:
                        Theme.of(context).textTheme.cardMobileHeadingTextStyle),
                ValueListenableBuilder<String?>(
                    builder: (context, value, child) {
                      return Text(value ?? "--:--");
                    },
                    valueListenable:
                        context.read<AttendanceBloc>().checkOutTime,
                    child: const Text("--:--"))
              ]),
              const Spacer()
            ])),
            const AttendanceButton()
          ]),
        ),
      ],
    );
  }
}
