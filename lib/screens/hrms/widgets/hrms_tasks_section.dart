import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';
import 'package:saasify/widgets/text/module_heading.dart';

import '../../../utils/globals.dart';

class HrmsTasksSection extends StatelessWidget {
  final bool isMobile;

  const HrmsTasksSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final int tasksAssignedCount = context
        .read<InitialiseAppBloc>()
        .initialiseAppModel!
        .data!
        .tasksAssignedToMe!
        .length;
    final bool showViewAllButton =
        !isMobile ? tasksAssignedCount > 5 : tasksAssignedCount > 2;
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ModuleHeading(label: 'Task Boards'),
            showViewAllButton
                ? buildViewAllButton(context)
                : const SizedBox.shrink()
          ]),
      const SizedBox(height: spacingLarger),
      context
              .read<InitialiseAppBloc>()
              .initialiseAppModel!
              .data!
              .tasksAssignedToMe!
              .isEmpty
          ? buildEmptyTasks(context)
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile
                      ? 2
                      : isTab
                          ? 4
                          : 5,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: isMobile
                      ? 1.4
                      : isTab
                          ? 1.685
                          : 2),
              itemCount: min(
                  context
                      .read<InitialiseAppBloc>()
                      .initialiseAppModel!
                      .data!
                      .tasksAssignedToMe!
                      .length,
                  isMobile ? 2 : 5),
              itemBuilder: (context, index) {
                var data = context
                    .read<InitialiseAppBloc>()
                    .initialiseAppModel!
                    .data!
                    .tasksAssignedToMe!;
                return InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightestYellow,
                            border: Border.all(color: AppColors.lighterBlack),
                            borderRadius: BorderRadius.circular(kCardRadius)),
                        child: Padding(
                            padding: EdgeInsets.all(
                                isMobile ? spacingSmall : spacingMedium),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].title,
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelTextStyle
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.darkBlue)),
                                  const SizedBox(height: spacingMedium),
                                  Expanded(
                                      child: Text(data[index].taskDescription,
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis)),
                                  const SizedBox(height: spacingSmall),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildDate(
                                            data[index].dueDate.toString(),
                                            context,
                                            showDateIcon: true,
                                            orangeColor: false),
                                        buildStatusChip(
                                            data[index].priority.toString())
                                      ])
                                ]))));
              })
    ]);
  }

  Widget buildViewAllButton(context) {
    return TextButton(
        onPressed: () {},
        child: Text('View all',
            style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                fontWeight: FontWeight.w800, color: AppColors.orange)));
  }

  Widget buildStatusChip(priority) {
    return StatusChip(
        text: getPriorityFromInt(priority).toString(),
        color: getColorFromStatus(priority.toString()));
  }

  Widget buildEmptyTasks(context) {
    return Container(
        padding: const EdgeInsets.all(spacingLarger),
        decoration: BoxDecoration(
            color: AppColors.lightestYellow,
            border: Border.all(color: AppColors.lighterBlack),
            borderRadius: BorderRadius.circular(kCardRadius)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.assignment, color: AppColors.darkBlue, size: 40),
              const SizedBox(height: spacingStandard),
              Text('No tasks assigned to you',
                  style: Theme.of(context)
                      .textTheme
                      .labelTextStyle
                      .copyWith(color: AppColors.darkBlue))
            ]));
  }
}
