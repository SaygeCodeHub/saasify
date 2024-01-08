import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/screens/companies/widgets/companies_mobile_screen.dart';
import 'package:saasify/screens/companies/widgets/companies_web_screen.dart';
import '../../bloc/onboarding/onboarding_bloc.dart';
import '../../bloc/onboarding/onboarding_event.dart';
import '../../data/models/authentication/authentication_model.dart';

class CompaniesScreen extends StatelessWidget {
  final List<Company> companyList;
  static const routeName = 'CompaniesScreen';

  CompaniesScreen({super.key, required this.companyList});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingBloc>().add(SelectCompany(companyIndex: -1));

    return PopScope(
        canPop: false,
        child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return (constraints.maxWidth < 600)
              ? CompaniesMobileScreen(companyList: companyList)
              : CompaniesWebScreen(companyList: companyList);
        })));
  }
}
