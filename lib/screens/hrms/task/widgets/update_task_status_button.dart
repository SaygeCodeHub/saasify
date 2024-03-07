import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class UpdateTaskStatusButton extends StatelessWidget {
  final TasksAssignedMe task;
  final GlobalKey<FormState> formKey;
  final String status;

  const UpdateTaskStatusButton({
    super.key,
    required this.task,
    required this.status,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        onPressed: () {
          if (status == "DONE") {
            context
                .read<TaskBloc>()
                .add(UpdateTaskStatus(task: task, status: status));
          } else {
            if (formKey.currentState!.validate()) {
              context
                  .read<TaskBloc>()
                  .add(UpdateTaskStatus(task: task, status: status));
            }
          }
        },
        backgroundColor:
            status == "DONE" ? AppColors.successGreen : AppColors.errorRed,
        buttonTitle: status == "DONE" ? "Mark as Done" : "Close Task");
  }
}
