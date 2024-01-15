// This Screen will be used later

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/alert_dialogue_box.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class CompanyForm extends StatelessWidget {
  CompanyForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 4,
            child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: spacingXXXHuge,
                        right: spacingXXXHuge,
                        top: spacingXXXHuge),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/SaaSify.svg",
                              width: kLogoWidth),
                          const SizedBox(height: spacingXXXHuge),
                          Text(StringConstants.kAddCompany,
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTiny
                                  .copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: spacingMedium),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialogueBox(
                                        title: StringConstants.kInformation,
                                        message: "",
                                        primaryButtonTitle: StringConstants.kOk,
                                        secondaryOnPressed: () {},
                                        checkMarkVisible: false,
                                        primaryOnPressed: () {},
                                      ));
                            },
                            child: Text(StringConstants.kWhyDoINeedToAddCompany,
                                style: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(
                                        decoration: TextDecoration.underline)),
                          ),
                          const SizedBox(height: kHelloSpacingHeight),
                          Text(StringConstants.kCompanyName,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: spacingMedium),
                          CustomTextField(
                              hintText: StringConstants.kWhatsYourCompany,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .xTiniest
                                  .copyWith(fontWeight: FontWeight.w500),
                              keyboardType: TextInputType.text,
                              onTextFieldChanged: (value) {}),
                          const SizedBox(height: spacingXLarge),
                          Text(StringConstants.kBusinessDomain,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: spacingMedium),
                          CustomTextField(
                              hintText:
                                  StringConstants.kWhatsYourBusinessDomain,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .xTiniest
                                  .copyWith(fontWeight: FontWeight.w500),
                              keyboardType: TextInputType.text,
                              onTextFieldChanged: (value) {}),
                          const SizedBox(height: kHelloSpacingHeight),
                          PrimaryButton(
                            onPressed: () {},
                            buttonWidth: double.maxFinite,
                            buttonTitle: StringConstants.kNext,
                          )
                        ])))),
        Expanded(
            flex: 6,
            child: Container(
              color: AppColor.saasifyLightDeepBlue,
            ))
      ]),
    );
  }
}
