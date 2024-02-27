import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class WarningAlertDialogue extends StatelessWidget {
  final String description;
  final Function? onPressed;

  const WarningAlertDialogue(
      {super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: AppColors.warningYellow)),
            SizedBox.square(
                dimension: kSassifyLogoSize,
                child: Image.asset('assets/exclamation-circle.png')),
          ],
        ),
        title: Text('Warning!',
            style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
        content: Text(description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.dialogueContentTextStyle),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(
            bottom: spacingSmall, left: spacingSmall, right: spacingSmall),
        actions: [
          PrimaryButton(
              buttonWidth: kGeneralActionButtonWidth,
              backgroundColor: AppColors.warningYellow,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              buttonTitle: StringConstants.kOk)
        ]);
  }
}
