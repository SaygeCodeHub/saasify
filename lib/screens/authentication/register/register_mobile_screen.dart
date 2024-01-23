import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

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
              onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kLastName, onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kEmailAddress,
              onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kMobileNumber,
              onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              label: StringConstants.kPassword,
              onTextFieldChanged: (value) {},
              obscureText: true),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const RegisterButton()
        ],
      ),
    );
  }
}
