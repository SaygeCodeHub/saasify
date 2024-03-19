import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/button_utils.dart';

class WarningAlertDialogue extends StatelessWidget {
  final String description;
  final Function? onPressed;
  final bool showCloseButton;

  const WarningAlertDialogue(
      {super.key,
      required this.description,
      this.onPressed,
      this.showCloseButton = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Warning!',
            style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: kDialogueTextBoxWidth,
              minWidth: kDialogueTextBoxWidth - 50),
          child: Text(description,
              style: Theme.of(context).textTheme.dialogueContentTextStyle),
        ),
        iconPadding: const EdgeInsets.only(
            bottom: spacingStandard,
            left: spacingLarge,
            right: spacingLarge,
            top: spacingLarge),
        titlePadding: const EdgeInsets.only(
            top: spacingLarge, left: spacingLarge, right: spacingLarge),
        contentPadding: const EdgeInsets.symmetric(
            vertical: spacingSmall, horizontal: spacingLarge),
        actionsAlignment: MainAxisAlignment.end,
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
