import 'package:flutter/material.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/formWidgets/drop_down_widget.dart';
import 'package:saasify/widgets/formWidgets/text_field_widget.dart';

class FormWidgetUtil {
  Widget getWidget(Field fieldData, Map<String, dynamic> fieldValues) {
    switch (fieldData.fieldType) {
      case 'text':
        return const Text('Text Widget');
      case 'textField':
        return TextFieldWidget(
          label: fieldData.label,
          hintText: fieldData.placeholder,
          onTextFieldChanged: (value) {
            fieldValues[fieldData.columnName ?? ""] = value;
          },
        );
      case 'datePicker':
        return DatePickerField(
          onTextFieldChanged: (value) {
            fieldValues[fieldData.columnName ?? ""] = value;
          },
        );
      case 'dropdown':
        return DropdownWidget(
            label: fieldData.label,
            items: fieldData.dropdownField!.options!
                .map((e) =>
                    CustomDropDownItem(label: e.label ?? "", value: e.value))
                .toList(),
            onChanged: (value) {
              fieldValues[fieldData.columnName ?? ""] = value;
            });
      default:
        return const Text('Unknown Widget');
    }
  }
}
