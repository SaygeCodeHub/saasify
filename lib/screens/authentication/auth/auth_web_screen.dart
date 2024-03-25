import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/screens/authentication/auth/verify_button.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/lable_and_textfield_widget.dart';
import '../forgetPassword/forget_password_button.dart';

class AuthWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AuthWebScreen({super.key, required this.formKey});

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
                  onTextFieldChanged: (value) {},
                ),
                const SizedBox(height: spacingBetweenTextFields),
                LabelAndTextFieldWidget(
                  prefixIcon: const Icon(Icons.password_outlined),
                  label: StringConstants.kPassword,
                  isRequired: true,
                  onTextFieldChanged: (value) {},
                ),
                const SizedBox(height: spacingBetweenTextFields),
                const ForgotPasswordButton(),
                const SizedBox(height: spacingBetweenTextFieldAndButton),
                AuthVerifyButton(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
