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
      onSecondary: AppColors.lightGreyColor,
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
      onSecondary: AppColors.darkGreyColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
