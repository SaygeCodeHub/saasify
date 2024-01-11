import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

import 'app_dimensions.dart';

ThemeData newAppTheme = ThemeData(
  useMaterial3: false,
  colorScheme: colorScheme,
  fontFamily: 'PT_Sans',
  splashColor: AppColors.transparent,
  hoverColor: AppColors.transparent,
  highlightColor: AppColors.transparent,
  focusColor: AppColors.transparent,
  scaffoldBackgroundColor: AppColors.white,
  inputDecorationTheme: inputDecorationTheme,
);
ColorScheme colorScheme = const ColorScheme.light(
    surface: AppColors.white,
    background: AppColors.white,
    primary: AppColors.orange);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCircularRadius),
      borderSide: const BorderSide(color: AppColors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCircularRadius),
      borderSide: const BorderSide(color: AppColors.white),
    ),
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    fillColor: AppColors.lightGrey,
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColors.grey)),
    border: const OutlineInputBorder(),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColors.grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColors.grey)),
    hintStyle: const TextStyle(
        fontSize: 13, color: AppColors.grey, fontWeight: FontWeight.w500));

extension AppTextTheme on TextTheme {
  TextStyle get labelTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600);
  }
}
