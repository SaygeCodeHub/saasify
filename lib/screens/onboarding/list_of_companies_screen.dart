import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/onboarding/list_of_branches_screen.dart';
import 'package:saasify/screens/companies/widgets/companies_gridview.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/custom_text_field.dart';

class CompanyListScreen extends StatelessWidget {
  final List<Company> companyList;
  static const routeName = 'CompanyListScreen';

  CompanyListScreen({super.key, required this.companyList});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OnboardingBloc>().add(SelectCompany(companyIndex: -1));
    return Scaffold(
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 5,
          child: Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.only(
                      right: spacingXXXXXHuge,
                      left: spacingXXXXXHuge,
                      top: spacingXXXHuge,
                      bottom: spacingXXXHuge),
                  child: BlocBuilder<OnboardingBloc, OnboardingStates>(
                      builder: (context, state) {
                    if (state is CompaniesLoaded) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/SaaSify.svg",
                                width: kLogoWidth),
                            const SizedBox(height: spacingXXHuge),
                            Text(StringConstants.kCompanies,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiny
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingMedium),
                            CustomTextField(
                                hintText: StringConstants.kSearchCompanies,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(fontWeight: FontWeight.w500),
                                keyboardType: TextInputType.text,
                                onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingMedium),
                            CompaniesGridView(
                                isFromMobile: false,
                                companyList: companyList,
                                selectedCompanyIndex:
                                    state.selectedCompanyIndex),
                            const SizedBox(height: spacingXXHuge),
                            PrimaryButton(
                                onPressed: (state.selectedCompanyIndex != -1)
                                    ? () {
                                        if (companyList[
                                                    state.selectedCompanyIndex]
                                                .branches
                                                .length >
                                            1) {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              BranchesListScreen.routeName,
                                              arguments: companyList[
                                                  state.selectedCompanyIndex]);
                                        } else {
                                          context.read<OnboardingBloc>().add(
                                              SetCompanyAndBranchIds(
                                                  companyId: companyList[state
                                                          .selectedCompanyIndex]
                                                      .companyId,
                                                  branchId: companyList[state
                                                          .selectedCompanyIndex]
                                                      .branches
                                                      .first
                                                      .branchId));
                                          Navigator.pushReplacementNamed(
                                              context,
                                              DashboardsScreen.routeName);
                                        }
                                      }
                                    : null,
                                buttonTitle: 'Next')
                          ]);
                    }
                    return const SizedBox.shrink();
                  })))),
      Expanded(
          flex: 5,
          child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                AppColor.saasifyLightDeepBlue,
                AppColor.saasifyWhite
              ]))))
    ]));
  }
}
