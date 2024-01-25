import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/auth/auth_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';
import 'package:saasify/screens/authentication/forgotPassword/forgot_password_button.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';

class AuthWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthWebScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.80,
          width: MediaQuery.sizeOf(context).width * 0.60,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 5.0),
          ),
          child: Row(
            children: [
              SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width * 0.18,
                  child: Image.asset('assets/abstract.png', fit: BoxFit.fill)),
              Expanded(
                child: Container(
                  color: AppColors.lightGrey,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(spacingBetweenTextFieldAndButton),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SaasifyLogo(),
                        const SizedBox(
                            height: spacingBetweenTextFieldAndButton),
                        EmailTextField(
                            isRequired: true,
                            onTextFieldChanged: (value) {
                              context
                                  .read<AuthBloc>()
                                  .userInputAuthenticationMap['email'] = value;
                            }),
                        const SizedBox(height: spacingBetweenTextFields),
                        PasswordTextField(onTextFieldChanged: (value) {
                          context
                              .read<AuthBloc>()
                              .userInputAuthenticationMap['password'] = value;
                        }),
                        const ForgotPasswordButton(),
                        const SizedBox(
                            height: spacingBetweenTextFieldAndButton),
                        AuthVerifyButton(formKey: formKey)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
