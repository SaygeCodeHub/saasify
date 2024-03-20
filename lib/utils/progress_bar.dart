import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

import '../configs/app_spacing.dart';

class ProgressBar {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.black.withOpacity(0.01),
      builder: (context) {
        return Stack(
          children: [
            Container(
              color: AppColors.black.withOpacity(0.01),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.35,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.15,
              child: const Center(
                child: SizedBox(
                  height: spacingXXHuge,
                  width: spacingXXHuge,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
