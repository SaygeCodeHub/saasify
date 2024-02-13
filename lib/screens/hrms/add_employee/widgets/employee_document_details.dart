import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
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
          MultiFieldRow(childrenWidgets: [
            NumberTextField(
                label: StringConstants.kAadhaarNumber,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['documents']['aadhar']['aadhaar_number'],
                maxLength: 12,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['aadhar']['aadhaar_number'] = value;
                }),
            LabelAndFieldWidget(
                label: StringConstants.kNameAsAadhaarNumber,
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['aadhar']['name_as_per_aadhaar'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['aadhar']['name_as_per_aadhaar'] = value;
                }),
            LabelAndFieldWidget(
                label: StringConstants.kPanNumber,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['documents']['aadhar']['pan_number'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['aadhar']['pan_number'] = value;
                })
          ]),
          const SizedBox(height: spacingHuge),
          const Divider(),
          const SizedBox(height: spacingHuge),
          const Padding(
              padding: EdgeInsets.only(bottom: spacingLarge),
              child: ModuleHeading(
                label: StringConstants.kPassport,
              )),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: StringConstants.kPassportNumber,
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['passport_number'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['passport_number'] = value;
                }),
            LabelAndFieldWidget(
                label: StringConstants.kFirstName,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['documents']['passport']['first_name'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['first_name'] = value;
                }),
            LabelAndFieldWidget(
                label: StringConstants.kLastName,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['documents']['passport']['last_name'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['last_name'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            DatePickerField(
                label: StringConstants.kExpiryDate,
                initialDate: DateFormat('yyyy-mm-dd').tryParse(
                    context.read<EmployeeBloc>().employeeDetails['documents']
                            ['passport']['expiry_date'] ??
                        ""),
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['expiry_date'] = value;
                }),
            DatePickerField(
                label: StringConstants.kIssueDate,
                initialDate: DateFormat('yyyy-mm-dd').tryParse(
                    context.read<EmployeeBloc>().employeeDetails['documents']
                            ['passport']['issue_date'] ??
                        ""),
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['issue_date'] = value;
                }),
            ContactTextField(
                label: StringConstants.kMobileNumber,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['documents']['passport']['mobile_number'],
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['mobile_number'] = value;
                })
          ]),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(childrenWidgets: [
            LabelAndFieldWidget(
                label: StringConstants.kCurrentAddress,
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['current_address'],
                maxLines: 5,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['passport']['current_address'] = value;
                }),
            LabelAndFieldWidget(
                label: StringConstants.kPermanentAddress,
                initialValue:
                    context.read<EmployeeBloc>().employeeDetails['documents']
                        ['passport']['permanent_address'],
                maxLines: 5,
                onTextFieldChanged: (value) {
                  context.read<EmployeeBloc>().employeeDetails['documents']
                      ['permanent_address'] = value;
                })
          ])
        ]));
  }
}
