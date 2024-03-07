import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

ThemeData appTheme = ThemeData(
    useMaterial3: false,
    colorScheme: colorScheme,
    fontFamily: 'PT_Sans',
    splashColor: AppColors.transparent,
    hoverColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    focusColor: AppColors.transparent,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: inputDecorationTheme,
    iconTheme: iconThemeData,
    drawerTheme: drawerThemeData);

AppBarTheme appBarTheme = const AppBarTheme(
    color: AppColors.white,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: AppColors.darkBlue),
    actionsIconTheme: IconThemeData(color: AppColors.orange));
ColorScheme colorScheme = const ColorScheme.light(
  surface: AppColors.white,
  background: AppColors.white,
  primary: AppColors.orange,
);

DrawerThemeData drawerThemeData =
    const DrawerThemeData(backgroundColor: AppColors.white, elevation: 0.0);

IconThemeData iconThemeData = const IconThemeData(color: AppColors.darkBlue);
InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
    filled: true,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    fillColor: AppColors.lightGrey,
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
    errorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: AppColors.errorRed)),
    focusedErrorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: AppColors.errorRed)),
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
    disabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
    hintStyle: TextStyle(
        fontSize: 13, color: AppColors.grey, fontWeight: FontWeight.w500));

// New Text Theme

extension AppTextTheme on TextTheme {
  TextStyle get labelTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w300);
  }

  TextStyle get fieldLabelTextStyle {
    return const TextStyle(
        fontSize: 14, color: AppColors.cementGrey, fontWeight: FontWeight.w500);
  }

  TextStyle get displayLabelTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.darkBlue, fontWeight: FontWeight.w800);
  }

  TextStyle get disabledTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.darkGrey, fontWeight: FontWeight.bold);
  }

  TextStyle get smallWarningTextStyle {
    return const TextStyle(
        fontSize: 8, color: AppColors.orange, fontWeight: FontWeight.w500);
  }

  TextStyle get moduleHeadingTextStyle {
    return const TextStyle(
        fontSize: 24, color: AppColors.darkBlue, fontWeight: FontWeight.w800);
  }

  TextStyle get formSectionHeadingTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.darkBlue, fontWeight: FontWeight.w700);
  }

  TextStyle get churnPathTextStyle {
    return const TextStyle(fontSize: 12, color: AppColors.lightBlue);
  }

  TextStyle get errorTitleTextStyle {
    return const TextStyle(
        fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w800);
  }

  TextStyle get errorSubtitleTextStyle {
    return const TextStyle(
        fontSize: 12, color: AppColors.errorRed, fontWeight: FontWeight.w300);
  }

  TextStyle get cardMobileValueTextStyle {
    return const TextStyle(
        fontSize: 14, color: AppColors.darkBlue, fontWeight: FontWeight.w800);
  }

  TextStyle get cardMobileValueLarge {
    return const TextStyle(
        fontSize: 18, color: AppColors.darkBlue, fontWeight: FontWeight.w800);
  }

  TextStyle get cardMobileHeadingTextStyle {
    return const TextStyle(
        fontSize: 12, color: AppColors.darkBlue, fontWeight: FontWeight.w600);
  }

  TextStyle get cardMobileHeadingLarge {
    return const TextStyle(
        fontSize: 14, color: AppColors.darkBlue, fontWeight: FontWeight.w600);
  }

  TextStyle get userNameTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w500);
  }

  TextStyle get drawerModuleTextStyle {
    return const TextStyle(
        fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500);
  }

  TextStyle get categoryTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600);
  }

  TextStyle get deskTopPageHeader {
    return const TextStyle(
        fontSize: 26, color: AppColors.black, fontWeight: FontWeight.w700);
  }

  TextStyle get statusTextStyle {
    return const TextStyle(
        fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w700);
  }

  TextStyle get subDetailTextStyle {
    return const TextStyle(
        fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500);
  }

  TextStyle get buttonTextStyle {
    return const TextStyle(
        fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w500);
  }

  TextStyle get dialogueHeadingTextStyle {
    return const TextStyle(
        fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w500);
  }

  TextStyle get dialogueContentTextStyle {
    return const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w500);
  }

  TextStyle get headingTextStyle {
    return const TextStyle(
        fontSize: 32, color: AppColors.orange, fontWeight: FontWeight.w500);
  }
}
