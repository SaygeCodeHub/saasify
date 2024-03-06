import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';

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
          const SaasifyLogo(),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          LabelAndTextFieldWidget(
            prefixIcon: const Icon(Icons.person_2_outlined),
            label: StringConstants.kFirstName,
            isRequired: true,
            onTextFieldChanged: (value) {
              context
                  .read<RegisterBloc>()
                  .userInputAuthenticationMap['first_name'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndTextFieldWidget(
            prefixIcon: const Icon(Icons.person_2_outlined),
            isRequired: true,
            label: StringConstants.kLastName,
            onTextFieldChanged: (value) {
              context
                  .read<RegisterBloc>()
                  .userInputAuthenticationMap['last_name'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          EmailTextField(
              isRequired: true,
              onTextFieldChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .userInputAuthenticationMap['user_email'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFields),
          PasswordTextField(
              isRequired: true,
              onTextFieldChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .userInputAuthenticationMap['password'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          RegisterButton(formKey: formKey)
        ],
      ),
    );
  }
}
