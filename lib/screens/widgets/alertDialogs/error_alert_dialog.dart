import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../authentication/auth/authentication_screen.dart';

class ErrorAlertDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ErrorAlertDialog({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(StringConstants.kRegister),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, AuthenticationScreen.routeName);
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
