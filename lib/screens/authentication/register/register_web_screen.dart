import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import 'package:saasify/utils/authentication_validators.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/lable_and_textfield_widget.dart';

class RegisterWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map registerMap = {};

  RegisterWebScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width * 0.60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey, width: 5.0),
        ),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.18,
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
                      const SizedBox(height: spacingBetweenTextFieldAndButton),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.person_2_outlined),
                                      isRequired: true,
                                      label: StringConstants.kFirstName,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'First name is required';
                                        }
                                        return null;
                                      },
                                      onTextFieldChanged: (value) {
                                        registerMap['first_name'] = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.person_2_outlined),
                                      label: StringConstants.kLastName,
                                      isRequired: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Last name is required';
                                        }
                                        return null;
                                      },
                                      onTextFieldChanged: (value) {
                                        registerMap['last_name'] = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingBetweenTextFields),
                              Row(
                                children: [
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      isRequired: true,
                                      label: StringConstants.kEmailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        } else if (!AuthenticationValidators()
                                            .isValidEmail(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      onTextFieldChanged: (value) {
                                        registerMap['email'] = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                      prefixIcon:
                                          const Icon(Icons.password_outlined),
                                      label: StringConstants.kPassword,
                                      isRequired: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required';
                                        } else if (!AuthenticationValidators()
                                            .isValidPassword(value)) {
                                          return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                                        }
                                        return null;
                                      },
                                      onTextFieldChanged: (value) {
                                        registerMap['password'] = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingBetweenTextFields),
                              const SizedBox(
                                  height: spacingBetweenTextFieldAndButton),
                              RegisterButton(
                                  formKey: formKey, registerMap: registerMap),
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
