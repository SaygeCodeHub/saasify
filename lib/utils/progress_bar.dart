import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

import '../configs/app_spacing.dart';

class ProgressBar {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.transparent,
        builder: (context) {
          return const Center(
              child: SizedBox(
                  height: spacingXXHuge,
                  width: spacingXXHuge,
                  child: CircularProgressIndicator()));
        });
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
