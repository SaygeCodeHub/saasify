import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../configs/app_spacing.dart';
import '../../widgets/layoutWidgets/multifield_row.dart';
import '../../widgets/text/module_heading.dart';

class SettingsWebScreen extends StatelessWidget {
  final SettingsData settingsData;

  const SettingsWebScreen({super.key, required this.settingsData});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: ValueListenableBuilder<bool>(
                valueListenable: context.read<SettingsBloc>().isEdit,
                builder: (BuildContext context, bool value, Widget? child) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(
                                bottom: spacingLarge, top: spacingXXSmall),
                            child: ModuleHeading(label: 'Address & Location')),
                        MultiFieldRow(childrenWidgets: [
                          LabelAndFieldWidget(
                              label: 'Branch Address', readOnly: !value, initialValue: settingsData),
                          LabelAndFieldWidget(
                              label: 'Branch Latitude', readOnly: !value),
                          const LabelAndFieldWidget(label: 'Branch Longitude'),
                          const LabelAndFieldWidget(label: 'Branch PinCode')
                        ]),
                        const SizedBox(height: spacingLarge),
                        const Divider(),
                        const SizedBox(height: spacingMedium),
                        const Padding(
                            padding: EdgeInsets.only(
                                bottom: spacingLarge, top: spacingXXSmall),
                            child: ModuleHeading(label: 'General Settings')),
                        MultiFieldRow(childrenWidgets: [
                          LabelAndFieldWidget(
                              label: 'Default Approver',
                              initialValue: settingsData.defaultApprover.approverName),
                          LabelAndFieldWidget(
                              label: 'Time In',
                              initialValue: settingsData.timeIn),
                          LabelAndFieldWidget(
                              label: 'Time Out',
                              initialValue: settingsData.timeOut),
                          LabelAndFieldWidget(
                              label: 'Currency',
                              initialValue: settingsData.currency)
                        ]),
                        const SizedBox(height: spacingLarge),
                        const Divider(),
                        const Padding(
                            padding: EdgeInsets.only(
                                bottom: spacingLarge, top: spacingXXSmall),
                            child: ModuleHeading(label: 'Leaves Settings')),
                        const SizedBox(height: spacingLarge),
                        MultiFieldRow(childrenWidgets: [
                          const LabelAndFieldWidget(
                              label: 'No of working days'),
                          LabelAndFieldWidget(
                              label: 'Total Medical Leaves',
                              initialValue: settingsData.totalMedicalLeaves),
                          LabelAndFieldWidget(
                              label: 'Total Casual Leaves',
                              initialValue: settingsData.totalCasualLeaves),
                          LabelAndFieldWidget(
                              label: 'Overtime rate',
                              initialValue: settingsData.overtimeRate),
                          LabelAndFieldWidget(
                              label: 'Overtime rate per',
                              initialValue: settingsData.overtimeRatePer)
                        ]),
                        const SizedBox(height: spacingLarge)
                      ]);
                })));
  }
}
