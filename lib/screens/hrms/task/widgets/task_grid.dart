import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';
import 'package:saasify/screens/hrms/task/task_board_screen.dart';
import 'package:saasify/screens/hrms/task/widgets/task_details_pop_up.dart';
import 'package:saasify/screens/hrms/task/widgets/task_details_screen.dart';
import 'package:saasify/screens/hrms/task/widgets/task_widget_utils.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class TasksGrid extends StatelessWidget {
  final List<TasksAssignedMe> data;
  final bool isHome;
  final bool isTaskAssignedToMe;

  const TasksGrid(
      {super.key,
      required this.data,
      required this.isTaskAssignedToMe,
      this.isHome = false});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(bottom: spacingStandard),
          child: Row(
            children: [
              ModuleHeading(
                  label: isTaskAssignedToMe
                      ? "Tasks Assigned To Me"
                      : "Tasks Assigned By Me"),
              const Spacer(),
              isHome
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TaskBoardScreen.routeName);
                      },
                      child: Text('View all',
                          style: Theme.of(context)
                              .textTheme
                              .labelTextStyle
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.orange)))
                  : const SizedBox.shrink()
            ],
          )),
      // : const SizedBox.shrink(),
      data.isEmpty
          ? buildEmptyTasks(context, isMobile,
              isAssignedToMe: isTaskAssignedToMe)
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
                          : 1.7),
              itemCount: isHome
                  ? min(
                      isMobile
                          ? 2
                          : isTab
                              ? 4
                              : 5,
                      data.length)
                  : data.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      isMobile
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskDetailsScreen(
                                      task: data[index],
                                      isTaskAssignedToMe: isTaskAssignedToMe)))
                          : showDialog(
                              context: context,
                              builder: (context) => TaskDetailsPopup(
                                  task: data[index],
                                  isTaskAssignedToMe: isTaskAssignedToMe));
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
                                            data[index].taskStatus)
                                      ])
                                ]))));
              })
    ]);
  }
}