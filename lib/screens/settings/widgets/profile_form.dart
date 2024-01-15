import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/profile/fetch_profile_details_model.dart';

import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';

class ProfileScreenForm extends StatelessWidget {
  const ProfileScreenForm({
    super.key,
    required this.profileData,
  });

  final ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(StringConstants.kBranchName,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: spacingSmall),
                CustomTextField(
                    initialValue: profileData.storeName,
                    onTextFieldChanged: (value) {}),
                const SizedBox(height: spacingStandard),
                Text(StringConstants.kOwnerName,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: spacingSmall),
                CustomTextField(
                    initialValue: profileData.ownerName,
                    onTextFieldChanged: (value) {}),
                const SizedBox(height: spacingStandard),
                Text(StringConstants.kAddress,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: spacingSmall),
                CustomTextField(
                    initialValue: profileData.address,
                    onTextFieldChanged: (value) {}),
                const SizedBox(height: spacingStandard),
              ])),
          const SizedBox(width: spacingExcel),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(StringConstants.kEmailAddress,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: spacingSmall),
                CustomTextField(
                    initialValue: profileData.email,
                    onTextFieldChanged: (value) {}),
                const SizedBox(height: spacingStandard),
                // Text(StringConstants.kLastName,
                //     style: Theme.of(context)
                //         .textTheme
                //         .xxTiniest
                //         .copyWith(fontWeight: FontWeight.w700)),
                // const SizedBox(height: spacingSmall),
                // CustomTextField(onTextFieldChanged: (value) {}),
                // const SizedBox(height: spacingStandard),
                Text(StringConstants.kMobileNo,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiniest
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: spacingSmall),
                CustomTextField(
                    initialValue: profileData.ownerContact.toString(),
                    onTextFieldChanged: (value) {}),
                const SizedBox(height: spacingStandard),
              ]))
        ]);
  }
}
