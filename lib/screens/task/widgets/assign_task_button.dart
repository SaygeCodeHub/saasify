import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class AssignTaskButton extends StatelessWidget {
  final double buttonWidth;
  final bool isEdit;
  final GlobalKey<FormState> formKey;

  const AssignTaskButton(
      {super.key,
      required this.formKey,
      this.buttonWidth = kGeneralActionButtonWidth,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: BlocConsumer<TaskBloc, TaskStates>(
          listener: (context, state) {
            if (state is TaskAssigned) {
              showDialog(
                  context: context,
                  builder: (context) => SuccessAlertDialog(
                        description: "Task assigned successfully!",
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ));
            } else if (state is ErrorAssigningTask) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorAlertDialog(description: state.error));
            }
          },
          builder: (context, state) {
            if (state is AssigningTask) {
              return const SizedBox(
                  width: kGeneralActionButtonWidth,
                  child: Center(child: CircularProgressIndicator()));
            }
            return PrimaryButton(
              buttonWidth: buttonWidth,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<TaskBloc>().add(AssignTask(isEdit: isEdit));
                }
              },
              buttonTitle: 'Assign',
            );
          },
        ),
      ),
    );
  }
}
