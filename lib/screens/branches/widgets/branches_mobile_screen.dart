import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/bloc/onboarding/onboarding_state.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/onboarding/onboarding_event.dart';
import '../../../configs/spacing.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';
import 'branches_gridview.dart';

class BranchesMobileScreen extends StatelessWidget {
  final List<Branch> branchList;
  final Company selectedCompany;

  const BranchesMobileScreen(
      {super.key, required this.branchList, required this.selectedCompany});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      SvgPicture.asset("assets/gradient.svg", fit: BoxFit.fill),
      Padding(
          padding: const EdgeInsets.all(mobileBodyPadding),
          child: BlocBuilder<OnboardingBloc, OnboardingStates>(
              builder: (context, state) {
            if (state is BranchesLoaded) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                    SvgPicture.asset("assets/saasify_logo.svg",
                        width: kSassifyLogoSize, height: kSassifyLogoSize),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios,
                              size: kBackIconSize)),
                      Text(StringConstants.kSelectBranch,
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w700))
                    ]),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
                    BranchesGridView(
                        selectedBranchIndex: state.selectedBranchIndex,
                        branchList: selectedCompany.branches,
                        isFromMobile: true),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.075),
                    PrimaryButton(
                        onPressed: (state.selectedBranchIndex != -1)
                            ? () {
                                context.read<OnboardingBloc>().add(
                                    SetCompanyAndBranchIds(
                                        companyId: selectedCompany.companyId,
                                        branchId: selectedCompany
                                            .branches[state.selectedBranchIndex]
                                            .branchId));
                                Navigator.pushReplacementNamed(
                                    context, DashboardsScreen.routeName);
                              }
                            : null,
                        buttonTitle: StringConstants.kNext)
                  ]);
            } else {
              return const SizedBox.shrink();
            }
          }))
    ]);
  }
}
