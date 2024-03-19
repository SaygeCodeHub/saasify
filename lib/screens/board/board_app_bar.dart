import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

PreferredSizeWidget buildAppBar() {
  return AppBar(
    title: const Expanded(
      child: Text(
        'Board',
        style: TextStyle(
          fontSize: spacingXHuge,
          color: AppColors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    backgroundColor: AppColors.backgroundColor,
  );
}
