import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/updatePassword/reset_password_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';

class ForgotPasswordMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ForgotPasswordMobileScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
          const SaasifyLogo(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
          const Text(
            "Forgot your password? It happens to the best of us. Enter your email, and we'll send a rescue team to bring it back.",
          ),
          const SizedBox(height: spacingBetweenTextFields),
          EmailTextField(
              isRequired: true,
              onTextFieldChanged: (value) {
                context
                    .read<ResetPasswordBloc>()
                    .userInputAuthenticationMap['email'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          UpdatePasswordButton(formKey: formKey)
        ],
      ),
    );
  }
}
