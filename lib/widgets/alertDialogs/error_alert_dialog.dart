import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

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
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return AlertDialog(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            showLogoutButton
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          getIt<Cache>().clearSharedPreferences();
                          Navigator.pushNamedAndRemoveUntil(context,
                              AuthenticationScreen.routeName, (route) => false);
                        },
                        icon: const Icon(Icons.logout,
                            color: AppColors.errorRed)),
                  )
                : const SizedBox.shrink(),
            SizedBox.square(
                dimension: kSassifyLogoSize,
                child: Image.asset('assets/xmark-circle.png')),
          ],
        ),
        title: Text('Error!',
            style: Theme.of(context).textTheme.dialogueHeadingTextStyle),
        actionsPadding: const EdgeInsets.only(
            bottom: spacingSmall, left: spacingSmall, right: spacingSmall),
        content: Text(description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.dialogueContentTextStyle),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          PrimaryButton(
              buttonWidth:
                  isMobile ? kErrorPopButtonWidth : kGeneralActionButtonWidth,
              backgroundColor: AppColors.errorRed,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              buttonTitle: 'Dismiss')
        ]);
  }
}
