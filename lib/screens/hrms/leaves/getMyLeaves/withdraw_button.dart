import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class WithdrawButton extends StatelessWidget {
  const WithdrawButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: 100,
        backgroundColor: AppColors.errorRed,
        buttonTitle: StringConstants.kWithdraw,
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
