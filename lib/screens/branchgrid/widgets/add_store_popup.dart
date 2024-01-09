import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/branches/branches_event.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../bloc/branches/branches_bloc.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../../../widgets/toggle_switch_widget.dart';

class AddStorePopup extends StatelessWidget {
  AddStorePopup({super.key});

  static Map addBranchMap = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kDialogueWidth,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StringConstants.kAddNewBranch,
                              style: Theme.of(context)
                                  .textTheme
                                  .xTiniest
                                  .copyWith(fontWeight: FontWeight.w700)),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.close,
                                      color: AppColor.saasifyGrey)))
                        ]),
                    const SizedBox(height: spacingMedium),
                    Row(children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kBranchName,
                                style: Theme.of(context).textTheme.xTiniest),
                            const SizedBox(height: spacingXXSmall),
                            CustomTextField(validator: (value) {
                              if ((value == null || value.trim() == '')) {
                                return StringConstants
                                    .kPleaseEnterTheBranchName;
                              }
                              return null;
                            }, onTextFieldChanged: (value) {
                              addBranchMap['branch_name'] = value;
                            })
                          ])),
                      const SizedBox(width: spacingMedium),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kContact,
                                style: Theme.of(context).textTheme.xTiniest),
                            const SizedBox(height: spacingXXSmall),
                            CustomTextField(
                                validator: (value) {
                                  if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                      .hasMatch(value!)) {
                                    return StringConstants
                                        .kPleaseAddAValidContact;
                                  }
                                  return null;
                                },
                                maxLength: 10,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onTextFieldChanged: (value) {
                                  addBranchMap['branch_contact'] = value;
                                })
                          ]))
                    ]),
                    const SizedBox(height: spacingSmall),
                    Row(children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kCurrency,
                                style: Theme.of(context).textTheme.xTiniest),
                            const SizedBox(height: spacingXXSmall),
                            CustomTextField(validator: (value) {
                              if ((value == null || value.trim() == '')) {
                                return StringConstants
                                    .kPleaseEnterTheBranchCurrency;
                              }
                              return null;
                            }, onTextFieldChanged: (value) {
                              addBranchMap['branch_currency'] = value;
                            })
                          ])),
                      const SizedBox(width: spacingMedium),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(StringConstants.kLocation,
                                style: Theme.of(context).textTheme.xTiniest),
                            const SizedBox(height: spacingXXSmall),
                            CustomTextField(validator: (value) {
                              if ((value == null || value.trim() == '')) {
                                return StringConstants
                                    .kPleaseEnterTheBranchAddress;
                              }
                              return null;
                            }, onTextFieldChanged: (value) {
                              addBranchMap['branch_address'] = value;
                            })
                          ]))
                    ]),
                    Row(children: [
                      Text(StringConstants.kDoYouWantToDeactivateBranch,
                          style: Theme.of(context).textTheme.xTiniest),
                      ToggleSwitchWidget(
                          value: true,
                          onChanged: (value) {
                            addBranchMap['branch_active'] = value;
                          })
                    ]),
                    const SizedBox(height: spacingXMedium),
                    Row(children: [
                      Expanded(
                          child: SecondaryButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              buttonTitle: StringConstants.kCancel)),
                      const SizedBox(width: spacingXXSmall),
                      Expanded(
                          child: PrimaryButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<BranchesBloc>().add(SaveBranch(
                                      branchDetailsMap: addBranchMap));
                                  Navigator.pop(context);
                                }
                              },
                              buttonTitle: StringConstants.kAdd))
                    ])
                  ]),
            )));
  }
}
