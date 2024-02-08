import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/bloc/leaves/leave_events.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class ApplyLeaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ApplyLeaveButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonTitle: StringConstants.kApply,
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            context.read<LeavesBloc>().add(ApplyLeave(
                leaveDetailsMap: context.read<LeavesBloc>().leaveDetailsMap));
          }
        },
        buttonWidth: MediaQuery.sizeOf(context).width * 0.15);
  }
}
