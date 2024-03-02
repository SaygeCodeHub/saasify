import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class DatePickerWidget extends StatelessWidget {
  final String? label;
  final void Function(String) onTextFieldChanged;
  final DateTime? initialDate;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool? enabled;
  final TextEditingController _dateController = TextEditingController();
  final DateTime? firstDate;
  final DateTime? lastDate;

  DatePickerWidget(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) LabelTextWidget(label: label),
        if (label != null) const SizedBox(height: spacingMedium),
        CustomTextField(
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
              onTextFieldChanged((value == null)
                  ? ''
                  : DateFormat('yyyy-MM-dd').format(value));
            });
          },
        ),
      ],
    );
  }
}
