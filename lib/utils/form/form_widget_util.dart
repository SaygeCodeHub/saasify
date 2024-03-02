import 'package:flutter/material.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/widgets/formWidgets/date_picker_widget.dart';
import 'package:saasify/widgets/formWidgets/drop_down_widget.dart';
import 'package:saasify/widgets/formWidgets/radio_widget.dart';
import 'package:saasify/widgets/formWidgets/text_field_widget.dart';

class FormWidgetUtil {
  Widget getWidget(Field fieldData) {
    switch (fieldData.fieldType) {
      case 'text':
        return const Text('Text Widget');
      case 'textField':
        return TextFieldWidget(
          label: fieldData.label,
          initialValue: fieldData.userSelection?.textValue,
          hintText: fieldData.placeholder,
          onTextFieldChanged: (value) {
            fieldData.userSelection?.textValue = value;
          },
        );
      case 'datePicker':
        return DatePickerWidget(
          initialDate: DateTime.tryParse(
              fieldData.userSelection?.userSelectedDate ?? ""),
          firstDate: fieldData.datePickerField?.minDate,
          lastDate: fieldData.datePickerField?.maxDate,
          onTextFieldChanged: (value) {
            fieldData.userSelection?.userSelectedDate = value;
          },
        );
      case 'dropdown':
        return DropdownWidget(
            label: fieldData.label,
            initialValue: fieldData.userSelection?.textValue,
            items: fieldData.dropdownField!.options!
                .map((e) =>
                    CustomDropDownItem(label: e.label ?? "", value: e.value))
                .toList(),
            onChanged: (value) {
              fieldData.userSelection?.textValue = value;
            });
      case 'radio':
        return RadioWidget(
            options: fieldData.radioField!.options!,
            initialValue: fieldData.userSelection?.textValue,
            onChanged: (value) {
              fieldData.userSelection?.textValue = value;
            });
      default:
        return const Text('Unknown Widget');
    }
  }
}
