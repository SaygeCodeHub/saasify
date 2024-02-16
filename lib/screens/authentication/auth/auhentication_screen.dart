import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/screens/authentication/auth/auth_mobile_screen.dart';
import 'package:saasify/screens/authentication/auth/auth_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = 'AuthenticationScreen';

  AuthenticationScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().userInputAuthenticationMap.clear();
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
