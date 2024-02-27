import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/screens/task/widgets/task_details_screen.dart';
import 'package:saasify/screens/task/widgets/task_widget_utils.dart';
import 'package:saasify/screens/task/task_board_screen.dart';
import 'package:saasify/screens/task/widgets/task_details_pop_up.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HrmsTasksSection extends StatelessWidget {
  final bool isMobile;

  const HrmsTasksSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ModuleHeading(label: 'Task Boards'),
            buildViewAllButton(context)
          ]),
      const SizedBox(height: spacingLarger),
      context
              .read<InitialiseAppBloc>()
              .initialiseAppModel!
              .data!
              .tasksAssignedToMe!
              .isEmpty
          ? buildEmptyTasks(context, isMobile, align: Alignment.centerLeft)
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
                      ? 1.15
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
                    onTap: () {
                      isMobile
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TaskDetailsScreen(task: data[index])))
                          : showDialog(
                              context: context,
                              builder: (context) =>
                                  TaskDetailsPopup(task: data[index]));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: data[index].taskStatus == "CLOSED"
                                ? AppColors.errorRed.withOpacity(0.1)
                                : AppColors.lightestYellow,
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
                                  SizedBox(height: isMobile ? 2 : spacingSmall),
                                  Flex(
                                      direction: isMobile
                                          ? Axis.vertical
                                          : Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildDate(
                                            data[index].dueDate.toString(),
                                            context,
                                            showDateIcon: true,
                                            orangeColor: false),
                                        const SizedBox(height: spacingSmall),
                                        buildTaskStatusChip(
                                            data[index].taskStatus),
                                      ])
                                ]))));
              })
    ]);
  }

  Widget buildViewAllButton(context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, TaskBoardScreen.routeName);
        },
        child: Text('View all',
            style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                fontWeight: FontWeight.w800, color: AppColors.orange)));
  }
}
