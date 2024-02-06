import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/updatePassword/update_password_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class UpdatePasswordWebScreen extends StatelessWidget {
  const UpdatePasswordWebScreen({super.key, required this.formKey});
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
            LabelAndFieldWidget(
                label: StringConstants.kOTP,
                errorText: 'Please enter a otp',
                onTextFieldChanged: (value) {
                  context
                      .read<ResetPasswordBloc>()
                      .userInputAuthenticationMap['token'] = value;
                }),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            LabelAndFieldWidget(
                obscureText: true,
                errorText: 'Please enter a password',
                label: StringConstants.kPassword,
                prefixIcon: const Icon(Icons.password_outlined),
                onTextFieldChanged: (value) {
                  context
                      .read<ResetPasswordBloc>()
                      .userInputAuthenticationMap['password'] = value;
                }),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            LabelAndFieldWidget(
                obscureText: true,
                errorText: 'Please confirm a password',
                label: StringConstants.kConfirmPassword,
                prefixIcon: const Icon(Icons.password_outlined),
                onTextFieldChanged: (value) {
                  context
                      .read<ResetPasswordBloc>()
                      .userInputAuthenticationMap['password'] = value;
                }),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            UpdatePasswordButton(formKey: formKey),
          ],
        ),
      ),
    );
  }
}
