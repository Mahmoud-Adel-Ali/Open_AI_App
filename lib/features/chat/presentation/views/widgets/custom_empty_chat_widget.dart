import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/app_images.dart';

class CustomEmptyChatWidget extends StatelessWidget {
  const CustomEmptyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppImages.lottieEmptyChatHistory,
      fit: BoxFit.contain,
      height: 200.h,
      width: 200.w,
      alignment: Alignment.center,
    );
  }
}
