import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/screens/settings/widgets/edit_settings_button.dart';

import '../../bloc/settings/settings_bloc.dart';
import '../../configs/app_spacing.dart';
import '../../di/app_module.dart';
import '../../repositories/employee/employee_repository.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/text/time_picker_lable_widget.dart';
import '../../widgets/text/custom_dropdown_widget.dart';
import '../../widgets/text/dropdown_label_widget.dart';
import '../../widgets/text/field_label_widget.dart';
import '../../widgets/text/module_heading.dart';

class SettingsMobileScreen extends StatelessWidget {
  final SettingsData settingsData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SettingsMobileScreen({super.key, required this.settingsData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                  padding: EdgeInsets.only(
                      bottom: spacingLarge, top: spacingXXSmall),
                  child:
                      ModuleHeading(label: StringConstants.kAddressLocation)),
              LabelAndFieldWidget(
                  label: StringConstants.kBranchAddress,
                  initialValue: settingsData.branchAddress,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["branch_address"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kBranchLatitude,
                  initialValue: settingsData.latitude,
                  onTextFieldChanged: (String? value) {
                    context.read<SettingsBloc>().updateSettingsMap["latitude"] =
                        value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kBranchLongitude,
                  initialValue: settingsData.longitude,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["longitude"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kBranchPinCode,
                  initialValue: settingsData.pincode,
                  onTextFieldChanged: (String? value) {
                    context.read<SettingsBloc>().updateSettingsMap["pincode"] =
                        value;
                  }),
              const SizedBox(height: spacingMedium),
              const Divider(),
              const Padding(
                  padding: EdgeInsets.only(
                      bottom: spacingLarge, top: spacingXXSmall),
                  child: ModuleHeading(label: 'General Settings')),
              FutureBuilder(
                  future: getIt<EmployeeRepository>().getAllEmployees(),
                  builder: (context, snapshot) {
                    return DropdownLabelWidget(
                        label: StringConstants.kDefaultApprover,
                        initialValue: settingsData.defaultApprover.id,
                        items: snapshot.data == null
                            ? []
                            : snapshot.data!.data
                                .where((element) =>
                                    element.designations.contains("OWNER"))
                                .map((e) => CustomDropDownItem(
                                    label: e.name, value: e.employeeId))
                                .toList(),
                        onChanged: (value) {
                          context
                              .read<SettingsBloc>()
                              .updateSettingsMap["default_approver"] = value;
                        });
                  }),
              const SizedBox(height: spacingXMedium),
              TimePickerPopUp(
                  label: StringConstants.kTimeIn,
                  isRequired: true,
                  initialValue: settingsData.timeIn,
                  onTextFieldChanged: (String? value) {
                    context.read<SettingsBloc>().updateSettingsMap["time_in"] =
                        value;
                  }),
              const SizedBox(height: spacingXMedium),
              TimePickerPopUp(
                  isRequired: true,
                  label: StringConstants.kTimeOut,
                  initialValue: settingsData.timeOut,
                  onTextFieldChanged: (String? value) {
                    context.read<SettingsBloc>().updateSettingsMap["time_out"] =
                        value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kCurrency,
                  initialValue: settingsData.currency,
                  onTextFieldChanged: (String? value) {
                    context.read<SettingsBloc>().updateSettingsMap["currency"] =
                        value;
                  }),
              const SizedBox(height: spacingMedium),
              const Divider(),
              const Padding(
                  padding: EdgeInsets.only(
                      bottom: spacingLarge, top: spacingXXSmall),
                  child: ModuleHeading(label: 'Leaves Settings')),
              LabelAndFieldWidget(
                  label: StringConstants.kWorkingDays,
                  initialValue: settingsData.workingDays,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["working_days"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  isRequired: true,
                  label: StringConstants.kTotalMedicalLeaves,
                  initialValue: settingsData.totalMedicalLeaves,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["total_medical_leaves"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  isRequired: true,
                  label: StringConstants.kTotalCasualLeaves,
                  initialValue: settingsData.totalCasualLeaves,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["total_casual_leaves"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kOvertimeRate,
                  initialValue: settingsData.overtimeRate,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["overtime_rate"] = value;
                  }),
              const SizedBox(height: spacingXMedium),
              LabelAndFieldWidget(
                  label: StringConstants.kOverTimeRatePer,
                  initialValue: settingsData.overtimeRatePer,
                  onTextFieldChanged: (String? value) {
                    context
                        .read<SettingsBloc>()
                        .updateSettingsMap["overtime_rate_per"] = value;
                  }),
              const SizedBox(height: spacingLarge),
              EditSettingsButton(isMobile: true, formKey: formKey)
            ])));
  }
}
