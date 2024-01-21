import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/configs/spacing.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../forgotPassword/forgot_password_button.dart';

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
            LabelAndFieldWidget(
                errorText: 'Please enter valid email address',
                prefixIcon: const Icon(Icons.email_outlined),
                label: StringConstants.kEmailAddress,
                onTextFieldChanged: (value) {
                  context.read<AuthBloc>().userInputAuthenticationMap['email'] =
                      value;
                }),
            const SizedBox(height: spacingBetweenTextFields),
            LabelAndFieldWidget(
                errorText: 'Please enter valid password',
                prefixIcon: const Icon(Icons.password_outlined),
                label: StringConstants.kPassword,
                onTextFieldChanged: (value) {
                  context
                      .read<AuthBloc>()
                      .userInputAuthenticationMap['password'] = value;
                },
                obscureText: true),
            const ForgotPasswordButton(),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            AuthVerifyButton(formKey: formKey)
          ],
        ),
      ),
    );
  }
}
