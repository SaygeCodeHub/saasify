import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/register/register_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class RegisterWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterWebScreen({super.key, required this.formKey});

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
              child: Image.asset('assets/abstract.png', fit: BoxFit.fill),
            ),
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
                      const SizedBox(height: spacingBetweenTextFieldAndButton),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabelAndFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.person_2_outlined),
                                      label: StringConstants.kFirstName,
                                      onTextFieldChanged: (value) {
                                        context
                                                .read<RegisterBloc>()
                                                .userInputAuthenticationMap[
                                            'first_name'] = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.person_2_outlined),
                                      label: StringConstants.kLastName,
                                      onTextFieldChanged: (value) {
                                        context
                                                .read<RegisterBloc>()
                                                .userInputAuthenticationMap[
                                            'last_name'] = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingBetweenTextFields),
                              LabelAndFieldWidget(
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  label: StringConstants.kEmailAddress,
                                  onTextFieldChanged: (value) {
                                    context
                                            .read<RegisterBloc>()
                                            .userInputAuthenticationMap[
                                        'user_email'] = value;
                                  }),
                              const SizedBox(height: spacingBetweenTextFields),
                              LabelAndFieldWidget(
                                  prefixIcon:
                                      const Icon(Icons.password_outlined),
                                  label: StringConstants.kPassword,
                                  onTextFieldChanged: (value) {
                                    context
                                            .read<RegisterBloc>()
                                            .userInputAuthenticationMap[
                                        'password'] = value;
                                  },
                                  obscureText: true),
                              const SizedBox(
                                  height: spacingBetweenTextFieldAndButton),
                              RegisterButton(formKey: formKey)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
