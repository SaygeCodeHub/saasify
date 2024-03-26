import 'package:flutter/material.dart';
import 'package:saasify/screens/skeleton_screen.dart';
import '../../widgets/responsive_layout.dart';
import 'auth_mobile_screen.dart';
import 'auth_web_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SkeletonScreen(
        appBarTitle: 'Sassify',
        bodyContent: Form(
          key: formKey,
          child: ResponsiveLayout(
              mobileBody: AuthMobileScreen(formKey: formKey),
              desktopBody: const AuthWebScreen()),
        ),
        bottomBarButtons: const []);
  }
}
