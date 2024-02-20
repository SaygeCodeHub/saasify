import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_events.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class RejectLeaveButton extends StatelessWidget {
  final GlobalKey<FormState> updateKey;
  final MyLeaves pendingLeaves;
  final Function? onPressed;

  const RejectLeaveButton(
      {super.key,
      this.onPressed,
      required this.updateKey,
      required this.pendingLeaves});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        backgroundColor: AppColors.errorRed,
        buttonTitle: StringConstants.kReject,
        onPressed: () {
          if (updateKey.currentState?.validate() ?? false) {
            context.read<LeavesBloc>().leaveStatusMap["is_leave_approved"] =
                false;
            context.read<LeavesBloc>().leaveStatusMap["leave_id"] =
                pendingLeaves.leaveId;
            context.read<LeavesBloc>().add(UpdateLeaveStatus());
            Navigator.pop(context);
          }
        });
  }
}
