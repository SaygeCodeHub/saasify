import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/companies/widgets/addCompany/save_company_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class AddCompanyMobileScreen extends StatelessWidget {
  const AddCompanyMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
          const SaasifyLogo(),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          LabelAndFieldWidget(
              label: StringConstants.kCompanyName,
              onTextFieldChanged: (value) {}),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          const SaveCompanyButton()
        ]));
  }
}
