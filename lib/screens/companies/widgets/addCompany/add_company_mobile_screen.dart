import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/profile/saasifyLogo.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class AddCompanyMobileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddCompanyMobileScreen({super.key, required this.formKey});

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
              prefixIcon: const Icon(Icons.store),
              onTextFieldChanged: (value) {
                context
                    .read<CompaniesBloc>()
                    .companyDetailsMap['company_name'] = value;
              }),
          const SizedBox(height: spacingBetweenTextFieldAndButton),
          AddCompanyButton(formKey: formKey)
        ],
      ),
    );
  }
}
