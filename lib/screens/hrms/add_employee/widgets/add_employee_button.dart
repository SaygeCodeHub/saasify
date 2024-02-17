import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class AddEmployeeButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const AddEmployeeButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeStates>(
      listener: (context, state) {
        if (state is EmployeeUpdated) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SuccessAlertDialog(
                    description: state.message.toString(),
                    onPressed: () {
                      context.read<EmployeeBloc>().add(GetAllEmployees());
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
              });
        } else if (state is UpdatingEmployeeFailed) {
          context.read<EmployeeBloc>().add(GetAllEmployees());
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ErrorAlertDialog(
                  description: state.errorMessage.toString());
            },
          );
        }
      },
      builder: (context, state) {
        if (state is UpdatingEmployee) {
          return const SizedBox(
              width: kGeneralActionButtonWidth,
              child: Center(child: CircularProgressIndicator()));
        }
        return PrimaryButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<EmployeeBloc>().add(UpdateEmployee());
              }
            },
            buttonWidth: kGeneralActionButtonWidth,
            buttonTitle: "Save");
      },
    );
  }
}
