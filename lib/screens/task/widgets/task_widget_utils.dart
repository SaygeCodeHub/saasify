import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';
import 'package:saasify/screens/task/task_screen.dart';
import 'package:saasify/screens/task/widgets/update_task_status_button.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

Widget buildPriorityStatusChip(priority) {
  return StatusChip(
      text: getPriorityFromInt(priority).toString(),
      color: getTaskColorFromPriority(priority));
}

Widget buildTaskStatusChip(status) {
  return StatusChip(text: status, color: getTaskColorFromStatus(status));
}

Widget buildEmptyTasks(BuildContext context, bool isMobile,
    {bool isAssignedToMe = true, align = Alignment.center}) {
  return Align(
    alignment: align,
    child: InkWell(
      onTap: !isAssignedToMe
          ? () {
              context.read<TaskBloc>().resetTaskDetails();
              Navigator.pushNamed(context, TaskScreen.routeName)
                  .whenComplete(() {
                context.read<TaskBloc>().add(FetchAllTasks());
              });
            }
          : null,
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
                Icon(isAssignedToMe ? Icons.assignment : Icons.add,
                    color: AppColors.darkBlue, size: 40),
                const SizedBox(height: spacingStandard),
                Text(isAssignedToMe ? "No Tasks Assigned" : "Assign New Task",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelTextStyle
                        .copyWith(color: AppColors.darkBlue))
              ])),
    ),
  );
}

List<Widget> getTaskDetailsActions(
    BuildContext context,
    GlobalKey<FormState> updateKey,
    bool isTaskAssignedToMe,
    TasksAssignedMe task) {
  switch (task.taskStatus) {
    case 'CLOSED':
      return [];
    case 'DONE':
      return [
        UpdateTaskStatusButton(task: task, status: 'CLOSED', formKey: updateKey)
      ];
    default:
      return [
        UpdateTaskStatusButton(
            task: task, status: 'CLOSED', formKey: updateKey),
        isTaskAssignedToMe
            ? UpdateTaskStatusButton(
                task: task, status: 'DONE', formKey: updateKey)
            : PrimaryButton(
                buttonWidth: kGeneralActionButtonWidth,
                backgroundColor: AppColors.darkBlue,
                buttonTitle: "Edit Task",
                onPressed: () {
                  context.read<TaskBloc>().setTaskDetails(task);
                  Navigator.pushNamed(context, TaskScreen.routeName,
                          arguments: true)
                      .whenComplete(() {
                    context.read<TaskBloc>().add(FetchAllTasks());
                    Navigator.pop(context);
                  });
                })
      ];
  }
}
