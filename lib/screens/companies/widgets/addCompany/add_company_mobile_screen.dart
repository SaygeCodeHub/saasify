import 'package:flutter/material.dart';
import 'package:saasify/screens/companies/widgets/addCompany/save_company_button.dart';

import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';

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
        ],
      ),
    );
  }
}
