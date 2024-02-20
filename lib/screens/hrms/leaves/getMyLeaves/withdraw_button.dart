import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

import '../../../../bloc/leaves/leave_events.dart';

class WithdrawButton extends StatelessWidget {
  final int leaveId;

  const WithdrawButton({super.key, required this.leaveId});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        backgroundColor: AppColors.errorRed,
        buttonTitle: StringConstants.kWithdraw,
        onPressed: () {
          Navigator.pop(context);
          context.read<LeavesBloc>().add(WithdrawLeave(leaveId: leaveId));
        });
  }
}
