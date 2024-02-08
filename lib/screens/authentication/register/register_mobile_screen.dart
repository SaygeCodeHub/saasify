import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

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
          LabelAndFieldWidget(
            errorText: 'Please enter valid first name',
            prefixIcon: const Icon(Icons.person_2_outlined),
            label: StringConstants.kFirstName,
            onTextFieldChanged: (value) {
              context
                  .read<RegisterBloc>()
                  .userInputAuthenticationMap['first_name'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
            errorText: 'Please enter valid last name',
            prefixIcon: const Icon(Icons.person_2_outlined),
            label: StringConstants.kLastName,
            onTextFieldChanged: (value) {
              context
                  .read<RegisterBloc>()
                  .userInputAuthenticationMap['last_name'] = value;
            },
          ),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              errorText: 'Please enter valid email address',
              prefixIcon: const Icon(Icons.email_outlined),
              label: StringConstants.kEmailAddress,
              onTextFieldChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .userInputAuthenticationMap['user_email'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFields),
          LabelAndFieldWidget(
              errorText: 'Please enter valid password',
              prefixIcon: const Icon(Icons.password_outlined),
              label: StringConstants.kPassword,
              onTextFieldChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .userInputAuthenticationMap['password'] = value;
              },
              obscureText: true),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          RegisterButton(formKey: formKey)
        ],
      ),
    );
  }
}
