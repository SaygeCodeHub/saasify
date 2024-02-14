import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/updatePassword/update_password_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class UpdatePasswordWebScreen extends StatelessWidget {
  final bool isVerifyToken;

  const UpdatePasswordWebScreen(
      {super.key, required this.formKey, required this.isVerifyToken});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SaasifyLogo(),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            const Text(
                "Enter the OTP received on your registered email address and add a new password."),
            const SizedBox(height: spacingBetweenTextFields),
            !isVerifyToken
                ? const SizedBox.shrink()
                : EmailTextField(
                    isRequired: true,
                    onTextFieldChanged: (value) {
                      context
                          .read<ResetPasswordBloc>()
                          .userInputAuthenticationMap['email'] = value;
                    }),
            !isVerifyToken
                ? const SizedBox.shrink()
                : const SizedBox(height: spacingBetweenTextFields),
            LabelAndFieldWidget(
                label: StringConstants.kOTP,
                prefixIcon: const Icon(Icons.password_outlined),
                isRequired: true,
                onTextFieldChanged: (value) {
                  context
                      .read<ResetPasswordBloc>()
                      .userInputAuthenticationMap['token'] = value;
                }),
            const SizedBox(height: spacingBetweenTextFields),
            LabelAndFieldWidget(
                obscureText: true,
                label: StringConstants.kPassword,
                isRequired: true,
                prefixIcon: const Icon(Icons.password_outlined),
                onTextFieldChanged: (value) {
                  context
                      .read<ResetPasswordBloc>()
                      .userInputAuthenticationMap['password'] = value;
                }),
            const SizedBox(height: spacingBetweenTextFields),
            LabelAndFieldWidget(
                obscureText: true,
                label: StringConstants.kConfirmPassword,
                isRequired: true,
                prefixIcon: const Icon(Icons.password_outlined),
                validator: (value) {
                  if (value !=
                      context
                          .read<ResetPasswordBloc>()
                          .userInputAuthenticationMap['password']) {
                    return 'Passwords do not match';
                  }
                  return null;
                }),
            const SizedBox(height: spacingBetweenTextFields),
            UpdatePasswordButton(formKey: formKey, isVerifyToken: isVerifyToken)
          ],
        ),
      ),
    );
  }
}
