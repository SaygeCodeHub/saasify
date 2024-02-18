import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../configs/app_spacing.dart';
import 'custom_text_field.dart';
import 'label_text_widget.dart';

class TimePickerPopUp extends StatelessWidget {
  final String label;
  final bool isRequired;
  final dynamic initialValue;
  final void Function(String?)? onTextFieldChanged;
  final String? Function(String?)? validator;

  const TimePickerPopUp(
      {super.key,
      required this.label,
      required this.isRequired,
      this.initialValue,
      this.onTextFieldChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    DateTime apiDateFormat = initialValue ?? DateTime.now();
    textEditingController.text =
        initialValue != null ? DateFormat("hh:mm a").format(apiDateFormat) : "";
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LabelTextWidget(label: label),
          const SizedBox(height: spacingMedium),
          CustomTextField(
              onTextFieldChanged: onTextFieldChanged,
              isRequired: isRequired,
              readOnly: true,
              onTap: () async {
                final TimeOfDay? pickedDate = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: apiDateFormat.hour,
                        minute: apiDateFormat.minute));

                if (pickedDate != null) {
                  apiDateFormat = DateTime.parse(DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          pickedDate.hour,
                          pickedDate.minute)
                      .toIso8601String());
                  textEditingController.text =
                      DateFormat("hh:mm a").format(apiDateFormat);
                  onTextFieldChanged!(apiDateFormat.toIso8601String());
                }
              },
              initialValue: initialValue != null
                  ? DateFormat("hh:mm a").format(initialValue)
                  : null,
              textFieldController: textEditingController,
              validator: validator,
              suffixIcon: const Icon(Icons.access_time_outlined))
        ]);
  }
}
