import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_mobile_screen.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'ForgotPasswordScreen';

  ForgotPasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: ResponsiveLayout(
        mobileBody: ForgotPasswordMobileScreen(formKey: formKey),
        desktopBody: ForgotPasswordWebScreen(formKey: formKey),
      ),
    ));
  }
}
