import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/commonMethods/textfield_methods.dart';
import 'package:saasify/screens/authentication/widgets/verify_button.dart';
import 'package:saasify/widgets/saasifyLogo.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../configs/spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/field_label_widget.dart';
import '../forgot_password_screen.dart';

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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: spacingStandard),
                child: Text('Forgot Password?',
                    style: TextStyle(color: AppColors.darkBlue)),
              ),
            ),
          ),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const AuthVerifyButton()
        ],
      ),
    );
  }
}
