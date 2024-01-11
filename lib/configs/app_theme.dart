import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  colorScheme: colorScheme,
  fontFamily: 'PT_Sans',
  splashColor: AppColor.saasifyTransparent,
  hoverColor: AppColor.saasifyTransparent,
  highlightColor: AppColor.saasifyTransparent,
  focusColor: AppColor.saasifyTransparent,
  scaffoldBackgroundColor: AppColors.white,
  inputDecorationTheme: inputDecorationTheme,
);

ColorScheme colorScheme = const ColorScheme.light(
    surface: AppColor.saasifyWhite,
    background: AppColor.saasifyWhite,
    primary: AppColor.saasifyLightDeepBlue);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCircularRadius),
      borderSide: const BorderSide(color: AppColor.saasifyGrey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kCircularRadius),
      borderSide: const BorderSide(color: AppColor.saasifyWhite),
    ),
    filled: true,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    fillColor: AppColors.lightGrey,
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColor.saasifyGrey)),
    border: const OutlineInputBorder(),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColor.saasifyRed)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kCircularRadius),
        borderSide: const BorderSide(color: AppColor.saasifyGrey)),
    hintStyle: const TextStyle(
        fontSize: 13,
        color: AppColor.saasifyLightGrey,
        fontWeight: FontWeight.w500));

extension AppTextTheme on TextTheme {
  TextStyle get xxxTiniest {
    return const TextStyle(
        fontSize: 10,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiniest {
    return const TextStyle(
        fontSize: 12,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTiniest {
    return const TextStyle(
        fontSize: 14,
        color: AppColor.saasifyLightBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get tiniest {
    return const TextStyle(
        fontSize: 16,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get tinier {
    return const TextStyle(
        fontSize: 18,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTinier {
    return const TextStyle(
        fontSize: 20,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxxTiny {
    return const TextStyle(
        fontSize: 18,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xxTiny {
    return const TextStyle(
        fontSize: 28,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }

  TextStyle get xTiny {
    return const TextStyle(
        fontSize: 24,
        color: AppColor.saasifyBlack,
        fontWeight: FontWeight.w400);
  }
}
