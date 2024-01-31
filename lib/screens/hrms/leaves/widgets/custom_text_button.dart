import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String textValue;
  final Color textColor;

  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.textValue,
      this.textColor = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          textValue,
          style: TextStyle(color: textColor),
        ));
  }
}
