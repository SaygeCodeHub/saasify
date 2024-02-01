import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leave_state.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class ApplyLeaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ApplyLeaveButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeavesBloc, LeaveStates>(listener: (context, state) {
      if (state is LeaveApplied) {
        Navigator.pushReplacementNamed(context, HRMSDashboardScreen.routeName);
      }
      if (state is ApplyLeaveFailed) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ErrorAlertDialog(
                  description: state.errorMessage.toString());
            });
      }
    }, builder: (context, state) {
      if (state is ApplyingLeave) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return PrimaryButton(
            buttonTitle: StringConstants.kApply,
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<LeavesBloc>().add(
                    ApplyLeave(leaveDetailsMap: ApplyLeaveScreen.leavesMap));
                Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
              }
            },
            buttonWidth: MediaQuery.sizeOf(context).width * 0.15);
      }
    });
  }
}
