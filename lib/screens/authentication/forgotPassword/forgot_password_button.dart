import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

import '../../../../configs/app_spacing.dart';
import 'forgot_password_screen.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(top: spacingStandard),
          child: Text('Forgot Password?',
              style: TextStyle(color: AppColors.darkBlue)),
        ),
      ),
    );
  }
}
