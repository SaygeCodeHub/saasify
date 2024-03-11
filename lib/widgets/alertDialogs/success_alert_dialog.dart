import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class SuccessAlertDialog extends StatelessWidget {
  final String description;
  final Function? onPressed;

  const SuccessAlertDialog(
      {super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close,
                        size: 15, color: AppColors.black))),
            const Icon(Icons.check_circle_outline,
                size: 25, color: AppColors.black)
          ],
        ),
        title: Text('Success!',
            style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: kDialogueTextBoxWidth,
              minWidth: kDialogueTextBoxWidth - 50),
          child: Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.dialogueContentTextStyle),
        ),
        iconPadding: const EdgeInsets.only(
            bottom: spacingStandard,
            left: spacingLarge,
            right: spacingLarge,
            top: spacingLarge),
        titlePadding: const EdgeInsets.only(top: spacingSmall),
        contentPadding: const EdgeInsets.symmetric(
            vertical: spacingSmall, horizontal: spacingLarge),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(
            top: spacingStandard,
            left: spacingLarge,
            right: spacingLarge,
            bottom: spacingLarge),
        actions: [
          TextButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: spacingStandard, vertical: spacingSmall)),
              child: Text('Continue',
                  style: Theme.of(context).textTheme.dialogueButtonTextStyle))
        ]);
  }
}
