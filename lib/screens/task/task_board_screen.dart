import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/task/widgets/task_grid.dart';
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
