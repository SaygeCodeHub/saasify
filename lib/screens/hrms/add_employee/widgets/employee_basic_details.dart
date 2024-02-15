import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/generalData/india_states_and_cities.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown_widget.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class EmployeeBasicDetails extends StatelessWidget {
  final bool isViewOnly;
  EmployeeBasicDetails({super.key, this.isViewOnly = false});

  final ValueNotifier stateValueNotifier = ValueNotifier<List<String>>([]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      MultiFieldRow(childrenWidgets: [
        LabelAndFieldWidget(
            isRequired: true,
            enabled: !isViewOnly,
            label: StringConstants.kFirstName,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['first_name'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['first_name'] = value;
            }),
        LabelAndFieldWidget(
            label: StringConstants.kMiddleName,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['middle_name'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['middle_name'] = value;
            }),
        LabelAndFieldWidget(
            isRequired: true,
            enabled: !isViewOnly,
            label: StringConstants.kLastName,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['last_name'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['last_name'] = value;
            })
      ]),
      const SizedBox(height: spacingLarge),
      MultiFieldRow(childrenWidgets: [
        EmailTextField(
            isRequired: true,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['user_email'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['user_email'] = value;
            }),
        ContactTextField(
            label: StringConstants.kMobileNumber,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['user_contact'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['user_contact'] = value;
            }),
        ContactTextField(
            label: StringConstants.kAlternateMobileNumber,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['alternate_contact'],
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['alternate_contact'] = value;
            })
      ]),
      const SizedBox(height: spacingLarge),
      MultiFieldRow(childrenWidgets: [
        DatePickerField(
            label: StringConstants.kDateOfBirth,
            enabled: !isViewOnly,
            initialDate: DateFormat('yyyy-mm-dd').tryParse(context
                    .read<EmployeeBloc>()
                    .employeeDetails['personal_info']['date_of_birth'] ??
                ""),
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['date_of_birth'] = value;
            }),
        DropdownLabelWidget(
            label: StringConstants.kGender,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['gender'],
            onChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['gender'] = value;
            },
            hint: '',
            items: stringListToDropdownItems(const ["Male", "Female"])),
        DropdownLabelWidget(
            label: StringConstants.kNationality,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['nationality'],
            onChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['nationality'] = value;
            },
            hint: '',
            items: stringListToDropdownItems(const ["Indian"])),
        DropdownLabelWidget(
            label: StringConstants.kMaritalStatus,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['marital_status'],
            onChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['marital_status'] = value;
            },
            hint: '',
            items: stringListToDropdownItems(const ["Married", "Unmarried"]))
      ]),
      const SizedBox(height: spacingLarge),
      MultiFieldRow(childrenWidgets: [
        LabelAndFieldWidget(
            label: StringConstants.kCurrentAddress,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['current_address'],
            maxLines: 5,
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['current_address'] = value;
            }),
        LabelAndFieldWidget(
            label: StringConstants.kPermanentAddress,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['permanent_address'],
            maxLines: 5,
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['permanent_address'] = value;
            })
      ]),
      const SizedBox(height: spacingLarge),
      MultiFieldRow(childrenWidgets: [
        DropdownLabelWidget(
            label: StringConstants.kState,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['state'],
            hint: '',
            items: stringListToDropdownItems(indiaStatesAndCities
                .map((e) => e['state'])
                .toList()
                .cast<String>()),
            onChanged: (String? value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['state'] = value;
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['city'] = null;
              stateValueNotifier.value = indiaStatesAndCities
                  .firstWhere((element) => element['state'] == value)['cities']
                  .toList()
                  .cast<String>();
            }),
        ValueListenableBuilder(
          valueListenable: stateValueNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return DropdownLabelWidget(
                label: StringConstants.kCity,
                enabled: !isViewOnly,
                initialValue: context
                    .read<EmployeeBloc>()
                    .employeeDetails['personal_info']['city'],
                hint: '',
                items: stringListToDropdownItems(value as List<String>),
                onChanged: (String? value) {
                  context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['city'] = value;
                });
          },
        ),
        NumberTextField(
            label: StringConstants.kPinCode,
            enabled: !isViewOnly,
            initialValue: context
                .read<EmployeeBloc>()
                .employeeDetails['personal_info']['pin_code'],
            maxLength: 6,
            onTextFieldChanged: (value) {
              context.read<EmployeeBloc>().employeeDetails['personal_info']
                  ['pin_code'] = value;
            })
      ])
    ]));
  }
}

List<CustomDropDownItem> stringListToDropdownItems(List<String> list) {
  return list
      .map((e) => CustomDropDownItem(label: e, value: e))
      .toList()
      .cast<CustomDropDownItem>();
}
