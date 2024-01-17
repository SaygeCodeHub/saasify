import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/widgets/auth/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/widgets/auth/auth_web_screen.dart';

import '../../widgets/layoutWidgets/responsive_layout.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            body: Form(
                key: formKey,
                child: ResponsiveLayout(
                    mobileBody: AuthMobileScreen(formKey: formKey),
                    desktopBody: AuthWebScreen(formKey: formKey)))));
  }
}
