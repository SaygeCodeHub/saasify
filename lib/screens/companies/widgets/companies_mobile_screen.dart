import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../configs/spacing.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../branches/branches_screen.dart';
import 'companies_gridview.dart';

class CompaniesMobileScreen extends StatelessWidget {
  final List<Company> companyList;

  const CompaniesMobileScreen({super.key, required this.companyList});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
      Padding(
          padding: const EdgeInsets.all(mobileBodyPadding),
          child: BlocBuilder<OnboardingBloc, OnboardingStates>(
              builder: (context, state) {
            if (state is CompaniesLoaded) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                    SvgPicture.asset("assets/saasify_logo.svg",
                        width: kSassifyLogoSize, height: kSassifyLogoSize),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
                    Text(StringConstants.kSelectCompany,
                        style: Theme.of(context)
                            .textTheme
                            .tiniest
                            .copyWith(fontWeight: FontWeight.w700)),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
                    CompaniesGridView(
                        companyList: companyList,
                        selectedCompanyIndex: state.selectedCompanyIndex,
                        isFromMobile: true),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
                    PrimaryButton(
                        onPressed: (state.selectedCompanyIndex != -1)
                            ? () {
                                Navigator.pushReplacementNamed(
                                    context, BranchesScreen.routeName,
                                    arguments: companyList[
                                        state.selectedCompanyIndex]);
                              }
                            : null,
                        buttonTitle: 'Next')
                  ]);
            } else {
              return const SizedBox.shrink();
            }
          }))
    ]);
  }
}
