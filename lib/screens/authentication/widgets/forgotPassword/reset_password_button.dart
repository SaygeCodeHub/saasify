import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/auhentication_screen.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
            onPressed: () {},
            buttonTitle: StringConstants.kSendVerificationLink),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, AuthenticationScreen.routeName);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text('Already have an account? Sign in!',
                style: TextStyle(color: AppColors.orange)),
          ),
        ),
      ],
    );
  }
}
