import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String description;
  final String? title;
  final Function? onPressed;

  const ErrorAlertDialog(
      {super.key, required this.description, this.title = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.error, color: AppColors.errorRed),
      title: Text(title!),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed!();
            } else {
              Navigator.pop(context);
            }
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
