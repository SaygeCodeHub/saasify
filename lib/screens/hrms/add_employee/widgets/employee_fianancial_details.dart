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
  const EmployeeFinancialDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['basic_salary'] = value;
                }),
            NumberTextField(
                label: "Basket of Allowance",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['BOA'] = value;
                }),
            NumberTextField(
                label: "Bonus",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['bonus'] = value;
                }),
            NumberTextField(
                label: "Performance Bonus",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['performance_bonus'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Provisional Fund",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['PF'] = value;
                }),
            NumberTextField(
                label: "Deduction",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['deduction'] = value;
                }),
            NumberTextField(
                label: "Gratuity",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['gratuity'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Fixed Monthly Gross",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['finances']['fixed_monthly_gross'] = value;
                }),
            NumberTextField(
                label: "Total Annual Gross",
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
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['bank_name'] = value;
                }),
            LabelAndFieldWidget(
                label: "Branch Name",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['branch_name'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: "Account Number",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['account_number'] = value;
                }),
            LabelAndFieldWidget(
                label: "IFSC Code",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['ifsc_code'] = value;
                }),
            LabelAndFieldWidget(
                label: "Account Type",
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['account_type'] = value;
                }),
            DropdownLabelWidget(
                label: "Country",
                items: stringListToDropdownItems(["India"]),
                onChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['financial']
                      ['bank_details']['country'] = value;
                })
          ])
        ]));
  }
}
