import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/screens/settings/widgets/edit_settings_button.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../configs/app_spacing.dart';
import '../../di/app_module.dart';
import '../../repositories/employee/employee_repository.dart';
import '../../widgets/text/time_picker_lable_widget.dart';
import '../../widgets/layoutWidgets/multifield_row.dart';
import '../../widgets/text/custom_dropdown_widget.dart';
import '../../widgets/text/dropdown_label_widget.dart';
import '../../widgets/text/module_heading.dart';

class SettingsWebScreen extends StatelessWidget {
  final SettingsData settingsData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SettingsWebScreen({super.key, required this.settingsData});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: ValueListenableBuilder<bool>(
                valueListenable: context.read<SettingsBloc>().isEdit,
                builder: (BuildContext context, bool value, Widget? child) {
                  return Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    bottom: spacingLarge, top: spacingXXSmall),
                                child:
                                    ModuleHeading(label: 'Address & Location')),
                            MultiFieldRow(childrenWidgets: [
                              LabelAndFieldWidget(
                                  label: 'Branch Address',
                                  readOnly: !value,
                                  initialValue: settingsData.branchAddress,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap[
                                        "branch_address"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Branch Latitude',
                                  readOnly: !value,
                                  initialValue: settingsData.latitude,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["latitude"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Branch Longitude',
                                  readOnly: !value,
                                  initialValue: settingsData.longitude,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["longitude"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Branch Pincode',
                                  initialValue: settingsData.pincode,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["pincode"] = value;
                                  })
                            ]),
                            const SizedBox(height: spacingLarge),
                            const Divider(),
                            const SizedBox(height: spacingMedium),
                            const Padding(
                                padding: EdgeInsets.only(
                                    bottom: spacingLarge, top: spacingXXSmall),
                                child:
                                    ModuleHeading(label: 'General Settings')),
                            MultiFieldRow(childrenWidgets: [
                              FutureBuilder(
                                  future: getIt<EmployeeRepository>()
                                      .getAllEmployees(),
                                  builder: (context, snapshot) {
                                    return DropdownLabelWidget(
                                        label: "Default Approvers",
                                        initialValue:
                                            settingsData.defaultApprover.id,
                                        items: snapshot.data == null
                                            ? []
                                            : snapshot.data!.data
                                                .where((element) => element
                                                    .designations
                                                    .contains("OWNER"))
                                                .map((e) => CustomDropDownItem(
                                                    label: e.name,
                                                    value: e.employeeId))
                                                .toList(),
                                        onChanged: (value) {
                                          context
                                                  .read<SettingsBloc>()
                                                  .updateSettingsMap[
                                              "default_approver"] = value;
                                        });
                                  }),
                              TimePickerPopUp(
                                  label: 'Time In',
                                  isRequired: true,
                                  initialValue: settingsData.timeIn,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["time_in"] = value;
                                  }),
                              TimePickerPopUp(
                                  isRequired: true,
                                  label: 'Time Out',
                                  initialValue: settingsData.timeOut,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["time_out"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Currency',
                                  initialValue: settingsData.currency,
                                  onTextFieldChanged: (String? value) {
                                    context
                                        .read<SettingsBloc>()
                                        .updateSettingsMap["currency"] = value;
                                  })
                            ]),
                            const SizedBox(height: spacingLarge),
                            const Divider(),
                            const Padding(
                                padding: EdgeInsets.only(
                                    bottom: spacingLarge, top: spacingXXSmall),
                                child: ModuleHeading(label: 'Leaves Settings')),
                            const SizedBox(height: spacingLarge),
                            MultiFieldRow(childrenWidgets: [
                              LabelAndFieldWidget(
                                  label: 'No of working days',
                                  initialValue: settingsData.workingDays,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap["working_days"] =
                                        value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Total Medical Leaves',
                                  initialValue: settingsData.totalMedicalLeaves,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap[
                                        "total_medical_leaves"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Total Casual Leaves',
                                  initialValue: settingsData.totalCasualLeaves,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap[
                                        "total_casual_leaves"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Overtime rate',
                                  initialValue: settingsData.overtimeRate,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap[
                                        "overtime_rate"] = value;
                                  }),
                              LabelAndFieldWidget(
                                  label: 'Overtime rate per',
                                  initialValue: settingsData.overtimeRatePer,
                                  onTextFieldChanged: (String? value) {
                                    context
                                            .read<SettingsBloc>()
                                            .updateSettingsMap[
                                        "overtime_rate_per"] = value;
                                  })
                            ]),
                            const SizedBox(height: spacingLarge),
                            Padding(
                                padding: const EdgeInsets.all(spacingMedium),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child:
                                        EditSettingsButton(formKey: formKey)))
                          ]));
                })));
  }
}
