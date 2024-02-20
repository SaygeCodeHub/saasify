import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/enums/employee_type_enum.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/selectable_modules_form_field.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/dynamic_drop_down.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class EmployeeOfficialDetails extends StatelessWidget {
  final bool isViewOnly;

  const EmployeeOfficialDetails({super.key, this.isViewOnly = false});

  @override
  Widget build(BuildContext context) {
    bool canEditOfficial =
        context.read<EmployeeBloc>().employeeDetails['official']?['can_edit'] ??
            true;
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          MultiFieldRow(childrenWidgets: [
            DropdownLabelWidget(
                label: "Designation",
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                items: EmployeeType.values
                    .map((e) =>
                        CustomDropDownItem(label: e.type, value: e.typeId))
                    .toList(),
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['designations']
                    .first,
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['designations'] = value;
                }),
            DatePickerField(
                label: "Date of Joining",
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                initialDate: DateFormat('yyyy-mm-dd').tryParse(context
                        .read<EmployeeBloc>()
                        .employeeDetails['official']['doj'] ??
                    ""),
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['doj'] = value;
                }),
            DropdownLabelWidget(
                label: "Job Confirmation",
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['job_confirmation'],
                items: [
                  CustomDropDownItem(label: "Yes", value: true),
                  CustomDropDownItem(label: "No", value: false)
                ],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['job_confirmation'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            DynamicDropDown(
                future: getIt<EmployeeRepository>().getAllEmployees(),
                label: "Reporting Manager",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['reporting_manager'],
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['reporting_manager'] = value;
                }),
            DynamicDropDown(
                future: getIt<EmployeeRepository>().getAllEmployees(),
                label: "Approvers",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['approvers']
                    ?.first,
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['approvers'] = [value];
                }),
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: "Current Address",
                isRequired: true,
                enabled: !isViewOnly && canEditOfficial,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['current_location'],
                maxLines: 3,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['current_location'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          const LabelTextWidget(label: "Accessible Features"),
          SelectableModulesFormField(
              isViewOnly: isViewOnly || !canEditOfficial,
              selectedFeatures: context
                      .read<EmployeeBloc>()
                      .employeeDetails['official']['accessible_modules']
                      ?.cast<Map<String, dynamic>>() ??
                  [],
              onSelected: (value) {
                context.read<EmployeeBloc>().employeeDetails['official']
                    ['accessible_modules'] = value;
              })
        ]));
  }
}
