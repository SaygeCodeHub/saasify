import 'package:flutter/material.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/widgets/formWidgets/label_date_picker_widget.dart';
import 'package:saasify/widgets/formWidgets/label_drop_down_widget.dart';
import 'package:saasify/widgets/formWidgets/label_radio_widget.dart';
import 'package:saasify/widgets/formWidgets/label_text_field_widget.dart';

class FormWidgetUtil {
  Widget getWidget(Field fieldData) {
    switch (fieldData.fieldType) {
      case 'text':
        return const Text('Text Widget');
      case 'textField':
        return LabelTextFieldWidget(
          label: fieldData.label,
          initialValue: fieldData.userSelection?.textValue,
          maxLines: fieldData.textField?.maxLines,
          hintText: fieldData.placeholder,
          onTextFieldChanged: (value) {
            fieldData.userSelection?.textValue = value;
          },
        );
      case 'datePicker':
        return LabelDatePickerWidget(
          label: fieldData.label,
          initialDate: DateTime.tryParse(
              fieldData.userSelection?.userSelectedDate ?? ""),
          firstDate: fieldData.datePickerField?.minDate,
          lastDate: fieldData.datePickerField?.maxDate,
          onTextFieldChanged: (value) {
            fieldData.userSelection?.userSelectedDate = value;
          },
        );
      case 'dropdown':
        return LabelDropdownWidget(
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
        return LabelRadioWidget(
            label: fieldData.label,
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
