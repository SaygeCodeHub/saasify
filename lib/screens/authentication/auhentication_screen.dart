import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/widgets/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/widgets/auth_web_screen.dart';
import '../../widgets/responsive_layout.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const PopScope(
        canPop: false,
        child: Scaffold(
            body: ResponsiveLayout(
                mobileBody: AuthMobileScreen(), desktopBody: AuthWebScreen())));
  }
}
