import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';
import 'package:saasify/utils/authentication_validators.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/lable_and_textfield_widget.dart';
import '../forgetPassword/forget_password_button.dart';

class AuthWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Map authenticationMap = {};

  AuthWebScreen({super.key, required this.formKey});

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        caseSensitive: false, multiLine: false);

    return regex.hasMatch(email);
  }

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
        child: Container(
          color: AppColors.lightGrey,
          child: Padding(
            padding: const EdgeInsets.all(spacingBetweenTextFieldAndButton),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/saasify_logo.svg",
                    width: 50, height: 50),
                const SizedBox(height: spacingBetweenTextFields),
                LabelAndTextFieldWidget(
                  prefixIcon: const Icon(Icons.email_outlined),
                  label: StringConstants.kEmailAddress,
                  isRequired: true,
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
                    authenticationMap['email'] = value;
                  },
                ),
                const SizedBox(height: spacingBetweenTextFields),
                LabelAndTextFieldWidget(
                  prefixIcon: const Icon(Icons.password_outlined),
                  label: StringConstants.kPassword,
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onTextFieldChanged: (value) {
                    authenticationMap['password'] = value;
                  },
                ),
                const SizedBox(height: spacingBetweenTextFields),
                const ForgotPasswordButton(),
                const SizedBox(height: spacingBetweenTextFieldAndButton),
                AuthVerifyButton(
                    formKey: formKey, authenticationMap: authenticationMap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
