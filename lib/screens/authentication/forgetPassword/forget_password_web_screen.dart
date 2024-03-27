import 'package:flutter/material.dart';

import '../../../configs/app_spacing.dart';

class ForgotPasswordWebScreen extends StatelessWidget {
  const ForgotPasswordWebScreen({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.30,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: spacingBetweenTextFieldAndButton),
            Text(
              "Forgot your password? It happens to the best of us. Enter your email, and we'll send a rescue team to bring it back.",
            ),
            SizedBox(height: spacingBetweenTextFields),
            SizedBox(height: spacingBetweenTextFieldAndButton),
          ],
        ),
      ),
    );
  }
}
