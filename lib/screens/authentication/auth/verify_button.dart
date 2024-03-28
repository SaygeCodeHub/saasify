import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import '../register/register_screen.dart';

class AuthVerifyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map authenticationMap;

  const AuthVerifyButton(
      {super.key, required this.formKey, required this.authenticationMap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {}
          },
          buttonTitle: StringConstants.kSignUp,
        ),
        const SizedBox(height: spacingStandard),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacingStandard),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: const Text(
              'New user? Create an account!',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
