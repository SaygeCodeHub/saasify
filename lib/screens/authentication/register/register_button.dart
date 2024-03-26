import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import '../auth/authentication_screen.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthenticationScreen(),
              ),
            );
          },
          buttonTitle: StringConstants.kRegister,
        ),
        InkWell(
          onTap: () {
            // Add your logic for navigating to the sign-in screen
          },
          child: const Padding(
            padding: EdgeInsets.only(top: spacingStandard),
            child: Text(
              'Already have an account? Sign in!',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
