import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/branches/branches_bloc.dart';
import 'package:saasify/bloc/branches/branches_event.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/branches/fetch_all_branches_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/toggle_switch_widget.dart';
import 'edit_branch_popup.dart';

class BranchesGrid extends StatelessWidget {
  final List<BranchesData> branchesData;

  const BranchesGrid({super.key, required this.branchesData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: branchesData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: spacingStandard,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                  ],
                  color: AppColor.saasifyWhite),
              child: Padding(
                  padding: const EdgeInsets.all(kCircularRadius),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: spacingXXSmall),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(branchesData[index].branchName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .tiniest
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.saasifyDarkerGrey)),
                                const SizedBox(height: spacingXXSmall),
                                Text(
                                    branchesData[index]
                                        .branchContact
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.xxTiniest),
                                const SizedBox(height: spacingXXSmall),
                                Row(children: [
                                  Text(StringConstants.kCurrency,
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest),
                                  Text(branchesData[index].branchCurrency,
                                      style:
                                          Theme.of(context).textTheme.xxTiniest)
                                ]),
                                const SizedBox(height: spacingXXSmall),
                                Row(children: [
                                  Text(StringConstants.kLocation,
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxTiniest),
                                  Text(branchesData[index].branchAddress,
                                      style:
                                          Theme.of(context).textTheme.xxTiniest)
                                ])
                              ]),
                        ),
                        Row(children: [
                          ToggleSwitchWidget(
                              value: branchesData[index].branchActive,
                              onChanged: (bool value) {
                                Map editBranchesMap =
                                    branchesData[index].toJson();
                                editBranchesMap['branch_active'] = value;
                                context.read<BranchesBloc>().add(EditBranches(
                                    branchDetailsMap: editBranchesMap));
                              }),
                          const SizedBox(width: spacingXSmall),
                          EditBranchPopup(branchesData: branchesData[index])
                        ])
                      ])));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3,
            crossAxisSpacing: spacingLarge,
            mainAxisSpacing: spacingLarge));
  }
}
