import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

abstract class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      primary: AppColors.white,
      surface: AppColors.lightCardColor,
      onSurface: AppColors.lightTextColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      primary: AppColors.black,
      surface: AppColors.darkCardColor,
      onSurface: AppColors.darkTextColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
