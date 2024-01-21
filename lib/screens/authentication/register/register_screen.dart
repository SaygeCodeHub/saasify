import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register/register_mobile_screen.dart';
import 'package:saasify/screens/authentication/register/register_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: RegisterMobileScreen(), desktopBody: RegisterWebScreen()),
    );
  }
}
