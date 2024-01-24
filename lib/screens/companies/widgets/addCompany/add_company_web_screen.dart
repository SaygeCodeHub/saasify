import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_button.dart';

import '../../../../configs/spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/profile/saasifyLogo.dart';

class AddCompanyWebScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddCompanyWebScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SaasifyLogo(),
              const SizedBox(height: spacingBetweenTextFieldAndButton),
              LabelAndFieldWidget(
                  prefixIcon: const Icon(Icons.store),
                  label: StringConstants.kCompanyName,
                  errorText: 'Please enter a valid name',
                  onTextFieldChanged: (value) {
                    context
                        .read<CompaniesBloc>()
                        .companyDetailsMap['company_name'] = value;
                  }),
              const SizedBox(height: spacingBetweenTextFieldAndButton),
              AddCompanyButton(formKey: formKey)
            ],
          ),
        ));
  }
}
