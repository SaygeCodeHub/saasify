import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';

import '../../../configs/app_spacing.dart';
import '../forgetPassword/forget_password_button.dart';

class AuthMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthMobileScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Event name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: spacingBetweenTextFields),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Event name',
                border: OutlineInputBorder(),
              ),
            ),
            const ForgotPasswordButton(),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            AuthVerifyButton(formKey: formKey, authenticationMap: {}),
          ],
        ),
      ),
    );
  }
}
