import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';
final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();

class CalendarPopUpLabelWidget extends StatefulWidget {
  // final String text;
  // final String hintText;
  final double? textFieldSize;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController dateController;

  const CalendarPopUpLabelWidget(
      {super.key,
      // required this.text,
      // required this.hintText,
      required this.dateController, this.validator, this.label, this.textFieldSize});

  @override
  State<CalendarPopUpLabelWidget> createState() => _CalendarPopUpLabelWidgetState();
}

class _CalendarPopUpLabelWidgetState extends State<CalendarPopUpLabelWidget> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100, 12, 31));

    if (pickedDate != null) {
      dateController.text = pickedDate.toString().split(" ")[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyy,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.label != null) LabelTextWidget(label: widget.label),
        if (widget.label != null) const SizedBox(height: spacingMedium),
        SizedBox(
          width: widget.textFieldSize ?? MediaQuery.sizeOf(context).width,
          height: widget.textFieldSize ?? MediaQuery.sizeOf(context).height * 0.071,
          child: TextFormField(
              validator: (value) {
                if (value == null) {
                  return 'Please select a value';
                }
                return null;
              },
              controller: widget.dateController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lighterBlack)),
                // hintText: widget.hintText,
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context, widget.dateController),
                  icon: const Icon(Icons.calendar_month_rounded,
                      color: AppColors.black),
                ),
              )),
        ),
      ]),
    );
  }
}
