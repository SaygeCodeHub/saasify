import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/widgets/forgotPassword/reset_password_button.dart';

import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';
import '../../generalMethods/textfield_methods.dart';

class ForgotPasswordWebScreen extends StatelessWidget {
  const ForgotPasswordWebScreen({super.key});

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
              "Forgot your password? It happens to the best of us. Enter your email, and we'll send a rescue team to bring it back.",
            ),
            const SizedBox(height: spacingBetweenTextFields),
            LabelAndFieldWidget(
                label: StringConstants.kEmailAddress,
                onTextFieldChanged: (value) {
                  onEmailChanged(value, context);
                }),
            const SizedBox(height: spacingBetweenTextFieldAndButton),
            const ResetPasswordButton()
          ],
        ),
      ),
    );
  }
}
