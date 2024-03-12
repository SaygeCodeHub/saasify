import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String description;
  final String? title;
  final Function? onPressed;
  final bool showLogoutButton;

  const ErrorAlertDialog(
      {super.key,
      required this.description,
      this.title = '',
      this.onPressed,
      this.showLogoutButton = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: showLogoutButton
                    ? InkWell(
                        onTap: () {
                          getIt<Cache>().clearSharedPreferences();
                          Navigator.pushNamedAndRemoveUntil(context,
                              AuthenticationScreen.routeName, (route) => false);
                        },
                        child: const Icon(Icons.logout_outlined,
                            size: 15, color: AppColors.errorRed))
                    : InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close,
                            size: 15, color: AppColors.black))),
            const Icon(Icons.error_outline, size: 25, color: AppColors.black)
          ],
        ),
        title: Text('Error!',
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
