import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/custom_dropdown_widget.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class EmployeeOfficialDetails extends StatelessWidget {
  const EmployeeOfficialDetails({super.key});

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
                items: [CustomDropDownItem(label: "Employee", value: 2)],
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
                initialDate: DateFormat('dd-mm-yyyy').tryParse(context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['DOJ'] ??
                    ""),
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['DOJ'] = value;
                }),
            DropdownLabelWidget(
                label: "Job Confirmation",
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
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['reporting_manager'],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['reporting_manager'] = value;
                },
                items: const []),
            DropdownLabelWidget(
                label: "Approvers",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['approvers'],
                items: const [],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                  ['approvers'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: "Current Address",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['current_location'],
                readOnly: true,
                maxLines: 5,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                  ['current_location'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            DropdownLabelWidget(
                label: "Accessible Features",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['official']['accessible_features'],
                items: const [],
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['official']
                      ['accessible_features'] = value;
                })
          ])
        ]));
  }
}
