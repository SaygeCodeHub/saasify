import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/task/task_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/enums/task_priority_enum.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/layoutWidgets/multifield_row.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class AssignTaskForm extends StatelessWidget {
  const AssignTaskForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiFieldRow(childrenWidgets: [
          LabelAndFieldWidget(
              label: 'Title',
              isRequired: true,
              initialValue: context.read<TaskBloc>().taskDetails['title'] ?? '',
              onTextFieldChanged: (text) {
                context.read<TaskBloc>().taskDetails['title'] = text;
              }),
          DropdownLabelWidget(
              label: 'Priority',
              isRequired: true,
              initialValue: context.read<TaskBloc>().taskDetails['priority'],
              items: TaskPriority.values
                  .map((e) => CustomDropDownItem(label: e.name, value: e.index))
                  .toList(),
              onChanged: (value) {
                context.read<TaskBloc>().taskDetails['priority'] = value;
              }),
          DatePickerField(
              label: 'Due Date',
              isRequired: true,
              initialDate: DateFormat('yyyy-MM-dd').tryParse(
                  context.read<TaskBloc>().taskDetails['due_date'] ?? ''),
              onTextFieldChanged: (date) {
                context.read<TaskBloc>().taskDetails['due_date'] = date;
              }),
        ]),
        const SizedBox(height: spacingLarge),
        MultiFieldRow(childrenWidgets: [
          FutureBuilder(
              future: getIt<EmployeeRepository>().getAllEmployees(),
              builder: (context, snapshot) {
                return DropdownLabelWidget(
                    label: "Monitored By",
                    isRequired: true,
                    initialValue:
                        context.read<TaskBloc>().taskDetails['monitored_by'],
                    items: snapshot.data == null
                        ? []
                        : snapshot.data!.data
                            .map((e) => CustomDropDownItem(
                                label: e.userEmail, value: e.employeeId))
                            .toList(),
                    onChanged: (value) {
                      context.read<TaskBloc>().taskDetails['monitored_by'] =
                          value;
                    });
              }),
          FutureBuilder(
              future: getIt<EmployeeRepository>().getAllEmployees(),
              builder: (context, snapshot) {
                return DropdownLabelWidget(
                    label: "Assigned To",
                    isRequired: true,
                    initialValue:
                        context.read<TaskBloc>().taskDetails['assigned_to'],
                    items: snapshot.data == null
                        ? []
                        : snapshot.data!.data
                            .map((e) => CustomDropDownItem(
                                label: e.userEmail, value: e.employeeId))
                            .toList(),
                    onChanged: (value) {
                      context.read<TaskBloc>().taskDetails['assigned_to'] =
                          value;
                    });
              }),
        ]),
        const SizedBox(height: spacingLarge),
        LabelAndFieldWidget(
            label: 'Description',
            isRequired: true,
            initialValue:
                context.read<TaskBloc>().taskDetails['task_description'] ?? '',
            maxLines: 7,
            onTextFieldChanged: (text) {
              context.read<TaskBloc>().taskDetails['task_description'] = text;
            })
      ],
    );
  }
}
