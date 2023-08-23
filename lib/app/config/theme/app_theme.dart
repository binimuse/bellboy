import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppTheme {
//
//   final ColorScheme lightColorScheme = ColorScheme(
//     primary: AppColors.primaryDark,
//     onPrimary: AppColors.whiteOff,
//
//     secondary: AppColors.accent,
// onSecondary:  AppColors.black,
//
//     surface: AppColors.backgroundLight,
//     onSurface: AppColors.black,
//
//     error: AppColors.danger,
//     onError: AppColors.whiteOff,
//
//     background: AppColors.backgroundLight,
//     onBackground: AppColors.black,
//
//     brightness: Brightness.light,
//   );
//
//   final ColorScheme darkColorScheme = ColorScheme(
//     primary: AppColors.primaryLight,
//     onPrimary: AppColors.whiteOff,
//
//     secondary: AppColors.accentLight,
//     onSecondary:  AppColors.blackLight,
//
//     surface: AppColors.blackLight,
//     onSurface: AppColors.backgroundLight,
//
//     error: AppColors.dangerDark,
//     onError: AppColors.whiteOff,
//
//     background: AppColors.grayDark,
//     onBackground: AppColors.grayLight,
//
//     brightness: Brightness.dark,
//   );

  static final ThemeData light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.whiteOff,
      secondary: AppColors.accent,
      onSecondary: AppColors.black,
      surface: AppColors.backgroundLight,
      onSurface: AppColors.black,
      error: AppColors.danger,
      onError: AppColors.whiteOff,
      background: AppColors.backgroundLight,
      onBackground: AppColors.black,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.whiteOff,
      secondary: AppColors.accentLight,
      onSecondary: AppColors.blackLight,
      surface: AppColors.blackLight,
      onSurface: AppColors.backgroundLight,
      error: AppColors.dangerDark,
      onError: AppColors.whiteOff,
      background: AppColors.grayDark,
      onBackground: AppColors.grayLight,
      brightness: Brightness.dark,
    ),
  );
}

class CustomTextStyles {
  /*
  text color based on app current theme
  color:  AppColors.black,
  */

  static final bodySmall = TextStyle(
    fontSize: AppSizes.font_10,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static final bodyMedium = TextStyle(
    fontSize: AppSizes.font_12,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static final bodyLarge = TextStyle(
    fontSize: AppSizes.font_14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static final headlineSmall = TextStyle(
    fontSize: AppSizes.font_16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static final headlineMedium = TextStyle(
    fontSize: AppSizes.font_18,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static final headlineLarge = TextStyle(
    fontSize: AppSizes.font_20,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );
}
