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
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../../../widgets/toggle_switch_widget.dart';

class EditBranchPopup extends StatelessWidget {
  const EditBranchPopup({super.key, required this.branchesData});

  final BranchesData branchesData;

  @override
  Widget build(BuildContext context) {
    Map editBranchesMap = branchesData.toJson();

    editBranchesMap['branch_contact'] = '917896541230';
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                          content: SizedBox(
                              width: kDialogueWidth,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(StringConstants.kEditBranch,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xTiniest
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700)),
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Align(
                                              alignment: Alignment.topRight,
                                              child: Icon(Icons.close,
                                                  color: AppColor.saasifyGrey),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: spacingMedium),
                                    Text(StringConstants.kBranchName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .xTiniest),
                                    const SizedBox(height: spacingXXSmall),
                                    CustomTextField(
                                        initialValue: branchesData.branchName,
                                        onTextFieldChanged: (value) {
                                          editBranchesMap['branch_name'] =
                                              value;
                                        }),
                                    const SizedBox(height: spacingSmall),
                                    Row(children: [
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Text(StringConstants.kCurrency,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .xTiniest),
                                            const SizedBox(
                                                height: spacingXXSmall),
                                            CustomTextField(
                                                initialValue:
                                                    branchesData.branchCurrency,
                                                onTextFieldChanged: (value) {
                                                  editBranchesMap[
                                                          'branch_currency'] =
                                                      value;
                                                })
                                          ])),
                                      const SizedBox(width: spacingMedium),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(StringConstants.kLocation,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xTiniest),
                                          const SizedBox(
                                              height: spacingXXSmall),
                                          CustomTextField(
                                              initialValue:
                                                  branchesData.branchAddress,
                                              onTextFieldChanged: (value) {
                                                editBranchesMap[
                                                    'branch_address'] = value;
                                              })
                                        ],
                                      ))
                                    ]),
                                    Row(
                                      children: [
                                        Text(
                                            StringConstants
                                                .kDoYouWantToDeactivateBranch,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xTiniest),
                                        ToggleSwitchWidget(
                                            value: true, onChanged: (value) {}),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingXMedium,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SecondaryButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              buttonTitle:
                                                  StringConstants.kCancel),
                                        ),
                                        const SizedBox(
                                          width: spacingXXSmall,
                                        ),
                                        Expanded(
                                            child: PrimaryButton(
                                                onPressed: () {
                                                  context
                                                      .read<BranchesBloc>()
                                                      .add(EditBranches(
                                                          branchDetailsMap:
                                                              editBranchesMap));
                                                  Navigator.pop(ctx);
                                                },
                                                buttonTitle:
                                                    StringConstants.kSave))
                                      ],
                                    )
                                  ]))));
                },
                child: const Text(StringConstants.kEdit)),
          ];
        },
        child: const Icon(Icons.more_vert));
  }
}
