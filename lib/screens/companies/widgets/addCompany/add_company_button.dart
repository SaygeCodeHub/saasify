import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/companies/companies_bloc.dart';
import 'package:saasify/bloc/companies/companies_event.dart';
import 'package:saasify/bloc/companies/companies_states.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/buttons/primary_button.dart';

class AddCompanyButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddCompanyButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesBloc, CompaniesStates>(
        listener: (context, state) {
      if (state is CompanyAdded) {
        Navigator.pushReplacementNamed(context, HRMSDashboardScreen.routeName);
      }
      if (state is AddingCompanyFailed) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorAlertDialog(description: state.errorMessage.toString());
          },
        );
      }
    }, builder: (context, state) {
      if (state is AddingCompany) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Align(
            alignment: Alignment.centerRight,
            child: PrimaryButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<CompaniesBloc>().add(AddCompany(
                        companyDetails:
                            context.read<CompaniesBloc>().companyDetailsMap));
                  }
                },
                buttonTitle: StringConstants.kNext));
      }
    });
  }
}
