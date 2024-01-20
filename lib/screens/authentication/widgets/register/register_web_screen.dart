import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/widgets/register/register_button.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';

class RegisterWebScreen extends StatelessWidget {
  const RegisterWebScreen({super.key});

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
                                      label: StringConstants.kFirstName,
                                      onTextFieldChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndFieldWidget(
                                      label: StringConstants.kLastName,
                                      onTextFieldChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingBetweenTextFields),
                              Row(children: [
                                Expanded(
                                    child: LabelAndFieldWidget(
                                        label: StringConstants.kMobileNumber,
                                        onTextFieldChanged: (value) {})),
                                const SizedBox(width: spacingSmall),
                                Expanded(
                                    child: LabelAndFieldWidget(
                                        label: StringConstants.kEmailAddress,
                                        onTextFieldChanged: (value) {},
                                        obscureText: true))
                              ]),
                              const SizedBox(height: spacingBetweenTextFields),
                              Row(children: [
                                Expanded(
                                    child: LabelAndFieldWidget(
                                        label: StringConstants.kPassword,
                                        onTextFieldChanged: (value) {})),
                                const SizedBox(width: spacingSmall),
                                Expanded(
                                    child: LabelAndFieldWidget(
                                        label: StringConstants.kConfirmPassword,
                                        onTextFieldChanged: (value) {},
                                        obscureText: true))
                              ]),
                              const SizedBox(
                                  height: spacingBetweenTextFieldAndButton),
                              const RegisterButton(),
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
