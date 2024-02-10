import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/attendance/attendance_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/attendance/attendance_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';

import '../../../caches/cache.dart';
import '../../../di/app_module.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: spacingStandard, horizontal: spacingMedium),
            child: Row(children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.orange,
                  child: Icon(Icons.person, color: AppColors.white, size: 18)),
              const SizedBox(width: spacingMedium),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: spacingXSmall),
                    FutureBuilder(
                        future: getIt<Cache>().getUserNamed(),
                        builder: (context, snapshot) {
                          return Text(snapshot.data.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .userNameTextStyle);
                        }),
                    const SizedBox(height: spacingXSmall),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(StringConstants.kCheckIn,
                            style: Theme.of(context)
                                .textTheme
                                .cardMobileHeadingTextStyle),
                        ValueListenableBuilder<String?>(
                            builder: (context, value, child) {
                              return Text(value ?? "--:--");
                            },
                            valueListenable:
                                context.read<AttendanceBloc>().checkInTime,
                            child: const Text("--:--"))
                      ]),
                      const Spacer(),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(StringConstants.kCheckOut,
                            style: Theme.of(context)
                                .textTheme
                                .cardMobileHeadingTextStyle),
                        ValueListenableBuilder<String?>(
                            builder: (context, value, child) {
                              return Text(value ?? "--:--");
                            },
                            valueListenable:
                                context.read<AttendanceBloc>().checkOutTime,
                            child: const Text("--:--"))
                      ]),
                      const Spacer()
                    ])
                  ])),
              const AttendanceButton()
            ])));
  }
}
