import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();

class CalendarPopUpLabelWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController dateController;

  const CalendarPopUpLabelWidget(
      {super.key,
      required this.text,
      required this.hintText,
      required this.dateController, this.validator});

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
        Padding(
          padding: const EdgeInsets.all(spacingSmallest),
          child: Text(
            text,
            style: const TextStyle(
                color: AppColors.black, fontSize: spacingStandard),
          ),
        ),
        const SizedBox(height: spacingXMedium),
        TextFormField(
            validator: (value) {
              if (value == null) {
                return 'Please select a value';
              }
              return null;
            },
            controller: dateController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lighterBlack)),
              hintText: hintText,
              suffixIcon: IconButton(
                onPressed: () => _selectDate(context, dateController),
                icon: const Icon(Icons.calendar_month_rounded,
                    color: AppColors.black),
              ),
            )),
      ]),
    );
  }
}
