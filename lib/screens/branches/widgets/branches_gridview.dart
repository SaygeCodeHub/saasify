import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';

class BranchesGridView extends StatelessWidget {
  final int selectedBranchIndex;
  final List<Branch> branchList;

  final bool isFromMobile;

  const BranchesGridView({
    super.key,
    required this.branchList,
    required this.selectedBranchIndex,
    required this.isFromMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (isFromMobile == true) ? 2 : 6,
                childAspectRatio: 2,
                crossAxisSpacing: spacingLarge,
                mainAxisSpacing: spacingLarge),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: branchList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context
                        .read<OnboardingBloc>()
                        .add(SelectBranch(branchIndex: index));
                  },
                  child: Container(
                      height: kCompaniesGridContainerHeight,
                      padding: const EdgeInsets.all(spacingSmall),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          border: Border.all(
                              width: 2,
                              color: (selectedBranchIndex == index)
                                  ? AppColors.orange
                                  : AppColor.saasifyPaleGrey),
                          borderRadius: BorderRadius.circular(kCircularRadius)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Image.asset('assets/store.png',
                                    fit: BoxFit.cover)),
                            const SizedBox(height: spacingXXSmall),
                            Expanded(
                              child: Text(branchList[index].branchName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xTiniest
                                      .copyWith(fontWeight: FontWeight.w600)),
                            )
                          ])));
            }));
  }
}
