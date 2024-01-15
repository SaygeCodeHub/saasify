import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_bloc.dart';
import 'package:saasify/bloc/onboarding/onboarding_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/data/models/authentication/authentication_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class BranchList extends StatelessWidget {
  final int selectedBranchIndex;
  final List<Branch> branchList;

  const BranchList(
      {super.key, required this.branchList, required this.selectedBranchIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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
              child: Padding(
                  padding: EdgeInsets.all(context.responsive(spacingSmall,
                      tablets: spacingXXSmall, desktop: spacingSmall)),
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.all(context.responsive(spacingSmall,
                          tablets: spacingXXSmall, desktop: spacingSmall)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kCardRadius),
                          color: (selectedBranchIndex == index)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyCementGrey),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(branchList[index].branchName,
                              maxLines: 1,
                              textScaleFactor:
                                  context.responsive(0.8, desktop: 1),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .tiniest
                                  .copyWith(color: AppColor.saasifyWhite))
                        ],
                      ))),
            );
          }),
    );
  }
}
