import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/onboarding/onboarding_state.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../configs/spacing.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../branches/branches_screen.dart';
import 'companies_gridview.dart';

class CompaniesWebScreen extends StatelessWidget {
  final List<Company> companyList;

  const CompaniesWebScreen({super.key, required this.companyList});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
      Padding(
          padding: const EdgeInsets.all(webBodyPadding),
          child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  child: BlocBuilder<OnboardingBloc, OnboardingStates>(
                      builder: (context, state) {
                    if (state is CompaniesLoaded) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/saasify_logo.svg",
                                width: kSassifyLogoSize,
                                height: kSassifyLogoSize),
                            const SizedBox(
                                height: spacingBetweenTextFieldAndButton),
                            Text(StringConstants.kSelectCompany,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingLarge),
                            CompaniesGridView(
                                companyList: companyList,
                                selectedCompanyIndex:
                                    state.selectedCompanyIndex,
                                isFromMobile: false),
                            const SizedBox(height: spacingLarge),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  PrimaryButton(
                                      onPressed:
                                          (state.selectedCompanyIndex != -1)
                                              ? () {
                                                  Navigator.pushReplacementNamed(
                                                      context,
                                                      BranchesScreen.routeName,
                                                      arguments: companyList[state
                                                          .selectedCompanyIndex]);
                                                }
                                              : null,
                                      buttonTitle: StringConstants.kNext,
                                      buttonWidth: kNextButtonWidth)
                                ])
                          ]);
                    } else {
                      return const SizedBox.shrink();
                    }
                  }))))
    ]);
  }
}
