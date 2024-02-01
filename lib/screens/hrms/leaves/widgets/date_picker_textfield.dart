import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/leaves/widgets/custom_text_button.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

typedef StringCallBack = Function(String date);

class DatePickerTextField extends StatefulWidget {
  final DateTime? initialDate;
  final StringCallBack onDateChanged;
  final double? textFieldSize;
  final DateTime? maxDate;
  final String editDate;
  final String? hintText;
  final String? label;
  final DateTime? minimumDate;
  final String? Function(String?)? validator;

  const DatePickerTextField({
    super.key,
    this.initialDate,
    this.maxDate,
    this.textFieldSize,
    this.editDate = '',
    this.hintText,
    this.label,
    this.minimumDate,
    required this.onDateChanged,
    this.validator,
  });

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController dateInputController = TextEditingController();
  bool isFirstTime = true;

  @override
  void initState() {
    dateInputController.text = widget.editDate;
    super.initState();
  }

  void showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              height: kDateTimePickerContainerHeight,
              color: AppColors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: kDateTimePickerHeight,
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: (isFirstTime != false)
                                ? widget.initialDate
                                : DateFormat("yyyy-MM-dd")
                                    .parse(dateInputController.text),
                            onDateTimeChanged: (value) {
                              setState(() {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(value);
                                dateInputController.text = formattedDate;
                                widget.onDateChanged(
                                    DateFormat('yyyy-MM-dd').format(value));
                                isFirstTime = false;
                              });
                            },
                            maximumDate: widget.maxDate)),
                    CustomTextButton(
                        onPressed: () {
                          if (isFirstTime != false) {
                            if (widget.initialDate == null) {
                              dateInputController.text =
                                  DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now());
                              widget.onDateChanged(DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()));
                            } else {
                              dateInputController.text =
                                  DateFormat('yyyy-MM-dd')
                                      .format(widget.initialDate!);
                              widget.onDateChanged(DateFormat('yyyy-MM-dd')
                                  .format(widget.initialDate!));
                            }
                          }
                          Navigator.pop(context);
                        },
                        textValue: StringConstants.kOk)
                  ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.label != null) LabelTextWidget(label: widget.label),
      if (widget.label != null) const SizedBox(height: spacingMedium),
      SizedBox(
        width: widget.textFieldSize ?? MediaQuery.sizeOf(context).width,
        child: TextFormField(
            validator: widget.validator,
            readOnly: true,
            controller: dateInputController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lighterBlack)),
              hintText: widget.hintText,
              suffixIcon: IconButton(
                onPressed: () async {
                  showDatePicker(context);
                },
                icon: const Icon(Icons.calendar_month_rounded,
                    color: AppColors.black),
              ),
            )),
      ),
    ]);
  }
}
