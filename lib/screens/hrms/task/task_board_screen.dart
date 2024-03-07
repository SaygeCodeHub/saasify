import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/task/widgets/task_grid.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/tab_bar/custom_tab_bar.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class TaskBoardScreen extends StatelessWidget {
  static const routeName = 'TaskBoardScreen';

  const TaskBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(FetchAllTasks());
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
                      child: BlocBuilder<TaskBloc, TaskStates>(
                    buildWhen: (previous, current) =>
                        current is FetchingAllTasks ||
                        current is AllTasksFetched,
                    builder: (context, state) {
                      if (state is FetchingAllTasks) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AllTasksFetched) {
                        return CustomTabBar(tabData: [
                          TabData(
                              label: "Tasks Assigned To Me",
                              icon: isMobile
                                  ? Icons.assignment_ind_outlined
                                  : null,
                              content: TasksGrid(
                                  isTaskAssignedToMe: true,
                                  data: state.tasks.tasksAssignedToMe)),
                          TabData(
                              label: "Tasks Assigned By Me",
                              icon: isMobile
                                  ? Icons.assignment_turned_in_outlined
                                  : null,
                              content: TasksGrid(
                                  isTaskAssignedToMe: false,
                                  data: state.tasks.tasksAssignedByMe))
                        ]);
                      }
                      return const SizedBox.shrink();
                    },
                  ))
                ]));
  }
}
