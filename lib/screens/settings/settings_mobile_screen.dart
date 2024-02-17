import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/settings/settings_model.dart';

import '../../bloc/settings/settings_bloc.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/layoutWidgets/background_card_widget.dart';
import '../../widgets/layoutWidgets/multifield_row.dart';
import '../../widgets/text/field_label_widget.dart';
import '../../widgets/text/module_heading.dart';

class SettingsMobileScreen extends StatelessWidget {
  final SettingsData settingsData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SettingsMobileScreen({super.key, required this.settingsData});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: context.read<SettingsBloc>().isEdit,
        builder: (BuildContext context, bool value, Widget? child) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            bottom: spacingLarge, top: spacingXXSmall),
                        child: ModuleHeading(label: 'Address & Location')),
                    LabelAndFieldWidget(
                        label: 'Branch Address', readOnly: !value),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Branch Latitude', readOnly: !value),
                    const SizedBox(height: spacingXMedium),
                    const LabelAndFieldWidget(label: 'Branch Longitude'),
                    const SizedBox(height: spacingXMedium),
                    const LabelAndFieldWidget(label: 'Branch PinCode'),
                    const SizedBox(height: spacingLarge),
                    const Divider(),
                    const SizedBox(height: spacingMedium),
                    const Padding(
                        padding: EdgeInsets.only(
                            bottom: spacingLarge, top: spacingXXSmall),
                        child: ModuleHeading(label: 'General Settings')),
                    LabelAndFieldWidget(
                        label: 'Default Approver',
                        initialValue:
                            settingsData.defaultApprover.approverName),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Time In', initialValue: settingsData.timeIn),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Time Out', initialValue: settingsData.timeOut),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Currency', initialValue: settingsData.currency),
                    const SizedBox(height: spacingLarge),
                    const Divider(),
                    const Padding(
                        padding: EdgeInsets.only(
                            bottom: spacingLarge, top: spacingXXSmall),
                        child: ModuleHeading(label: 'Leaves Settings')),
                    const LabelAndFieldWidget(label: 'No of working days'),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Total Medical Leaves',
                        initialValue: settingsData.totalMedicalLeaves),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Total Casual Leaves',
                        initialValue: settingsData.totalCasualLeaves),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Overtime rate',
                        initialValue: settingsData.overtimeRate),
                    const SizedBox(height: spacingXMedium),
                    LabelAndFieldWidget(
                        label: 'Overtime rate per',
                        initialValue: settingsData.overtimeRatePer),
                    const SizedBox(height: spacingLarge)
                  ])));
        });
  }
}
