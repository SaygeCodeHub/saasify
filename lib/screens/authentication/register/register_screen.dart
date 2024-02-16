import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/screens/authentication/register/register_mobile_screen.dart';
import 'package:saasify/screens/authentication/register/register_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'RegisterScreen';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RegisterBloc>().userInputAuthenticationMap.clear();
    return Scaffold(
      body: Form(
        key: formKey,
        child: ResponsiveLayout(
            mobileBody: RegisterMobileScreen(formKey: formKey),
            desktopBody: RegisterWebScreen(formKey: formKey)),
      ),
    );
  }
}
