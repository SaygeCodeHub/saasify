import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/data/models/settings/settings_model.dart';
import 'package:saasify/screens/settings/widgets/edit_settings_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import '../../configs/app_spacing.dart';
import '../../data/enums/geo_fencing_enum.dart';
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
  final bool isViewOnly;

  SettingsWebScreen(
      {super.key, required this.settingsData, required this.isViewOnly});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const Padding(
                          padding: EdgeInsets.only(
                              bottom: spacingLarge, top: spacingXXSmall),
                          child: ModuleHeading(
                              label: StringConstants.kAddressLocation)),
                      MultiFieldRow(childrenWidgets: [
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kBranchAddress,
                            initialValue: settingsData.branchAddress,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["branch_address"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kBranchLatitude,
                            initialValue: settingsData.latitude,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["latitude"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kBranchLongitude,
                            initialValue: settingsData.longitude,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["longitude"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kBranchPinCode,
                            initialValue: settingsData.pincode,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["pincode"] = value;
                            })
                      ]),
                      const Padding(
                          padding: EdgeInsets.only(
                              bottom: spacingLarge, top: spacingLarge),
                          child: ModuleHeading(
                              label: StringConstants.kGeneralSettings)),
                      Column(children: [
                        MultiFieldRow(childrenWidgets: [
                          FutureBuilder(
                              future:
                                  getIt<EmployeeRepository>().getAllEmployees(),
                              builder: (context, snapshot) {
                                return DropdownLabelWidget(
                                    enabled: !isViewOnly,
                                    label: StringConstants.kDefaultApprover,
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
                              enabled: !isViewOnly,
                              label: StringConstants.kTimeIn,
                              isRequired: true,
                              initialValue: settingsData.timeIn,
                              onTextFieldChanged: (String? value) {
                                context
                                    .read<SettingsBloc>()
                                    .updateSettingsMap["time_in"] = value;
                              }),
                          TimePickerPopUp(
                              enabled: !isViewOnly,
                              isRequired: true,
                              label: StringConstants.kTimeOut,
                              initialValue: settingsData.timeOut,
                              onTextFieldChanged: (String? value) {
                                context
                                    .read<SettingsBloc>()
                                    .updateSettingsMap["time_out"] = value;
                              }),
                          LabelAndFieldWidget(
                              enabled: !isViewOnly,
                              label: StringConstants.kCurrency,
                              initialValue: settingsData.currency,
                              onTextFieldChanged: (String? value) {
                                context
                                    .read<SettingsBloc>()
                                    .updateSettingsMap["currency"] = value;
                              })
                        ]),
                        const SizedBox(height: spacingLarge),
                        MultiFieldRow(childrenWidgets: [
                          DropdownLabelWidget(
                              enabled: !isViewOnly,
                              label: "Geo Fencing",
                              initialValue: settingsData.geoFencing.toString(),
                              items: GeoFencingEnum.values
                                  .map((e) => CustomDropDownItem(
                                      label: e.isGeoFencing.toString(),
                                      value: e.isGeoFencing.toString()))
                                  .toList(),
                              onChanged: (value) {
                                context
                                    .read<SettingsBloc>()
                                    .updateSettingsMap["geo_fencing"] = value;
                              })
                        ])
                      ]),
                      const Padding(
                          padding: EdgeInsets.only(
                              bottom: spacingLarge, top: spacingLarge),
                          child: ModuleHeading(
                              label: StringConstants.kLeaveSettings)),
                      MultiFieldRow(childrenWidgets: [
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kWorkingDays,
                            initialValue: settingsData.workingDays,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["working_days"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            isRequired: true,
                            label: StringConstants.kTotalMedicalLeaves,
                            initialValue: settingsData.totalMedicalLeaves,
                            onTextFieldChanged: (String? value) {
                              context.read<SettingsBloc>().updateSettingsMap[
                                  "total_medical_leaves"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            isRequired: true,
                            label: StringConstants.kTotalCasualLeaves,
                            initialValue: settingsData.totalCasualLeaves,
                            onTextFieldChanged: (String? value) {
                              context.read<SettingsBloc>().updateSettingsMap[
                                  "total_casual_leaves"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kOvertimeRate,
                            initialValue: settingsData.overtimeRate,
                            onTextFieldChanged: (String? value) {
                              context
                                  .read<SettingsBloc>()
                                  .updateSettingsMap["overtime_rate"] = value;
                            }),
                        LabelAndFieldWidget(
                            enabled: !isViewOnly,
                            label: StringConstants.kOverTimeRatePer,
                            initialValue: settingsData.overtimeRatePer,
                            onTextFieldChanged: (String? value) {
                              context
                                      .read<SettingsBloc>()
                                      .updateSettingsMap["overtime_rate_per"] =
                                  value;
                            })
                      ]),
                      const SizedBox(height: spacingLarge),
                      Visibility(
                          visible: !isViewOnly,
                          child: Padding(
                              padding: const EdgeInsets.all(spacingMedium),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: EditSettingsButton(formKey: formKey))))
                    ])))));
  }
}
