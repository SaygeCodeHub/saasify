import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register/register_mobile_screen.dart';
import 'package:saasify/screens/authentication/register/register_web_screen.dart';

import '../../widgets/responsive_layout.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'RegisterScreen';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ResponsiveLayout(
          mobileBody: RegisterMobileScreen(formKey: formKey),
          desktopBody: RegisterWebScreen(formKey: formKey),
        ),
      ),
    );
  }
}
