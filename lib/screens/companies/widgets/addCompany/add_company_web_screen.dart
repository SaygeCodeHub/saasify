import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/companies/widgets/addCompany/add_company_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';
import 'package:saasify/widgets/profile/saasify_logo.dart';

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
              LabelAndTextFieldWidget(
                  prefixIcon: const Icon(Icons.store),
                  label: StringConstants.kCompanyName,
                  isRequired: true,
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
