import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/lable_and_textfield_widget.dart';

class RegisterMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterMobileScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: spacingExcel),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          LabelAndTextFieldWidget(
            prefixIcon: const Icon(Icons.person_2_outlined),
            label: StringConstants.kFirstName,
            isRequired: true,
            onTextFieldChanged: (value) {
              // Add your logic here if needed
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndTextFieldWidget(
            prefixIcon: const Icon(Icons.person_2_outlined),
            isRequired: true,
            label: StringConstants.kLastName,
            onTextFieldChanged: (value) {
              // Add your logic here if needed
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          RegisterButton(formKey: formKey),
        ],
      ),
    );
  }
}
