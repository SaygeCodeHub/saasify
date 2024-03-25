import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register/register_button.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../widgets/lable_and_textfield_widget.dart';

class RegisterWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterWebScreen({super.key, required this.formKey});

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
                                      onTextFieldChanged: (value) {
                                        // Add your logic here if needed
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
                                      onTextFieldChanged: (value) {
                                        // Add your logic here if needed
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingBetweenTextFields),
                              const SizedBox(height: spacingBetweenTextFields),
                              const SizedBox(
                                  height: spacingBetweenTextFieldAndButton),
                              RegisterButton(formKey: formKey),
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
