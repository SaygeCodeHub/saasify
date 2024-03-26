import 'package:flutter/material.dart';

import 'lable_and_textfield_widget.dart';

Widget buildTextField(TextEditingController controller, String label,
    IconData icon, bool isRequired,
    {int maxLines = 1}) {
  return LabelAndTextFieldWidget(
    prefixIcon: Icon(icon),
    label: label,
    isRequired: isRequired,
    textFieldController: controller,
    maxLines: maxLines,
  );
}