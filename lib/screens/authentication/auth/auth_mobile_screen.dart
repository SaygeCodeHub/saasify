import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_button.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';

class AuthMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const AuthMobileScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SaasifyLogo(height: 45),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            EmailTextField(
                isRequired: true,
                onTextFieldChanged: (value) {
                  context.read<AuthBloc>().userInputAuthenticationMap['email'] =
                      value;
                }),
            const SizedBox(height: spacingBetweenTextFields),
            PasswordTextField(onTextFieldChanged: (value) {
              context.read<AuthBloc>().userInputAuthenticationMap['password'] =
                  value;
            }),
            const ForgotPasswordButton(),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            AuthVerifyButton(formKey: formKey),
          ],
        ),
      ),
    );
  }
}
