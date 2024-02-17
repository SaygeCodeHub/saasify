import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class SuccessAlertDialog extends StatelessWidget {
  final String description;
  final String? title;
  final Function? onPressed;

  const SuccessAlertDialog(
      {super.key, required this.description, this.title = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset('assets/correct.png',
          height: kSassifyLogoSize, width: kSassifyLogoSize),
      title: const Text('Success'),
      content: Text(description),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(
          bottom: spacingSmall, left: spacingSmall, right: spacingSmall),
      actions: [
        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.40,
          child: PrimaryButton(
              backgroundColor: AppColors.successGreen,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              buttonTitle: 'Ok'),
        )
      ],
    );
  }
}
