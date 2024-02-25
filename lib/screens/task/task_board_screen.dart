import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/screens/hrms/widgets/build_date.dart';
import 'package:saasify/screens/hrms/widgets/hrms_tasks_section.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/tab_bar/custom_tab_bar.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class TaskBoardScreen extends StatelessWidget {
  static const routeName = 'TaskBoardScreen';

  const TaskBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacingMedium),
                            child: Row(children: [
                              isMobile
                                  ? const SizedBox.shrink()
                                  : const BackButton(),
                              const SizedBox(width: spacingXMedium),
                              const ModuleHeading(label: "Tasks Board"),
                            ]))
                      ]),
                  Expanded(
                      child: CustomTabBar(tabData: [
                    TabData(
                        label: "Tasks Assigned To Me",
                        icon: isMobile ? Icons.assignment_ind_outlined : null,
                        content: TasksGrid(
                            label: "Tasks Assigned To Me",
                            data: context
                                .read<InitialiseAppBloc>()
                                .initialiseAppModel!
                                .data!
                                .tasksAssignedToMe!)),
                    TabData(
                        label: "Tasks Assigned By Me",
                        icon: isMobile
                            ? Icons.assignment_turned_in_outlined
                            : null,
                        content: TasksGrid(
                            label: "Tasks Assigned By Me",
                            data: context
                                .read<InitialiseAppBloc>()
                                .initialiseAppModel!
                                .data!
                                .tasksAssignedByMe!))
                  ]))
                ]));
  }
}

class TasksGrid extends StatelessWidget {
  final List<TasksAssignedMe> data;
  final String label;

  const TasksGrid({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      isMobile
          ? Padding(
              padding: const EdgeInsets.only(bottom: spacingStandard),
              child: ModuleHeading(label: label))
          : const SizedBox.shrink(),
      Expanded(
          child: data.isEmpty
              ? buildEmptyTasks(context, isMobile)
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
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightestYellow,
                                border:
                                    Border.all(color: AppColors.lighterBlack),
                                borderRadius:
                                    BorderRadius.circular(kCardRadius)),
                            child: Padding(
                                padding: EdgeInsets.all(
                                    isMobile ? spacingSmall : spacingMedium),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          child: Text(
                                              data[index].taskDescription,
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis)),
                                      SizedBox(
                                          height: isMobile ? 2 : spacingSmall),
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
                                            const SizedBox(
                                                height: spacingSmall),
                                            buildStatusChip(
                                                data[index].priority.toString())
                                          ])
                                    ]))));
                  }))
    ]);
  }
}
