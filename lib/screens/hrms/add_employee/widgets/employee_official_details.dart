import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
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
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: "Date of Joining",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['DOJ'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Job Confirmation",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['job_confirmation'] = value;
                  })
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: "Current Location",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['current_location'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Department Head",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['department_head'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Reporting Manager",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['reporting_manager'] = value;
                  })
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: "Designation",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['designation'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Approvers",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['approvers'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Department",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['department'] = value;
                  }),
              LabelAndFieldWidget(
                  label: "Accessible Features",
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['official']
                        ['accessible_features'] = value;
                  })
            ],
          )
        ],
      ),
    );
  }
}
