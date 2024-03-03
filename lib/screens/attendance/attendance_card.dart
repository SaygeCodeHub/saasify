import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/attendance/mark_attendance_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import '../../../utils/date_time_formatters.dart';

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
        const ModuleHeading(label: 'Mark Attendance'),
        const SizedBox(height: spacingLarger),
        Card(
            elevation: 2,
            child: Container(
              width: (isMobile!)
                  ? MediaQuery.sizeOf(context).width * 0.30
                  : MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.lighterBlack),
                  borderRadius: BorderRadius.circular(kCardRadius)),
              child: Padding(
                padding: const EdgeInsets.all(spacingMedium),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("svg/male_user_option_one.svg"),
                        const SizedBox(width: spacingStandard),
                        const VerticalDivider(),
                        const SizedBox(width: spacingStandard),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.calendar_today_outlined,size :18),
                                const SizedBox(width: spacingSmall),
                                Text(formatDate(DateTime.now()),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subDetailTextStyle
                                        .copyWith(fontWeight: FontWeight.w700))
                              ],
                            ),
                            const SizedBox(height: spacingStandard),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.kCheckIn,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subDetailTextStyle
                                        .copyWith(fontWeight: FontWeight.w700)),
                                ValueListenableBuilder<String?>(
                                    builder: (context, value, child) {
                                      return Text(value ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subDetailTextStyle);
                                    },
                                    valueListenable: context
                                        .read<AttendanceBloc>()
                                        .checkInTime,
                                    child: const Text(""))
                              ],
                            ),
                            const SizedBox(height: spacingXXSmall),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.kCheckOut,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subDetailTextStyle
                                        .copyWith(fontWeight: FontWeight.w700)),
                                ValueListenableBuilder<String?>(
                                    builder: (context, value, child) {
                                      return Text(value ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subDetailTextStyle);
                                    },
                                    valueListenable: context
                                        .read<AttendanceBloc>()
                                        .checkOutTime,
                                    child: const Text(""))
                              ],
                            ),
                            const SizedBox(height: spacingXXSmall),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.kAvgHrs,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subDetailTextStyle
                                        .copyWith(fontWeight: FontWeight.w700)),
                                ValueListenableBuilder<String?>(
                                    builder: (context, value, child) {
                                      return Text(value ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subDetailTextStyle);
                                    },
                                    valueListenable: context
                                        .read<AttendanceBloc>()
                                        .checkOutTime,
                                    child: const Text(""))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const MarkAttendanceButton()
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
