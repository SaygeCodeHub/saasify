import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/resetPassword/reset_password_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/updatePassword/update_password_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class UpdatePasswordMobileScreen extends StatelessWidget {
  const UpdatePasswordMobileScreen({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: spacingExcel),
          const SaasifyLogo(),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          LabelAndFieldWidget(
            label: StringConstants.kOTP,
            onTextFieldChanged: (value) {
              context
                  .read<ResetPasswordBloc>()
                  .userInputAuthenticationMap['token'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
            prefixIcon: const Icon(Icons.password_outlined),
            label: StringConstants.kPassword,
            onTextFieldChanged: (value) {
              context
                  .read<ResetPasswordBloc>()
                  .userInputAuthenticationMap['password'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              prefixIcon: const Icon(Icons.password_outlined),
              label: StringConstants.kConfirmPassword,
              onTextFieldChanged: (value) {
                context
                    .read<ResetPasswordBloc>()
                    .userInputAuthenticationMap['password'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          UpdatePasswordButton(formKey: formKey),
        ],
      ),
    );
  }
}
