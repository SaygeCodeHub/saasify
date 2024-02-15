import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String description;
  final String? title;
  final Function? onPressed;

  const ErrorAlertDialog(
      {super.key, required this.description, this.title = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset('assets/cross.png',
          height: kDashboardIconContainerSize,
          width: kDashboardIconContainerSize),
      title: const Text('Error!'),
      actionsPadding: const EdgeInsets.only(
          bottom: spacingSmall, left: spacingSmall, right: spacingSmall),
      content: Text(description),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.40,
          child: PrimaryButton(
              backgroundColor: AppColors.errorRed,
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
