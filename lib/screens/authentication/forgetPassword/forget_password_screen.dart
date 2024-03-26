import 'package:flutter/material.dart';

import '../../widgets/responsive_layout.dart';
import 'forget_password_mobile_screen.dart';
import 'forget_password_web_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'ForgotPasswordScreen';

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: ResponsiveLayout(
          mobileBody: ForgotPasswordMobileScreen(formKey: formKey),
          desktopBody: ForgotPasswordWebScreen(formKey: formKey),
        ),
      ),
    );
  }
}
