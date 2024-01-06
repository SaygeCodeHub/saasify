import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/onboarding/onboarding_event.dart';
import '../../../bloc/onboarding/onboarding_state.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/authentication/authentication_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';
import 'branch_list_gridview.dart';

class BranchWebScreen extends StatelessWidget {
  const BranchWebScreen({
    super.key,
    required this.formKey,
    required this.selectedCompany,
  });

  final GlobalKey<FormState> formKey;
  final Company selectedCompany;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    if (state is BranchesLoaded) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/SaaSify.svg",
                                width: kLogoWidth),
                            const SizedBox(height: spacingXXHuge),
                            Text(StringConstants.kBranches,
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTiny
                                    .copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: spacingMedium),
                            CustomTextField(
                                hintText: StringConstants.kSearchBranches,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(fontWeight: FontWeight.w500),
                                keyboardType: TextInputType.text,
                                onTextFieldChanged: (value) {}),
                            const SizedBox(height: spacingXXHuge),
                            BranchList(
                                selectedBranchIndex: state.selectedBranchIndex,
                                branchList: selectedCompany.branches),
                            // const SizedBox(height: spacingLarge),
                            PrimaryButton(
                                onPressed: (state.selectedBranchIndex != -1)
                                    ? () {
                                        context.read<OnboardingBloc>().add(
                                            SetCompanyAndBranchIds(
                                                companyId:
                                                    selectedCompany.companyId,
                                                branchId: selectedCompany
                                                    .branches[state
                                                        .selectedBranchIndex]
                                                    .branchId));
                                        Navigator.pushReplacementNamed(context,
                                            DashboardsScreen.routeName);
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
    ]);
  }
}