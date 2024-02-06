import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leave_event.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class ApproveLeaveButton extends StatelessWidget {
  final GlobalKey<FormState> updateKey;
  final MyLeaves pendingLeaves;
  final Function? onPressed;

  const ApproveLeaveButton(
      {super.key,
      this.onPressed,
      required this.updateKey,
      required this.pendingLeaves});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: 100,
        backgroundColor: AppColors.successGreen,
        buttonTitle: StringConstants.kApprove,
        onPressed: () {
          if (updateKey.currentState?.validate() ?? false) {
            context.read<LeavesBloc>().leaveStatusMap["is_leave_approved"] =
                true;
            context.read<LeavesBloc>().leaveStatusMap["leave_id"] =
                pendingLeaves.leaveId;
            context.read<LeavesBloc>().add(UpdateLeaveStatus());
            Navigator.pop(context);
          }
        });
  }
}
