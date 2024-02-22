import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/employee_basic_details.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class EmployeeFinancialDetails extends StatelessWidget {
  final bool isViewOnly;
  const EmployeeFinancialDetails({super.key, this.isViewOnly = false});

  @override
  Widget build(BuildContext context) {
    bool canEditFinancial = context
            .read<EmployeeBloc>()
            .employeeDetails['financial']['finances']['can_edit'] ??
        true;
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXSmall),
            child: ModuleHeading(label: "Finances"),
          ),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Salary",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['basic_salary'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['basic_salary'] = value;
                }),
            NumberTextField(
                label: "Basket of Allowance",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['BOA'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['BOA'] = value;
                }),
            NumberTextField(
                label: "Bonus",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['bonus'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['bonus'] = value;
                }),
            NumberTextField(
                label: "Performance Bonus",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['finances']['performance_bonus'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['performance_bonus'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Provisional Fund",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['PF'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['PF'] = value;
                }),
            NumberTextField(
                label: "Deduction",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['deduction'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['deduction'] = value;
                }),
            NumberTextField(
                label: "Gratuity",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['finances']['gratuity'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['gratuity'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Fixed Monthly Gross",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['finances']['fixed_monthly_gross'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['fixed_monthly_gross'] = value;
                }),
            NumberTextField(
                label: "Total Annual Gross",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['finances']['total_annual_gross'],
                enabled: !isViewOnly && canEditFinancial,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['total_annual_gross'] = value;
                })
          ]),
          const SizedBox(height: spacingHuge),
          const Divider(),
          const SizedBox(height: spacingHuge),
          const Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXSmall),
            child: ModuleHeading(label: "Bank Details"),
          ),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: "Bank Name",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['bank_details']['bank_name'],
                enabled: !isViewOnly,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['bank_name'] = value;
                }),
            LabelAndFieldWidget(
                label: "Branch Name",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['bank_details']['branch_name'],
                enabled: !isViewOnly,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['branch_name'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Account Number",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['bank_details']['account_number'],
                maxLength: 18,
                enabled: !isViewOnly,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['account_number'] = value;
                }),
            LabelAndFieldWidget(
                label: "IFSC Code",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['bank_details']['ifsc_code'],
                enabled: !isViewOnly,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['ifsc_code'] = value;
                }),
            LabelAndFieldWidget(
                label: "Account Type",
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['financial']
                        ['bank_details']['account_type'],
                enabled: !isViewOnly,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['account_type'] = value;
                }),
            DropdownLabelWidget(
                label: "Country",
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['financial']['bank_details']['country'],
                enabled: !isViewOnly,
                items: stringListToDropdownItems(["India"]),
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['country'] = value;
                })
          ])
        ]));
  }
}
