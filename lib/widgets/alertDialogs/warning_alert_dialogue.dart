import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class WarningAlertDialogue extends StatelessWidget {
  final String description;
  final Function? onPressed;

  const WarningAlertDialogue(
      {super.key, required this.description, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: const Icon(FontAwesomeIcons.circleExclamation,
            size: kSassifyLogoSize, color: AppColors.warningYellow),
        title: const Text('Warning'),
        content: Text(description),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(
            bottom: spacingSmall, left: spacingSmall, right: spacingSmall),
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).height * 0.40,
            child: PrimaryButton(
                backgroundColor: AppColors.warningYellow,
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                buttonTitle: 'Ok'),
          )
        ]);
  }
}
