import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../../../widgets/layoutWidgets/multifield_row.dart';
import '../../../../widgets/text/field_label_widget.dart';
import '../../../../widgets/text/module_heading.dart';

class EmployeeDocumentDetails extends StatelessWidget {
  const EmployeeDocumentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: spacingLarge, top: spacingXSmall),
            child: ModuleHeading(label: StringConstants.kAadhaar),
          ),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kAadhaarNumber,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['aadhar']['aadhaar_number'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kNameAsAadhaarNumber,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['aadhar']['name_as_aadhaar'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kPanNumber,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['aadhar']['pan_number'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingHuge),
          const Divider(),
          const SizedBox(height: spacingHuge),
          const Padding(
            padding: EdgeInsets.only(bottom: spacingLarge),
            child: ModuleHeading(
              label: StringConstants.kPassport,
            ),
          ),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kPassportNumber,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['passport_number'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kFirstName,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['first_name'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kLastName,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['last_name'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kExpiryDate,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['expiry_date'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kIssueDate,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['issue_date'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kMobileNumber,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['mobile'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kAddress,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['address'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kAddress,
                  maxLines: 5,
                  onTextFieldChanged: (value) {
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['address'] = value;
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
