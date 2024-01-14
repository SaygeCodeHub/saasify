import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/widgets/register/register_button.dart';
import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';
import '../../generalMethods/textfield_methods.dart';

class RegisterMobileScreen extends StatelessWidget {
  const RegisterMobileScreen({super.key});

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
              label: StringConstants.kFirstName,
              onTextFieldChanged: (value) {
                onEmailChanged(value, context);
              }),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kLastName,
              onTextFieldChanged: (value) {
                onEmailChanged(value, context);
              }),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kEmailAddress,
              onTextFieldChanged: (value) {
                onEmailChanged(value, context);
              }),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kMobileNumber,
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
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const RegisterButton()
        ],
      ),
    );
  }
}
