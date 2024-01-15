import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/widgets/auth/verify_button.dart';

import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/profile/saasifyLogo.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../generalMethods/textfield_methods.dart';
import '../forgot_password_button.dart';

class AuthMobileScreen extends StatelessWidget {
  const AuthMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
          const SaasifyLogo(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
          LabelAndFieldWidget(
              label: StringConstants.kEmailAddress,
              onTextFieldChanged: (value) {
                onEmailChanged(value, context);
              }),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kPassword,
              onTextFieldChanged: (value) {
                onPasswordChanged(value, context);
              },
              obscureText: true),
          const ForgotPasswordButton(),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const AuthVerifyButton()
        ],
      ),
    );
  }
}
