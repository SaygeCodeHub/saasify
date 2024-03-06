import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/widgets/formWidgets/label_text_field_widget.dart';

class LabelDatePickerWidget extends StatelessWidget {
  final String? label;
  final void Function(String) onTextFieldChanged;
  final DateTime? initialDate;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool? enabled;
  final TextEditingController _dateController = TextEditingController();
  final DateTime? firstDate;
  final DateTime? lastDate;

  LabelDatePickerWidget(
      {super.key,
      this.enabled,
      this.label,
      required this.onTextFieldChanged,
      this.initialDate,
      this.isRequired = false,
      this.validator,
      this.firstDate,
      this.lastDate});

  @override
  Widget build(BuildContext context) {
    if (initialDate != null) {
      _dateController.value =
          TextEditingValue(text: DateFormat('dd-MM-yyyy').format(initialDate!));
    }
    return LabelTextFieldWidget(
      label: label,
      textFieldController: _dateController,
      readOnly: true,
      enabled: enabled,
      isRequired: isRequired,
      validator: validator,
      suffixIcon: const Icon(Icons.date_range_outlined),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(DateTime.now().year - 100),
          lastDate: lastDate ?? DateTime(DateTime.now().year + 100),
        ).then((value) {
          String? textValue =
              (value == null) ? '' : DateFormat('dd-MM-yyyy').format(value);
          _dateController.value = TextEditingValue(text: textValue);
          onTextFieldChanged(
              (value == null) ? '' : DateFormat('yyyy-MM-dd').format(value));
        });
      },
    );
  }
}
