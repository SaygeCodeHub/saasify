import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/utils/button_utils.dart';

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
        icon: Row(
          children: [
            const Icon(Icons.error_outline,
                size: kAlertDialogErrorIconSize, color: AppColors.errorRed),
            const SizedBox(width: spacingXSmall),
            Text('Error!',
                style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
            const Spacer(),
            (showLogoutButton)
                ? InkWell(
                    onTap: () {
                      getIt<Cache>().clearSharedPreferences();
                      Navigator.pushNamedAndRemoveUntil(context,
                          AuthenticationScreen.routeName, (route) => false);
                    },
                    child: const Icon(Icons.logout_outlined,
                        size: 20, color: AppColors.errorRed))
                : InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close,
                        size: kAlertDialogCloseIconSize,
                        color: AppColors.black)),
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
        iconPadding: const EdgeInsets.only(
            left: spacingStandard, right: spacingStandard, top: spacingLarger),
        titlePadding: const EdgeInsets.only(top: spacingSmall),
        contentPadding: const EdgeInsets.symmetric(
            vertical: spacingLarger, horizontal: spacingLarge),
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
