import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

import 'custom_text_field.dart';

class TimePopUpLabelWidget extends StatefulWidget {
  final String label;
  final bool isRequired;
  final dynamic initialValue;
  final void Function(String?)? onTextFieldChanged;
  final String? Function(String?)? validator;

  const TimePopUpLabelWidget({
    super.key,
    required this.label,
    required this.isRequired,
    this.onTextFieldChanged,
    this.initialValue,
    this.validator,
  });

  @override
  TimePopUpLabelWidgetState createState() => TimePopUpLabelWidgetState();
}

class TimePopUpLabelWidgetState extends State<TimePopUpLabelWidget> {
  DateTime apiDateFormat = DateTime.now();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    apiDateFormat = widget.initialValue ?? DateTime.now();
    textEditingController.text = widget.initialValue != null
        ? DateFormat("hh:mm a").format(apiDateFormat)
        : "";
    super.initState();
  }

  void _selectDate() async {
    final TimeOfDay? pickedDate = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay(hour: apiDateFormat.hour, minute: apiDateFormat.minute));

    if (pickedDate != null) {
      setState(() {
        apiDateFormat = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, pickedDate.hour, pickedDate.minute);
      });
      textEditingController.text = DateFormat("hh:mm a").format(apiDateFormat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LabelTextWidget(label: widget.label),
          const SizedBox(height: spacingMedium),
          CustomTextField(
              onTextFieldChanged: (String? value) {
                widget.onTextFieldChanged!(apiDateFormat.toString());
              },
              isRequired: widget.isRequired,
              readOnly: true,
              onTap: _selectDate,
              initialValue: widget.initialValue != null
                  ? DateFormat("hh:mm a").format(widget.initialValue)
                  : null,
              textFieldController: textEditingController,
              validator: widget.validator,
              suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _selectDate))
        ]);
  }
}
