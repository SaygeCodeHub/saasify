import 'package:flutter/material.dart';
import '../../../../configs/app_spacing.dart';
import '../../../configs/app_colors.dart';
import 'forget_password_screen.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen(),
          ),
        );
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(top: spacingStandard),
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: AppColors.darkBlue),
          ),
        ),
      ),
    );
  }
}
