import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/warning_alert_dialogue.dart';

class DeleteEmployeeButton extends StatelessWidget {
  const DeleteEmployeeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeStates>(
        listener: (context, state) {
          if (state is DeletingEmployee) {
            ProgressBar.show(context);
          }
          if (state is EmployeeDeleted) {
            ProgressBar.dismiss(context);
            showDialog(
                context: context,
                builder: (context) => SuccessAlertDialog(
                    description: "Employee Deleted Successfully",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }));
          }
          if (state is DeletingEmployeeFailed) {
            ProgressBar.dismiss(context);
            showDialog(
                context: context,
                builder: (context) =>
                    ErrorAlertDialog(description: state.errorMessage));
          }
        },
        child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return WarningAlertDialogue(
                        description:
                            "Are you sure you want to delete this employee?",
                        onPressed: () {
                          context.read<EmployeeBloc>().add(DeleteEmployee());
                          Navigator.pop(context);
                        });
                  });
            },
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.delete_outline,
                color: AppColors.darkBlue, size: 25)));
  }
}
