import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_mobile_screen.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'ForgotPasswordScreen';

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ResponsiveLayout(
      mobileBody: ForgotPasswordMobileScreen(),
      desktopBody: ForgotPasswordWebScreen(),
    ));
  }
}
