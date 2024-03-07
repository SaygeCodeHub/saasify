import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class LabelAndTimePickerWidget extends StatelessWidget {
  final String? label;
  final void Function(String) onTextFieldChanged;
  final DateTime? initialDate;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool? enabled;
  final TextEditingController _dateController = TextEditingController();
  final DateTime? firstDate;
  final DateTime? lastDate;

  LabelAndTimePickerWidget(
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
          TextEditingValue(text: DateFormat('hh:mm aaa').format(initialDate!));
    }
    return LabelAndTextFieldWidget(
      label: label,
      textFieldController: _dateController,
      readOnly: true,
      enabled: enabled,
      isRequired: isRequired,
      validator: validator,
      suffixIcon: const Icon(Icons.date_range_outlined),
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((value) {
          String? textValue = (value == null)
              ? ''
              : DateFormat('hh:mm aaa').format(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  value.hour,
                  value.minute));
          _dateController.value = TextEditingValue(text: textValue);
          onTextFieldChanged((value == null)
              ? ''
              : DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, value.hour, value.minute)
                  .toIso8601String());
        });
      },
    );
  }
}
