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
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class EmployeeOfficialDetails extends StatelessWidget {
  final bool isViewOnly;

  const EmployeeOfficialDetails({super.key, this.isViewOnly = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          MultiFieldRow(childrenWidgets: [
            DropdownLabelWidget(
                label: "Designation",
                isRequired: true,
                enabled: !isViewOnly,
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
                enabled: !isViewOnly,
                initialDate: DateFormat('yyyy-mm-dd').tryParse(context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['DOJ'] ??
                    ""),
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['DOJ'] = value;
                }),
            DropdownLabelWidget(
                label: "Job Confirmation",
                isRequired: true,
                enabled: !isViewOnly,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['job_confirmation'],
                items: [
                  CustomDropDownItem(label: "Yes", value: 0),
                  CustomDropDownItem(label: "No", value: 1)
                ],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['job_confirmation'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            DropdownLabelWidget(
                label: "Reporting Manager",
                isRequired: true,
                enabled: !isViewOnly,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['reporting_manager'],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['reporting_manager'] = value;
                },
                items: const []),
            FutureBuilder(
                future: getIt<EmployeeRepository>().getAllEmployees(),
                builder: (context, snapshot) {
                  return DropdownLabelWidget(
                      label: "Approvers",
                      enabled: !isViewOnly,
                      initialValue: context
                          .read<EmployeeBloc>()
                          .employeeDetails['official']['approvers']
                          ?.first,
                      items: snapshot.data == null
                          ? []
                          : snapshot.data!.data
                              .map((e) => CustomDropDownItem(
                                  label: e.userEmail, value: e.employeeId))
                              .toList(),
                      onChanged: (value) {
                        context.read<EmployeeBloc>().employeeDetails['official']
                            ['approvers'] = [value];
                      });
                }),
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: "Current Address",
                isRequired: true,
                enabled: !isViewOnly,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['current_location'],
                readOnly: true,
                maxLines: 3,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['current_location'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          const LabelTextWidget(label: "Accesible Features"),
          SelectableModulesFormField(
              isViewOnly: isViewOnly,
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
