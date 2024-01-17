import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/authentication/widgets/auth/verify_button.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/profile/saasifyLogo.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../forgot_password_button.dart';

class AuthWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthWebScreen({super.key, required this.formKey});

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
              LabelAndFieldWidget(
                  errorText: 'Please enter valid email address',
                  prefixIcon: const Icon(Icons.email_outlined),
                  label: StringConstants.kEmailAddress,
                  onTextFieldChanged: (value) {
                    context
                        .read<AuthBloc>()
                        .userInputAuthenticationMap['email'] = value;
                  }),
              const SizedBox(height: spacingBetweenTextFields),
              LabelAndFieldWidget(
                  errorText: 'Please enter valid password',
                  prefixIcon: const Icon(Icons.password_outlined),
                  label: StringConstants.kPassword,
                  onTextFieldChanged: (value) {
                    context
                        .read<AuthBloc>()
                        .userInputAuthenticationMap['password'] = value;
                  },
                  obscureText: true),
              const ForgotPasswordButton(),
              const SizedBox(height: spacingBetweenTextFieldAndButton),
              AuthVerifyButton(formKey: formKey)
            ],
          ),
        ));
  }
}
