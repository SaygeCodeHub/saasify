import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/button_utils.dart';

class SuccessAlertDialog extends StatelessWidget {
  final String description;
  final void Function()? onPressed;

  const SuccessAlertDialog(
      {super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close,
                    size: kAlertDialogCloseIconSize, color: AppColors.black)),
          ],
        ),
        title: Column(
          children: [
            const Icon(Icons.check_circle_outline,
                size: kAlertDialogIconSize, color: AppColors.successGreen),
            const SizedBox(height: spacingMedium),
            Text('Success!',
                style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
          ],
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: kDialogueTextBoxWidth,
              minWidth: kDialogueTextBoxWidth - 50),
          child: Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.dialogueContentTextStyle),
        ),
        iconPadding:
            const EdgeInsets.only(right: spacingXSmall, top: spacingXSmall),
        titlePadding: const EdgeInsets.only(top: spacingSmall),
        contentPadding: const EdgeInsets.symmetric(
            vertical: spacingSmall, horizontal: spacingLarge),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(
            top: spacingStandard,
            left: spacingLarge,
            right: spacingLarge,
            bottom: spacingLarge),
        actions: List.generate(
            1,
            (index) => ButtonUtils.getButtonFromType(context,
                    buttonType: 'primary', onPressed: () {
                  if (onPressed != null) {
                    onPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                }, buttonTitle: 'Continue', width: 50)));
  }
}
