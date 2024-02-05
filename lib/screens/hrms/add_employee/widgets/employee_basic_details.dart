import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class EmployeeBasicDetails extends StatelessWidget {
  const EmployeeBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  isRequired: true,
                  label: StringConstants.kFirstName,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['first_name'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kMiddleName,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']['middle_name'] =
                        value;
                  }),
              LabelAndFieldWidget(
                  isRequired: true,
                  label: StringConstants.kLastName,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['last_name'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  isRequired: true,
                  label: StringConstants.kEmailAddress,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['user_email'] = value;
                  }),
              NumberTextField(
                  label: StringConstants.kMobileNumber,
                  maxLength: 10,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']['user_mobile'] =
                        value;
                  }),
              NumberTextField(
                  label: StringConstants.kAlternateMobileNumber,
                  maxLength: 10,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']
                        ['alternate_mobile'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              DatePickerField(
                  label: StringConstants.kDateOfBirth,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']['date_of_birth'] =
                        value;
                  },
                  context: context),
              NumberTextField(
                  label: StringConstants.kAge,
                  maxLength: 3,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['age'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kGender,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['gender'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kNationality,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']['nationality'] =
                        value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kMaritalStatus,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']
                        ['marital_status'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kCurrentAddress,
                  maxLines: 5,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']
                        ['current_address'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kPermanentAddress,
                  maxLines: 5,
                  onTextFieldChanged: (value) {
                    context
                            .read<EmployeeBloc>()
                            .employeeDetails['personal_info']
                        ['permanent_address'] = value;
                  }),
            ],
          ),
          const SizedBox(height: spacingLarge),
          MultiFieldRow(
            childrenWidgets: [
              LabelAndFieldWidget(
                  label: StringConstants.kCity,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['city'] = value;
                  }),
              LabelAndFieldWidget(
                  label: StringConstants.kState,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['state'] = value;
                  }),
              NumberTextField(
                  label: StringConstants.kPinCode,
                  maxLength: 6,
                  onTextFieldChanged: (value) {
                    context
                        .read<EmployeeBloc>()
                        .employeeDetails['personal_info']['pin_code'] = value;
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
