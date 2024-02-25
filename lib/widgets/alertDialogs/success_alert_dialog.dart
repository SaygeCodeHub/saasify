import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class SuccessAlertDialog extends StatelessWidget {
  final String description;
  final Function? onPressed;

  const SuccessAlertDialog(
      {super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: SizedBox.square(
            dimension: kSassifyLogoSize,
            child: Image.asset('assets/check-circle.png')),
        title: Text('Success!',
            style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
        content: SizedBox(
          width: kDialogueTextBoxWidth,
          child: Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.dialogueContentTextStyle),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: spacingStandard),
        actions: [
          PrimaryButton(
              buttonWidth: kGeneralActionButtonWidth,
              backgroundColor: AppColors.successGreen,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              buttonTitle: 'Continue')
        ]);
  }
}
