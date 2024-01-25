import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class AttendanceCard extends StatelessWidget {
  final String? checkInTime;
  final String? checkOutTime;

  const AttendanceCard({
    super.key,
    required this.checkInTime,
    required this.checkOutTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: spacingStandard, horizontal: spacingMedium),
          child: IntrinsicHeight(
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
                      SizedBox(height: spacingXSmall),
                      Text("Hello! Aditya",
                          style: Theme.of(context)
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .cardMobileHeadingTextStyle),
                              Text(checkInTime ?? "--:--")
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Check Out",
                                  style: Theme.of(context)
                                      .textTheme
                                      .cardMobileHeadingTextStyle),
                              Text(checkOutTime ?? "--:--"),
                            ],
                          ),
                          Spacer()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
