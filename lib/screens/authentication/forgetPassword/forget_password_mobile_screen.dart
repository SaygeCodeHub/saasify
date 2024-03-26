import 'package:flutter/material.dart';
import '../../../configs/app_spacing.dart';

class ForgotPasswordMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ForgotPasswordMobileScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          SizedBox(height: MediaQuery.of(context).size.height * 0.045),
          const Text(
            "Forgot your password? It happens to the best of us. Enter your email, and we'll send a rescue team to bring it back.",
          ),
          const SizedBox(height: spacingBetweenTextFields),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
        ],
      ),
    );
  }
}
