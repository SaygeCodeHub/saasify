import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/widgets/forgotPassword/reset_password_button.dart';

import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';

class ForgotPasswordMobileScreen extends StatelessWidget {
  const ForgotPasswordMobileScreen({super.key});

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
          LabelAndFieldWidget(
              label: StringConstants.kEmailAddress,
              onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const ResetPasswordButton()
        ],
      ),
    );
  }
}
