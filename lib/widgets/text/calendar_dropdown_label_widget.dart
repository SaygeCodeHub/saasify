import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

class CalendarDropDownLabelWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController dateController;
  const CalendarDropDownLabelWidget({super.key, required this.text, required this.hintText, required this.dateController});

  Future<void> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateController.text = pickedDate.toString().split(" ")[0];
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(spacingSmallest),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.black, fontSize: spacingStandard),
        ),
      ),
      const SizedBox(height: spacingXMedium),
      TextFormField(
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
    ]);
  }
}
