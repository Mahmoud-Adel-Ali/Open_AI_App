import 'package:flutter/material.dart';

abstract class AppColors {
  // Common colors
  static const Color mainColor = Color(0xFF6200EE); // A seed color for theming
  static const Color accentColor = Color(0xFFFF5722); // Accent/secondary color

  // Light theme colors
  static const Color white = Colors.white;
  static const Color lightBackground = Color(0xFFF5F5F5); // Light background
  static const Color lightTextColor = Color(0xFF000000); // Black for text
  static const Color lightCardColor = Color(0xFFFFFFFF); // White cards

  // Dark theme colors
  static const Color black = Colors.black;
  static const Color darkBackground = Color(0xFF121212); // Dark background
  static const Color darkTextColor = Color(0xFFFFFFFF); // White for text
  static const Color darkCardColor = Color(0xFF1E1E1E); // Dark gray cards

  // Additional custom colors
  static const Color success = Color(0xFF4CAF50); // Green for success messages
  static const Color warning = Color(0xFFFFC107); // Amber for warnings
  static const Color error = Color(0xFFF44336); // Red for errors
  static const Color info = Color(0xFF2196F3); // Blue for informational messages
}
