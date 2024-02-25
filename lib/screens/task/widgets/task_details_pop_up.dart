import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_events.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/screens/task/task_screen.dart';
import 'package:saasify/screens/task/widgets/task_widget_utils.dart';
import 'package:saasify/screens/task/widgets/update_task_status_button.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/actions/detailsPopUp.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class TaskDetailsPopup extends StatelessWidget {
  const TaskDetailsPopup({
    super.key,
    required this.task,
    this.isTaskAssignedToMe = true,
  });

  final TasksAssignedMe task;
  final bool isTaskAssignedToMe;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskStates>(
        listener: (context, state) {
          if (state is UpdatingTaskStatus) {
            ProgressBar.show(context);
          } else if (state is TaskStatusUpdated) {
            ProgressBar.dismiss(context);
            context.read<InitialiseAppBloc>().add(InitialiseApp());
            showDialog(
                context: context,
                builder: (context) =>
                    SuccessAlertDialog(description: state.message));
          } else if (state is ErrorUpdatingTaskStatus) {
            ProgressBar.dismiss(context);
            showDialog(
                context: context,
                builder: (context) =>
                    ErrorAlertDialog(description: state.error));
          }
        },
        child: DetailsPopUp(
            title: "Task Details",
            onCommentsChanged: (comments) {
              context.read<TaskBloc>().taskDetails["comments"] = comments;
            },
            actionsBuilder: (updateKey) => [
                  UpdateTaskStatusButton(
                      task: task, status: 'CLOSED', formKey: updateKey),
                  isTaskAssignedToMe
                      ? UpdateTaskStatusButton(
                          task: task, status: 'DONE', formKey: updateKey)
                      : PrimaryButton(
                          buttonWidth: kGeneralActionButtonWidth,
                          onPressed: () {
                            context.read<TaskBloc>().setTaskDetails(task);
                            if (updateKey.currentState!.validate()) {
                              Navigator.pushNamed(context, TaskScreen.routeName,
                                  arguments: true);
                            }
                          },
                          backgroundColor: AppColors.darkBlue,
                          buttonTitle: "Edit Task")
                ],
            details: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                DetailsField(title: "Title", data: task.title),
                StatusChip(
                    text: task.taskStatus,
                    color: getTaskColorFromStatus(task.taskStatus))
              ]),
              const SizedBox(height: spacingSmall),
              DetailsField(
                  title: "Assigned By", data: task.assignedBy?.name ?? ""),
              const SizedBox(height: spacingSmall),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                DetailsField(
                    title: "Due Date",
                    data: DateFormat('dd/MM/yyyy').format(task.dueDate)),
                buildPriorityStatusChip(task.priority.toString()),
              ]),
              const SizedBox(height: spacingSmall),
              DetailsField(
                  data: task.taskDescription, title: "Task Description")
            ],
            commentsEditable: true,
            commentsRequired: true));
  }
}
