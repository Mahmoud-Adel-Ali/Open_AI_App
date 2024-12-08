import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_colors.dart';

abstract class Styless {
  //12
  static const TextStyle textSimeBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
  //14
  static const TextStyle textSimeBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
  static const TextStyle textRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
  //18
  static const TextStyle textSimeBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
  //20
  static const TextStyle textMedium20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );
  //24
  static const TextStyle textBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Orbitron',
    color: AppColors.darkTextColor,
  );
  //48
  static const TextStyle textBold48 = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Orbitron',
    color: AppColors.darkTextColor,
  );
}
