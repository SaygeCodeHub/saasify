import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

Widget buildPriorityStatusChip(priority) {
  return StatusChip(
      text: getPriorityFromInt(priority).toString(),
      color: getTaskColorFromPriority(priority));
}

Widget buildEmptyTasks(context, bool isMobile, {message = 'No tasks found'}) {
  return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Expanded(
        child: Container(
            padding: const EdgeInsets.all(spacingLarger),
            decoration: BoxDecoration(
                color: AppColors.lightestYellow,
                border: Border.all(color: AppColors.lighterBlack),
                borderRadius: BorderRadius.circular(kCardRadius)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.assignment,
                      color: AppColors.darkBlue, size: 40),
                  const SizedBox(height: spacingStandard),
                  Text(message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelTextStyle
                          .copyWith(color: AppColors.darkBlue))
                ]))),
    Spacer(flex: isMobile ? 1 : 4)
  ]);
}
