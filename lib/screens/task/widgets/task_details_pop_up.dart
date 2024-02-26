import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';
import 'package:saasify/screens/task/widgets/task_widget_utils.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/actions/detailsPopUp.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
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
            context.read<TaskBloc>().add(FetchAllTasks());
            showDialog(
                context: context,
                builder: (context) => SuccessAlertDialog(
                    description: state.message,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }));
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
              context.read<TaskBloc>().taskDetails["comment"] = comments;
            },
            initialComments: task.comment,
            actionsBuilder: (updateKey) => getTaskDetailsActions(
                context, updateKey, isTaskAssignedToMe, task),
            details: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                DetailsField(title: "Title", data: task.title),
                StatusChip(
                    text: task.taskStatus,
                    color: getTaskColorFromStatus(task.taskStatus))
              ]),
              const SizedBox(height: spacingSmall),
              isTaskAssignedToMe
                  ? DetailsField(
                      title: "Assigned By", data: task.assignedBy?.name ?? "")
                  : DetailsField(
                      title: "Assigned To", data: task.assignedTo?.name ?? ""),
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
            commentsEditable: task.taskStatus == 'CLOSED' ? false : true,
            commentsRequired: true));
  }
}
